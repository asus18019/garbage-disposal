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
        return response(['all houses' => $houses], Response::HTTP_OK);
    }

    public function updateHouse(UpdatePutRequest $request, $id){
        $house = houseModel::find($id);
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
        $result = User::where('houseID', $authenticatedModerator->houseID)->get();
        return response(['users that lives in my house' => $result], Response::HTTP_OK);
    }
}
