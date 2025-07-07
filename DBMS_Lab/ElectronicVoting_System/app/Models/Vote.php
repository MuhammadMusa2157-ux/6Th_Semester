<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{
    use HasFactory;
    protected $primaryKey = 'VoteID'; // Assuming your primary key is 'VoteID'
    public $incrementing = false; // If VoterID/etc are not auto-incrementing
    // If VoteID is a string like UUID
    // protected $keyType = 'string';

    protected $fillable = [
        'VoterID',
        'CandidateID',
        'ElectionID',
        'PollingStationID',
        // Add any other columns you intend to mass-assign
    ];
}