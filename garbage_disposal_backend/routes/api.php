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

//Route::middleware('auth:api')->get('/user', function (Request $request) {
  //  return $request->user();
//});

Route::post('register', [\App\Http\Controllers\AuthController::class, 'register']);
Route::post('login', [\App\Http\Controllers\AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {

});

Route::group(['middleware' => ['auth:sanctum', 'role:admin']], function () {
    Route::get('users', [\App\Http\Controllers\UserController::class, 'getUsers']);
//    Route::put('users/user/update', [\App\Http\Controllers\UserController::class, 'userUpdateForAdmins']);
//    Route::delete('users/user/delete', [\App\Http\Controllers\UserController::class, 'userDelete']);
//    Route::get('history', [\App\Http\Controllers\UserController::class, 'getHistory']);
//    Route::get('/house/containers', [\App\Http\Controllers\garbage_houseController::class, 'getContainersForAdmin']);
//    Route::put('/house/containers/update', [\App\Http\Controllers\garbage_houseController::class, 'updateContainerForAdmin']);

//    Route::delete('users/user/delete', [\App\Http\Controllers\UserController::class, 'userDelete']);

    Route::prefix('garbage')->group(function () {
        Route::post('/create', [App\Http\Controllers\garbageController::class, 'createGarbageType']);
        Route::put('/update/{id}', [\App\Http\Controllers\garbageController::class, 'updateGarbage']);
    });

    Route::prefix('house')->group(function () {
        Route::get('/houses', [\App\Http\Controllers\houseController::class, 'getHouses']);
        Route::put('/update', [\App\Http\Controllers\houseController::class, 'updateHouse']);
        Route::post('/create', [\App\Http\Controllers\houseController::class, 'createHouse']);
    });
});

Route::group(['middleware' => ['auth:sanctum', 'role:user|moderator|admin']], function () {

    Route::get('historyForUser', [\App\Http\Controllers\UserController::class, 'getHistoryForUser']);
    Route::get('getAuthUser', [\App\Http\Controllers\UserController::class, 'getAuthUser']);

    Route::prefix('history')->group(function () {
        Route::post('/create', [\App\Http\Controllers\historyController::class, 'createRecord']);
    });

    Route::prefix('user')->group(function () {
        Route::get('/user', [\App\Http\Controllers\AuthController::class, 'user']);
        Route::post('/logout', [\App\Http\Controllers\AuthController::class, 'logout']);
        Route::put('/update', [\App\Http\Controllers\UserController::class, 'userUpdate']);
    });

});

Route::group(['middleware' => ['auth:sanctum', 'role:moderator|admin']], function () {
    Route::get('/house/users', [\App\Http\Controllers\houseController::class, 'getUsersInHouse']);

    Route::delete('users/user/delete', [\App\Http\Controllers\UserController::class, 'userDelete']);
    Route::put('users/user/update', [\App\Http\Controllers\UserController::class, 'userUpdateForAdmins']);
    Route::get('history', [\App\Http\Controllers\UserController::class, 'getHistory']);
    Route::get('/moderator/house', [\App\Http\Controllers\houseController::class, 'getModeratorHouse']);
    Route::get('/house/containers', [\App\Http\Controllers\garbage_houseController::class, 'getContainersForAdmin']);
    Route::put('/house/containers/update', [\App\Http\Controllers\garbage_houseController::class, 'updateContainerForAdmin']);

    Route::prefix('container')->group(function () { // this group of routes works only for moderator accounts
        Route::post('/create', [\App\Http\Controllers\garbage_houseController::class, 'createContainer']);
        Route::delete('/remove/', [\App\Http\Controllers\garbage_houseController::class, 'removeContainer']);
        Route::put('/update/{containerID}', [\App\Http\Controllers\garbage_houseController::class, 'updateContainer']);
        Route::get('/containers', [\App\Http\Controllers\garbage_houseController::class, 'getContainers']);
    });

    Route::prefix('price')->group(function () { // this group of routes works only for moderator accounts

    });
});

Route::prefix('export')->group(function () {
    Route::get('/users', [\App\Http\Controllers\ImportExportController::class, 'exportUsersCollection']);
});
Route::prefix('import')->group(function () {
    Route::post('/users', [\App\Http\Controllers\ImportExportController::class, 'importUsersCollection']);
});




