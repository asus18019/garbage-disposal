<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequests\UpdatePutRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
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

    public function getUsers(){
        return USER::join('house', 'users.houseID', '=', 'house.houseID')
            ->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
            ->join('roles', 'model_has_roles.role_id', '=', 'roles.id')
            ->select('users.id as userID', 'first_name', 'last_name', 'email', 'users.created_at', 'users.updated_at', 'houseTitle', 'location', 'name', 'users.houseID')
            ->get();
    }

    public function test1(){
        return response(['message' => 'Это видит только admin и user']);
    }

    public function test2(){
        return response(['message' => 'Это видит только admin']);
    }

    public function userUpdateForAdmins(UpdatePutRequest $request){
        $user = User::find($request->userID);
        $user->update($request->except('password'));
        if($request->query('password')){
            $user->password = Hash::make($request->query('password'));
            $user->save();
        }
        return response(['messages' => 'success', 'updater user' => $user, $user->password], Response::HTTP_OK);
    }
}
