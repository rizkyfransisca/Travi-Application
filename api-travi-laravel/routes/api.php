<?php

use App\Http\Controllers\API\TourPackageController;
use App\Http\Controllers\API\EventFestivalController;
use App\Http\Controllers\API\DestinationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/tour-package', [TourPackageController::class, 'index']);
Route::get('/event-festival', [EventFestivalController::class, 'index']);
Route::get('/destination', [DestinationController::class, 'index']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
