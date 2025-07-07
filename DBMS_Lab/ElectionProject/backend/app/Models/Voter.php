<?php
// ElectionProject/backend/app/Models/Voter.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable; // Use Authenticatable for login
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Voter extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens; // Add HasApiTokens for Sanctum

    protected $table = 'voters'; // Explicitly define table name
    protected $fillable = [
        'name',
        'email',
        'password',
        'voter_registration_date',
        'regular_voter_status',
    ];

    protected $hidden = [
        'password',
    ];

    /**
     * Get the votes cast by the voter.
     */
    public function votes()
    {
        return $this->hasMany(Vote::class);
    }
}
