<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;

class User extends \TCG\Voyager\Models\User
{
    use HasFactory, Notifiable;

    /**
     * User have a information
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function informUser() {
        return $this->hasOne(InformUser::class, "user_id", "id");
    }
}
