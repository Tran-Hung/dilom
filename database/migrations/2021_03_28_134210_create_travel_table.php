<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTravelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('travels', function (Blueprint $table) {
            $table->id();
            $table->integer('location_id');
            $table->integer('limit_user');
            $table->timestamp('check_in_at');
            $table->timestamp('check_out_at');
            $table->timestamps();
        });
        Schema::create('travels_images', function (Blueprint $table) {
            $table->id();
            $table->integer('travel_id');
            $table->string('url', 199);
            $table->timestamps();
        });
        Schema::create('travels_contents', function (Blueprint $table) {
            $table->id();
            $table->integer('travel_id');
            $table->text('content');
            $table->timestamps();
        });
        Schema::create('travels_prices', function (Blueprint $table) {
            $table->id();
            $table->integer('travel_id');
            $table->text('price');
            $table->text('price_type');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('travel');
    }
}
