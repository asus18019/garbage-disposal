<?php

namespace App\Http\Controllers;

use App\Http\Requests\HistoryRequests\HistoryPostRequest;
use App\Models\garbage_houseModel;
use App\Models\historyModel;
use App\Models\User;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class historyController extends Controller
{
    private function isContainerExist($houseID, $garbageID): bool {
        $arr = garbage_houseModel::where('houseID', $houseID)->where('garbageID', $garbageID)->get();
        if(isset($arr[0])){
            return true;
        }
        return false;
    }

    private function isContainerFull($houseID, $garbageID, $weight){
        $container = garbage_houseModel::where('houseID', $houseID)->where('garbageID', $garbageID)->get();
        if($container[0]->currentFullness + $weight >= $container[0]->maxFullness){
            return -1;
        }
        return $container[0]->currentFullness + $weight;
    }

    public function createRecord(HistoryPostRequest $request){
        $id = Auth::user()->getAuthIdentifier();
        $authenticatedUser= User::find($id);

        if(!$this->isContainerExist($authenticatedUser->houseID, $request->input('garbageID'))){
            return response(['errors' => 'в этом дома нет такого конейнера'],Response::HTTP_BAD_REQUEST );
        } else {

            $containerWeight = $this->isContainerFull(
                $authenticatedUser->houseID,
                $request->input('garbageID'),
                $request->input('weight'),
            );
            if($containerWeight === -1)
            {
                return response(['errors' => 'контейнер заполнен'], Response::HTTP_BAD_REQUEST);
            } else {
                $result = businessLogic::businessLogic($request);

                $garbage = historyModel::create([
                    'userID' => $result[0],
                    'garbageID' => $request->input('garbageID'),
                    'houseID' => $result[1],
                    'weight' => $request->input('weight'),
                    'sum' => $result[2],
                ]);

                $containerID = garbage_houseModel::where('houseID', $authenticatedUser->houseID)
                    ->where('garbageID', $request->input('garbageID'))
                    ->get();
                $container = garbage_houseModel::find($containerID[0]->garbage_houseID);
                $container->currentFullness = $container->currentFullness + $request->input('weight');
                $container->save();
                return response(['message' => $garbage]);
            }
        }
    }
}
