<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InformOrder extends Model
{
    use HasFactory;

    protected $table = "inform_orders";
    protected $guarded = [];
}
