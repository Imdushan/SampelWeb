<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(){
       $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    // public function index() {
    //     $this->middleware('auth');
    //     if (!auth()->User()) {
    //         return redirect('/login');
    //     }else{
    //         return redirect('dashboard');
    //     }

    // }

    public function index() {
        $this->middleware('auth');

        if (Auth::user()->role == 'AS') {
            return redirect('/as/dashboard');
        }

        return redirect('login');

    }


}
