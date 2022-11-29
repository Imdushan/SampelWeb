<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use GuzzleHttp\Client;
use Illuminate\Support\Carbon;

class UserController extends Controller
{
    //----------------------------User Login-------------------------------------------------------------------------
    public function login(Request $request){
                $email = $request->input('email');
                $password = $request->input('password');
        
                if (!$email){
                    return response()->json(['http_status' => 'error','message'=>'email is empty'],200);
                }

                $user = User::where('email', '=', $email)->first();
                
                if($user){
                    if($password){
                        if (Hash::check($password, $user->password)) {
                            $getApprovedUser = User::select('id','email','name','role','depend_dpd_id')->where('email','=',$email)->first();
        
                            auth()->attempt(['email' => $email, 'password' => $password]);
        
                            auth()->user()->tokens->each(function($token, $key) {
                                $token->delete();
                            });
                            $accessToken = auth()->user()->createToken('authToken')->accessToken;
                            return response()->json(['http_status' => 'success', 'id' => $getApprovedUser->id,'email' => $getApprovedUser->email,'name' => $getApprovedUser->name,'role' => $getApprovedUser->role,'user_id' => $getApprovedUser->id, 'depend_dpd_id' => $getApprovedUser->depend_dpd_id, 'message' => 'login_successful', 'access_token' => $accessToken], 200);
                            
                        }else{
                            return response()->json(['http_status' => 'error','message'=>'incorrect_password'],200);
                        }
                    }
                }else{
                    return response()->json(['http_status' => 'error','message'=>'user not found'],200);
                }
            }

    public function checkTokenValidity(Request $request)
    {
            return response()->json(['http_status' => 'success'],200);
        
    }
}
