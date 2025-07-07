<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use Illuminate\Http\Request;
use Illuminate\Http\Response; // Ensure this is imported

class CandidateController extends Controller
{
    // ... other methods ...

    public function destroy(string $CandidateID): Response {
        $candidate = Candidate::find($CandidateID);
        if (!$candidate) {
            return response(['message' => 'Candidate not found'], 404);
        }
        $candidate->delete();
        // CORRECTED LINE: Use noContent() for a 204 response
        return response()->noContent();
    }
}