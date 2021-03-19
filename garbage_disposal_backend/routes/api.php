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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', [\App\Http\Controllers\AuthController::class, 'register']);
Route::post('login', [\App\Http\Controllers\AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {

});

Route::group(['middleware' => ['auth:sanctum', 'role:admin']], function () {
    Route::get('userPerm', [\App\Http\Controllers\UserController::class, 'test2']);
});

Route::group(['middleware' => ['auth:sanctum', 'role:user|admin']], function () {
    Route::get('adminPerm', [\App\Http\Controllers\UserController::class, 'test1']);

    Route::prefix('user')->group(function () {
        Route::get('/user', [\App\Http\Controllers\AuthController::class, 'user']);
        Route::post('/logout', [\App\Http\Controllers\AuthController::class, 'logout']);
        Route::put('/update', [\App\Http\Controllers\UserController::class, 'userUpdate']);
    });

});
