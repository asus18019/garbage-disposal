<?php

namespace App\Http\Controllers;

use App\Http\Requests\HouseRequests\CreatePostRequest;
use App\Http\Requests\HouseRequests\UpdatePutRequest;
use App\Models\houseModel;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class houseController extends Controller
{
    public function getHouses(){
        $houses = houseModel::all();
        return response(['all_houses' => $houses], Response::HTTP_OK);
    }

    public function getModeratorHouse(){
        $moderator = User::find($this->authenticatedModeratorID());
        $house = houseModel::where('houseID', $moderator->houseID)->get();
        return response (['house' => $house], Response::HTTP_OK);
    }

    public function updateHouse(UpdatePutRequest $request){
        $house = houseModel::find($request->houseID);
        if(!$house){
            return response(['error' => 'house doesnt exist'], Response::HTTP_EXPECTATION_FAILED);// todo change the response code
        }
        $house->update($request->all());
        return response(['updated houses' => $house], Response::HTTP_OK);
    }

    public function createHouse(CreatePostRequest $request){
        $house = houseModel::create([
            'houseTitle' => $request->input('houseTitle'),
            'location' => $request->input('location'),
            'description' => $request->input('description'),
        ]);
        return response([$house], Response::HTTP_OK);
    }

    public function getUsersInHouse(){
        $authenticatedModerator = User::find($this->authenticatedModeratorID());
        $result = User::where('users.houseID', $authenticatedModerator->houseID)
            ->leftJoin('house', 'users.houseID', '=', 'house.houseID')
            ->leftJoin('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
            ->leftJoin('roles', 'model_has_roles.role_id', '=', 'roles.id')
            ->select('users.id as userID', 'first_name', 'last_name', 'email', 'users.created_at', 'users.updated_at', 'name', 'houseTitle', 'location', 'name', 'users.houseID')
            ->get();
        return response(['users' => $result], Response::HTTP_OK);
    }
}
