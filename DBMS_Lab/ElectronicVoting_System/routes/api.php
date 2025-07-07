// routes/api.php
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\VoteController; // Don't forget this!

// ... other routes ...

Route::get('/votes', [VoteController::class, 'index']);
Route::post('/votes', [VoteController::class, 'store']);

// Ensure the route parameters match the controller's type hints (e.g., {electionId} and {voterId})
Route::get('/elections/{electionId}/voters/{voterId}/has-voted', [VoteController::class, 'hasVoted']);
Route::get('/elections/{electionId}/results', [VoteController::class, 'getCandidateVotes']);

// 