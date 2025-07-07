<?php

namespace App\Http\Controllers;

use App\Models\PollingStation;
use Illuminate\Http\Request;
use Illuminate\Http\Response; // Ensure this is imported

class PollingStationController extends Controller
{
    // ... other methods ...

    public function destroy(string $PollingStationID): Response {
        $pollingStation = PollingStation::find($PollingStationID);
        if (!$pollingStation) {
            return response(['message' => 'Polling Station not found'], 404);
        }
        $pollingStation->delete();
        // CORRECTED LINE: Use noContent() for a 204 response
        return response()->noContent();
    }
}