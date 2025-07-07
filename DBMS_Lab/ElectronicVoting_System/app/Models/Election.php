<?php

namespace App\Models; // Must be this namespace

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Election extends Model // Class name must match file name
{
    use HasFactory;

    // If your primary key is not 'id' or table name is not 'elections', configure it
    // protected $primaryKey = 'ElectionID';
    // protected $table = 'your_elections_table_name';

    // Add fillable properties if you use mass assignment for Election
    // protected $fillable = ['Name', 'StartDate', 'EndDate', ...];
}