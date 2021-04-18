<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\houseModel;
use App\Models\model_has_rolesModel;
use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
//         \App\Models\User::factory(10)->create();
//        model_has_rolesModel::factory(10)->create();
        User::factory(20)->create();
//        houseModel::factory(10)->create();
    }
}
