<?php

namespace App\Http\Controllers;

use App\Http\Requests\GarbageRequests\garbagePostRequest;
use App\Http\Requests\GarbageRequests\garbagePutRequest;
use App\Models\garbageModel;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class garbageController extends Controller
{
    public function getHouses(){
        $garbage = garbageModel::all();
        return response(['all garbage' => $garbage], Response::HTTP_OK);
    }

    public function createGarbageType(garbagePostRequest $request){
        $garbage = garbageModel::create([
            'garbage' => $request->input('garbage'),
            'description' => $request->input('description'),
        ]);
        return response([$garbage], Response::HTTP_OK);
    }

    public function updateGarbage(garbagePutRequest $request, $id){
        $garbage = garbageModel::find($id);
        if(!$garbage){
            return response(['error' => 'garbage doesnt exist'], Response::HTTP_EXPECTATION_FAILED);// todo change the responce code
        }
        $garbage->update($request->all());
        return response(['updated garbage' => $garbage], Response::HTTP_OK);
    }
}
