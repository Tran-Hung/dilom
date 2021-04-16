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

Auth::routes();

Route::get('/', [\App\Http\Controllers\HomeController::class, "index"])->name("index");

// Travels
Route::group([
    'prefix' => 'travels',
], function () {
    Route::post('/', [\App\Http\Controllers\TravelController::class, "store"])->name('travels.store');

    Route::get('booking/{id}', [\App\Http\Controllers\TravelController::class, "booking"])->name('travels.booking');
    Route::get('{id}', [\App\Http\Controllers\TravelController::class, "show"])->name('travels.show');
    Route::get('/', [\App\Http\Controllers\TravelController::class, "index"])->name('travels');

});

// Orders
Route::group([
    'prefix' => 'orders',
    'middleware' => 'auth',
], function () {
    Route::get('/data', [\App\Http\Controllers\OrderController::class, "ordersData"])->name('orders.data');

    Route::get('{id}', [\App\Http\Controllers\OrderController::class, "show"])->name('orders.show');
    Route::get('/', [\App\Http\Controllers\OrderController::class, "index"])->name('orders');
});

// Localization
Route::get('locale/{locale}', function ($locale) {
    \Illuminate\Support\Facades\Session::put('locale', $locale);
    return redirect()->back();
})->name('locale');
