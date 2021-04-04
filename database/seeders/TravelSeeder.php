<?php

namespace Database\Seeders;

use App\Models\Travel;
use App\Models\TravelContent;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TravelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::transaction(function ($q) {
            Travel::factory(10)->create()->each(function ($travel) {
                $travel->travelContent()->saveMany(TravelContent::factory(1)->create([
                    "travel_id" => $travel->id,
                ]));
            });
        });
    }
}
