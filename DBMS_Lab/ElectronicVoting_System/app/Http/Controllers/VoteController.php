<?php

namespace App\Http\Controllers;

use App\Models\Vote; // Ensures the Vote model is recognized
use App\Models\Candidate; // Ensures the Candidate model is recognized
use App\Models\Election; // Ensures the Election model is recognized
use App\Models\Voter; // Ensures the Voter model is recognized (needed for validation)
use App\Models\PollingStation; // Ensures the PollingStation model is recognized (needed for validation)
use Illuminate\Http\Request;
use Illuminate\Http\Response; // For general HTTP responses (e.g., when noContent() is used elsewhere)
use Illuminate\Http\JsonResponse; // Specifically for methods returning JSON data
use Illuminate\Support\Facades\DB; // For database queries

class VoteController extends Controller
{
    /**
     * Display a listing of all votes.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        // Fetches all votes and returns them as a JSON response with a 200 status.
        return response()->json(Vote::all(), 200);
    }

    /**
     * Store a newly created vote in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return JsonResponse
     */
    public function store(Request $request): JsonResponse
    {
        // Validate the incoming request data against defined rules.
        // The 'exists' rules ensure that the provided IDs (VoterID, CandidateID, etc.)
        // correspond to existing records in their respective tables.
        $validatedData = $request->validate([
            'VoterID' => 'required|integer|exists:voters,VoterID',
            'CandidateID' => 'required|integer|exists:candidates,CandidateID',
            'ElectionID' => 'required|integer|exists:elections,ElectionID',
            'PollingStationID' => 'required|integer|exists:polling_stations,PollingStationID',
        ]);

        // Check for duplicate votes: a voter should only be able to cast one vote per election.
        $existingVote = Vote::where('VoterID', $validatedData['VoterID'])
                            ->where('ElectionID', $validatedData['ElectionID'])
                            ->first();

        if ($existingVote) {
            // If a duplicate vote is found, return a 409 Conflict status with a message.
            return response()->json(['message' => 'Voter has already cast a vote in this election.'], 409);
        }

        // Create a new vote record using the validated data.
        // Ensure that the columns 'VoterID', 'CandidateID', 'ElectionID', and 'PollingStationID'
        // are listed in the `$fillable` property of your `App\Models\Vote` model.
        $vote = Vote::create($validatedData);

        // Return the newly created vote record as a JSON response with a 201 Created status.
        return response()->json($vote, 201);
    }

    /**
     * Check if a specific voter has already cast a vote in a given election.
     *
     * @param  int  $electionId The ID of the election.
     * @param  int  $voterId    The ID of the voter.
     * @return JsonResponse
     */
    public function hasVoted(int $electionId, int $voterId): JsonResponse
    {
        // Query to check if a vote exists for the provided election and voter IDs.
        $hasVoted = Vote::where('ElectionID', $electionId)
                        ->where('VoterID', $voterId)
                        ->exists();

        // Return a JSON response indicating whether the voter has voted ('has_voted': true/false).
        return response()->json(['has_voted' => $hasVoted], 200);
    }

    /**
     * Get the current vote counts for candidates in a specific election.
     * This provides the results of an election.
     *
     * @param  int  $electionId The ID of the election.
     * @return JsonResponse
     */
    public function getCandidateVotes(int $electionId): JsonResponse
    {
        // Perform a database query to join the 'votes' table with the 'candidates' table.
        // It counts the votes for each candidate within the specified election.
        $results = DB::table('votes')
                     ->select(
                         'candidates.Name',
                         'candidates.Party',
                         DB::raw('COUNT(votes.VoteID) as VoteCount')
                     )
                     ->join('candidates', 'votes.CandidateID', '=', 'candidates.CandidateID')
                     ->where('votes.ElectionID', $electionId)
                     ->groupBy('candidates.CandidateID', 'candidates.Name', 'candidates.Party')
                     ->orderByDesc('VoteCount') // Order results by vote count in descending order
                     ->get();

        // If no results are found (i.e., no votes for this election yet),
        // check if the election itself actually exists.
        if ($results->isEmpty()) {
            // Use the Election model to check for the election's existence.
            $electionExists = Election::where('ElectionID', $electionId)->exists();
            if (!$electionExists) {
                // If the election does not exist, return a 404 Not Found error.
                return response()->json(['message' => 'Election not found.'], 404);
            }
            // If the election exists but has no votes, an empty result set is returned, which is correct.
        }

        // Return the election results (candidate names, parties, and vote counts) as a JSON response.
        return response()->json($results, 200);
    }
}