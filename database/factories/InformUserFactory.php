<?php

namespace Database\Factories;

use App\Models\InformUser;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class InformUserFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = InformUser::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "user_id" => User::factory(),
            "phone" => $this->faker->phoneNumber,
            "address" => $this->faker->address,
        ];
    }
}
