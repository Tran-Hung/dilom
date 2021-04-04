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
        Schema::dropIfExists('travels');
        Schema::dropIfExists('travels_images');
        Schema::dropIfExists('travels_contents');

        Schema::create('travels', function (Blueprint $table) {
            $table->id();
            $table->integer('location_id');
            $table->string('name', 99);
            $table->string('image', 199);
            $table->integer('price');
            $table->integer('limit_user');
            $table->date('check_in_at');
            $table->date('check_out_at');
            $table->timestamps();
        });
        Schema::create('travels_images', function (Blueprint $table) {
            $table->id();
            $table->integer('travel_id');
            $table->string('image', 199);
            $table->timestamps();
        });
        Schema::create('travels_contents', function (Blueprint $table) {
            $table->id();
            $table->integer('travel_id');
            $table->text('content')->nullable();
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
