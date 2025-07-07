<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Candidate extends Model
{
    use HasFactory;

    // If your table name is not 'candidates', define it:
    // protected $table = 'your_candidate_table_name';

    // If your primary key is not 'id' (e.g., 'CandidateID'), define it:
    protected $primaryKey = 'CandidateID';

    // If 'CandidateID' is not auto-incrementing, uncomment this:
    // public $incrementing = false;

    // If 'CandidateID' is a string (UUID, etc.) and not integer, uncomment this:
    // protected $keyType = 'string';

    // Define which attributes are mass assignable if you use Candidate::create() or update()
    protected $fillable = [
        'Name',
        'Party',
        // ... other candidate fields
    ];
}