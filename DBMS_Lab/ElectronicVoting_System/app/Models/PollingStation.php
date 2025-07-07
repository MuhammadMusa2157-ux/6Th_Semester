<?php

namespace App\Models; // IMPORTANT: Must be in this namespace

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PollingStation extends Model // IMPORTANT: Class name must match file name
{
    use HasFactory;

    // If your table name is not 'polling_stations', define it:
    // protected $table = 'your_polling_station_table_name';

    // If your primary key is not 'id' (e.g., 'PollingStationID'), define it:
    protected $primaryKey = 'PollingStationID'; // Assuming your primary key is 'PollingStationID'

    // If 'PollingStationID' is not auto-incrementing, uncomment this:
    // public $incrementing = false;

    // If 'PollingStationID' is a string (UUID, etc.) and not integer, uncomment this:
    // protected $keyType = 'string';

    // Define which attributes are mass assignable if you use PollingStation::create()
    protected $fillable = [
        'PollingStationID', // or whatever fields your polling_stations table has for creation/update
        'Name',
        'Location',
        // ... other polling station fields
    ];
}