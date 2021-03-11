<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UserController extends Controller
{
    public function userUpdate(Request $request)
    {
        $user = Auth::user();
        $rules =[
            'first_name' => ['string','min:3', 'max:255'],
            'last_name' => ['string','min:3', 'max:255'],
            'email' => ['string','min:6', 'max:600', 'unique:App\Models\User'],
            'password' => ['string','min:6', 'max:600'],
        ];
        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()){
            return response([$validator->errors()], Response::HTTP_BAD_REQUEST);
        } else {
            $user->update($request->all());

            if($request['password']){
                $user->password = Hash::make($request['password']);
                $user->save();
            }
            return response([
                'messages' => 'success',
                $user,
            ], Response::HTTP_OK);
        }
    }

    public function test1(){
        return response(['message' => 'Это видит только admin и user']);
    }

    public function test2(){
        return response(['message' => 'Это видит только admin']);
    }
}
