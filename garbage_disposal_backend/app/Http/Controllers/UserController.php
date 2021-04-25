<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequests\DeleteRequest;
use App\Http\Requests\UserRequests\UpdatePutRequest;
use App\Models\historyModel;
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
        return USER::leftJoin('house', 'users.houseID', '=', 'house.houseID')
            ->leftJoin('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
            ->leftJoin('roles', 'model_has_roles.role_id', '=', 'roles.id')
//            ->leftJoin('user_history', 'users.id', 'user_history.userID')
            ->select('users.id as userID', 'first_name', 'last_name', 'email', 'users.created_at', 'users.updated_at', 'houseTitle', 'location', 'name', 'users.houseID',
//                'user_history.garbageID', 'weight', 'sum', 'user_history.created_at as historyCreated_at'
            )
            ->get();
    }

    public function getAuthUser(){
        return USER::leftJoin('house', 'users.houseID', '=', 'house.houseID')
            ->leftJoin('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
            ->leftJoin('roles', 'model_has_roles.role_id', '=', 'roles.id')
            ->where('users.id', Auth::user()->getAuthIdentifier())
//            ->leftJoin('user_history', 'users.id', 'user_history.userID')
            ->select('users.id as userID', 'first_name', 'last_name', 'email', 'users.created_at', 'users.updated_at', 'houseTitle', 'location', 'name', 'users.houseID',
//                'user_history.garbageID', 'weight', 'sum', 'user_history.created_at as historyCreated_at'
            )
            ->get();
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

    public function  getHistory(){
        return historyModel::all();
    }

    public function userDelete(DeleteRequest $request) {
        $user = User::find($request->userID);
        $user->delete();
        return response(['messages' => 'success'], Response::HTTP_OK);
    }

    public function  getHistoryForUser(){
        return historyModel::where('userID', Auth::user()->getAuthIdentifier())->get();
    }
}
