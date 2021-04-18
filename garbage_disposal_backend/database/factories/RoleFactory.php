<?php

namespace Database\Factories;

use App\Models\Model;
use App\Models\model_has_rolesModel;
use Illuminate\Database\Eloquent\Factories\Factory;

class RoleFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = model_has_rolesModel::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'role_id' => $this->faker->numberBetween($min = 1, $max = 3),
            'model_type' => 'App\Models\User',
            'model_id' => function() {
                return factory(model_has_rolesModel::class)->create()->id;
            }
        ];
    }
}
