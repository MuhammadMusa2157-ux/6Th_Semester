<?php

namespace App\Http\Controllers;

use App\Models\Voter;
use Illuminate\Http\Request;
use Illuminate\Http\Response; // Ensure this is imported

class VoterController extends Controller
{
    // ... other methods ...

    public function destroy(string $VoterID): Response {
        $voter = Voter::find($VoterID);
        if (!$voter) {
            return response(['message' => 'Voter not found'], 404);
        }
        $voter->delete();
        // CORRECTED LINE: Use noContent() for a 204 response
        return response()->noContent(); // This properly returns a 204 No Content response
    }
}