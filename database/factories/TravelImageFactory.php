<?php

namespace Database\Factories;

use App\Models\TravelImage;
use Illuminate\Database\Eloquent\Factories\Factory;

class TravelImageFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = TravelImage::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "image" => "default.jpg"
        ];
    }
}
