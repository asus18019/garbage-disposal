<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequests\UpdatePutRequest;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UserController extends Controller
{
    public function userUpdate(UpdatePutRequest $request)
    {
        if(!$request->query()){
            return response(['messages' => 'empty data'], Response::HTTP_BAD_REQUEST);
        }
        $user = Auth::user();
        $user->update($request->except('password'));
        if($request->query('password')){
            $user->password = Hash::make($request->query('password'));
            $user->save();
        }
        return response(['messages' => 'success', 'updater user' => $user, $user->password], Response::HTTP_OK);
    }


    public function test1(){
        return response(['message' => 'Это видит только admin и user']);
    }

    public function test2(){
        return response(['message' => 'Это видит только admin']);
    }
}
