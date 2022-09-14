<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRideRatingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ride_rating', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('ride_user_id');
            $table->unsignedBigInteger('ride_id');
            $table->integer('rating');
            $table->timestamps();
            $table->foreign('ride_user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('ride_id')->references('id')->on('ride')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ride_rating');
    }
}
