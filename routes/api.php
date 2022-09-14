<?php

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


//User Api Routes
Route::post('user/register', [App\Http\Controllers\API\AuthController::class, 'register']);
Route::post('user/login', [App\Http\Controllers\API\AuthController::class, 'login']);

//Protecting Routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    
    //APi route for Authenticated Users
    Route::get('/user', function(Request $request) {
        return auth()->user();
    });
    Route::post('/user', function(Request $request) {
        return auth()->user();
    });
    Route::post('user/logout', [App\Http\Controllers\API\AuthController::class, 'logout']);
    Route::post('user/update', [App\Http\Controllers\API\AuthController::class, 'updateUser']);

    Route::post('user/token', [App\Http\Controllers\FcmTokensController::class, 'index']);
    Route::post('user/token/create', [App\Http\Controllers\FcmTokensController::class, 'store']);
    Route::post('user/token/update', [App\Http\Controllers\FcmTokensController::class, 'update']);
    Route::post('user/token/destroy', [App\Http\Controllers\FcmTokensController::class, 'destroy']);

    Route::post('user/ip/save', [App\Http\Controllers\UserIpController::class, 'store']);
    
    Route::post('user/address', [App\Http\Controllers\UserAddressController::class, 'index']);
    Route::post('user/address/save', [App\Http\Controllers\UserAddressController::class, 'store']);
    Route::post('user/address/update', [App\Http\Controllers\UserAddressController::class, 'update']);
    Route::post('user/address/destroy', [App\Http\Controllers\UserAddressController::class, 'destroy']);
  
  
    Route::post('user/vehicle', [App\Http\Controllers\UserVehicleController::class, 'index']);
    Route::post('user/vehicle/save', [App\Http\Controllers\UserVehicleController::class, 'store']);
    Route::post('user/vehicle/update', [App\Http\Controllers\UserVehicleController::class, 'update']);
    Route::post('user/vehicle/destroy', [App\Http\Controllers\UserVehicleController::class, 'destroy']);
    
    Route::post('user/ride/save', [App\Http\Controllers\RideController::class, 'store']);
    Route::post('user/ride/destroy', [App\Http\Controllers\RideController::class, 'destroy']);
    
    // ---- IN PROGRESS-----------------//
    Route::post('user/ride/update', [App\Http\Controllers\RideController::class, 'update']);
    // ---- IN PROGRESS CLOSING---------//
    
    
    Route::post('user/ride-request', [App\Http\Controllers\RideRequestController::class, 'store']);
    Route::post('user/ride-request/accept', [App\Http\Controllers\RideRequestController::class, 'save']);
    
    
    Route::post('user/ride/rating/save', [App\Http\Controllers\RideRatingController::class, 'store']);
    
    Route::post('user/report', [App\Http\Controllers\AppReportsController::class, 'store']);

    // ----------- LEFT TO MAKE---------------------// 
    //    ride history
    //    ride report
    //    ride details update
    //-------------LEFT TO MAKE CLOSING -------------//

});


Route::get('/rides', [App\Http\Controllers\RideController::class, 'index']);
Route::get('/ride/{id}', [App\Http\Controllers\RideController::class, 'show']);



// Route::domain('api.127.0.0.1:8000')->group(function(){
//     Route::get('/',function(){
//        return 'Hello! i am subdomain';
//     });
// });