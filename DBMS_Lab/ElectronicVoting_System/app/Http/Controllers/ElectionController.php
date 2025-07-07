<?php

namespace App\Http\Controllers;

use App\Models\Election;
use Illuminate\Http\Request;
use Illuminate\Http\Response; // Ensure this is imported

class ElectionController extends Controller
{
    // ... other methods ...

    public function destroy(string $ElectionID): Response {
        $election = Election::find($ElectionID);
        if (!$election) {
            return response(['message' => 'Election not found'], 404);
        }
        $election->delete();
        // CORRECTED LINE: Use noContent() for a 204 response
        return response()->noContent();
    }
}