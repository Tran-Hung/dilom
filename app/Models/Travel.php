<?php

namespace App\Models;

use Carbon\Carbon;
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
    public function getRangeDaysAttribute() {
        $range = Carbon::parse($this->check_in_at)->diffInDays(Carbon::parse($this->check_out_at));
        return $range ." days";
    }
    public function getRangeFormatAttribute() {
        return $this->check_in_at ." ~ ". $this->check_out_at;
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

    /**
     * Belong to location
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function location() {
        return $this->belongsTo(Location::class);
    }
}
