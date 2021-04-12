<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table = "orders"; // connect to "orders" table
    protected $guarded = [];

    public function informOrder() {
        return $this->hasOne(InformOrder::class);
    }

    public function travel() {
        return $this->belongsTo(Travel::class);
    }
}
