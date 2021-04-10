<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('orders');
        Schema::dropIfExists('inform_orders');

        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('travel_id');
            $table->double('quality', 11, 2);
            $table->double('price', 11, 2);
            $table->double('amount', 11, 2);
            $table->timestamps();
        });

        Schema::create('inform_orders', function (Blueprint $table) {
            $table->id();
            $table->integer('order_id');
            $table->string('name', 99);
            $table->string('email', 99);
            $table->string('phone', 99);
            $table->string('address', 99);
            $table->text('note')->nullable();
            $table->tinyInteger('payment_method');
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
        Schema::dropIfExists('orders');
    }
}
