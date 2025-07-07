<?php

namespace App\Models; // <-- IMPORTANT: Must be in this namespace

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Voter extends Model // <-- IMPORTANT: Class name must match file name
{
    use HasFactory;

    // If your table name is not 'voters', define it:
    // protected $table = 'your_voter_table_name';

    // If your primary key is not 'id' (e.g., 'VoterID'), define it:
    protected $primaryKey = 'VoterID'; // Assuming your primary key is 'VoterID' as per your validation rules

    // If 'VoterID' is not auto-incrementing, uncomment this:
    // public $incrementing = false;

    // If 'VoterID' is a string (UUID, etc.) and not integer, uncomment this:
    // protected $keyType = 'string';

    // Define which attributes are mass assignable if you use Voter::create()
    protected $fillable = [
        'VoterID', // or whatever fields your voters table has for creation/update
        'Name',
        'Email',
        // ... other voter fields
    ];
}