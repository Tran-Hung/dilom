<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Travel extends Model
{
    use HasFactory;

    protected $table = "travels";
    protected $guarded = [];

    public function getPriceAttribute($value)
    {
        return format_money($value);
    }
    public function setPriceAttribute($value) {
        return replace_char(',', '', $value);
    }

    /**
     * Get travel images
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function travelImages() {
        return $this->hasMany(TravelImage::class);
    }

    /**
     * Get travel content
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function travelContent() {
        return $this->hasOne(TravelContent::class);
    }

}
