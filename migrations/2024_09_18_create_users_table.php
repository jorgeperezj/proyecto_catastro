<?php

use Illuminate\Database\Capsule\Manager as Capsule;

Capsule::schema()->create('users', callback: function ($table) {
    $table->increments('id');
    $table->string('email')->unique();
    $table->string('password');
    $table->timestamps();
});
