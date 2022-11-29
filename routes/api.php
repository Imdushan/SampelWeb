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



//-------------------------check user login is invalid ----------------------------
Route::post('checkLogin', [
    'uses' => 'Auth\AuthController@checkLogin'
]);



/*
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| Common User Control APIs
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|
*/

//------------------------- user login ----------------------------
Route::post('user/login', [
    'uses' => 'UserController@login'
]);

Route::middleware('auth:api')->post('user/checkTokenValidity', [
    'uses' => 'UserController@checkTokenValidity'
]);

Route::get('/redirect', function () {
    $query = http_build_query([
        'client_id' => '1',
        'redirect_uri' => '',
        'response_type' => 'code',
        'scope' => '',
    ]);

    return redirect('https://csiap.celatatech.com/oauth/authorize?'.$query);
});

