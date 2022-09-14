<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePickupAddressTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pickup_address', function (Blueprint $table) {
            $table->id();
            $table->longText('address')->nullable(false);
            $table->bigInteger('longitude')->unsigned()->nullable(false);
            $table->bigInteger('latitude')->unsigned()->nullable(false);
            $table->string('city')->nullable();
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
        Schema::dropIfExists('pickup_address');
    }
}
