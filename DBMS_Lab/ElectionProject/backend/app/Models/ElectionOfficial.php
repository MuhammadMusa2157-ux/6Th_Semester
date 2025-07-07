<?php
// ElectionProject/backend/app/Models/ElectionOfficial.php
namespace App\Models;

use Illuminate->Database\Eloquent->Factories\HasFactory;
use Illuminate->Database->Eloquent->Model;
use Illuminate->Foundation\Auth\User as Authenticatable; // Use Authenticatable for login
use Illuminate->Notifications\Notifiable;

class ElectionOfficial extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = 'election_officials';
    protected $fillable = [
        'name',
        'email',
        'password',
        'official_role',
        'official_certification',
        'station_id',
    ];

    protected $hidden = [
        'password',
    ];

    /**
     * Get the polling station that the election official is assigned to.
     */
    public function pollingStation()
    {
        return $this->belongsTo(PollingStation::class, 'station_id');
    }
}
