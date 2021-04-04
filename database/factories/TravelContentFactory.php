<?php

namespace Database\Factories;

use App\Models\Travel;
use App\Models\TravelContent;
use Illuminate\Database\Eloquent\Factories\Factory;

class TravelContentFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = TravelContent::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "content" => $this->faker->text
        ];
    }
}
