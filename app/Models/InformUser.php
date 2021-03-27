<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InformUser extends Model
{
    use HasFactory;
    protected $table = "inform_users";

    protected $fillable = [
        "phone",
        "address",
    ];
}
