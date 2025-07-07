<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\VoteController;
use App\Http\Controllers\CandidateController; // Don't forget to import your controllers

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Default welcome route (Laravel's standard)
Route::get('/', function () {
    return view('welcome');
});

// --- Routes for VoteController ---
// You would typically not expose ALL votes directly via a web route for users.
// This might be for an admin dashboard or testing.
Route::get('/votes', [VoteController::class, 'index'])->name('votes.index');

// Route for casting a new vote
// If this is a form submission, Laravel's CSRF protection will apply automatically.
// If it's an AJAX call, ensure you're sending the CSRF token.
Route::post('/votes', [VoteController::class, 'store'])->name('votes.store');

// Route to check if a specific voter has voted in a specific election
// Parameters: {electionId} (integer), {voterId} (integer)
// Example: GET /elections/1/voters/101/has-voted
Route::get('/elections/{electionId}/voters/{voterId}/has-voted', [VoteController::class, 'hasVoted'])->name('votes.hasVoted');

// Route to get election results (candidate vote counts) for a specific election
// Parameter: {electionId} (integer)
// Example: GET /elections/1/results
Route::get('/elections/{electionId}/results', [VoteController::class, 'getCandidateVotes'])->name('elections.results');


// --- Routes for CandidateController ---
// Route to delete a candidate
// This is typically done via a form with a DELETE method or an AJAX call.
// Ensure CSRF token is sent if making an AJAX call.
Route::delete('/candidates/{CandidateID}', [CandidateController::class, 'destroy'])->name('candidates.destroy');

// Example of a route that would display a form to delete a candidate
// Route::get('/candidates/{CandidateID}/delete', function ($CandidateID) {
//     return view('candidates.delete', ['candidateId' => $CandidateID]);
// })->name('candidates.confirm_delete');