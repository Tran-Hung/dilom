<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Admin
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

// User
Auth::routes();


Route::get('/', [\App\Http\Controllers\HomeController::class, "index"])->name("index");

Route::get('/travels/{id}', [\App\Http\Controllers\TravelController::class, "show"])->name('travels.show');
Route::get('/travels', [\App\Http\Controllers\TravelController::class, "index"])->name('travels');

