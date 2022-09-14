<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRideTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ride', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('departure_date')->nullable(false);
            $table->string('departure_time')->nullable(false);
            $table->string('status')->nullable(false);
            $table->integer('noOfSeats')->nullable(false);
            $table->bigInteger('fare')->unsigned()->nullable(false);
            $table->longText('description')->nullable();
            $table->unsignedBigInteger('pickup_id');
            $table->unsignedBigInteger('dropOff_id');
            $table->unsignedBigInteger('vehicle_id');
            $table->timestamps();
 
            // foreign keys
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('dropOff_id')->references('id')->on('drop_address')->onDelete('cascade');       
            $table->foreign('pickup_id')->references('id')->on('pickup_address')->onDelete('cascade');
            $table->foreign('vehicle_id')->references('id')->on('user_vehicle')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ride');
    }
}
