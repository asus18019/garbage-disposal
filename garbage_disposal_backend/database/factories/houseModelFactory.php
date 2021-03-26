<?php

namespace Database\Factories;

use App\Models\houseModel;
use Illuminate\Database\Eloquent\Factories\Factory;

class houseModelFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = houseModel::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'houseTitle' => $this->faker->company,
            'location' => $this->faker->address,
            'description' => $this->faker->sentence($nbWords = 6, $variableNbWords = true),
        ];
    }
}
