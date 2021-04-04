<?php

namespace Database\Factories;

use App\Models\TravelPrice;
use Illuminate\Database\Eloquent\Factories\Factory;

class TravelPriceFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = TravelPrice::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "price" => $this->faker->numberBetween(15000, 300000),
            "price_type" => 1,
        ];
    }
}
