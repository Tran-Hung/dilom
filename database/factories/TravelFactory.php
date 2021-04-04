<?php

namespace Database\Factories;

use App\Models\Location;
use App\Models\Travel;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;

class TravelFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Travel::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "location_id" => Location::inRandomOrder()->first(),
            "name" => $this->faker->title,
            "image" => "default.png",
            "price" => $this->faker->numberBetween(150000, 600000),
            "limit_user" => rand(2, 50),
            "check_in_at" => Carbon::now()->addDays(rand(1, 4)),
            "check_out_at" => Carbon::now()->addDays(rand(6, 10)),
        ];
    }
}
