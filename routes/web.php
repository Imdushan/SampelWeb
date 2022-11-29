<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Events\Hello;

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
Auth::routes();

//Route::get('/login', 'HomeController@index');
Route::get('/', 'HomeController@index');
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/dashboard', 'HomeController@index');



// --------DPD -> AS route-----------
Route::group(['middleware' => ['AS']], function () {

    Route::get('/as/dashboard', function () { return view('Dashboard'); });
    Route::get('/as/submenu-list', function () { return view('Dashboard'); });
    Route::get('/as/submenu-list2', function () { return view('Dashboard'); });
});

