<?php

namespace App\Http\Controllers;

use App\Http\Requests\Garbage_houseRequests\garbage_housePostRequest;
use App\Http\Requests\Garbage_houseRequests\garbage_housePutRequest;
use App\Models\garbage_houseModel;
use App\Models\priceModel;
use App\Models\User;
use App\Models\garbageModel;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class garbage_houseController extends Controller
{
    private function getModeratorHouseID(): int {
        $authenticatedModerator = User::find($this->authenticatedModeratorID());
        return $authenticatedModerator->houseID;
    }

    private function isContainerExistAlready($houseID, $garbageID): bool {
        $arr = garbage_houseModel::where('houseID', $houseID)->where('garbageID', $garbageID)->get();
        if(isset($arr[0])){
            return true;
        }
        return false;
    }

    private function isGarbageExist($garbageID): bool {
        $garbageArray = garbageModel::where('garbageID', $garbageID)->get();
        if(isset($garbageArray[0])){
            return true;
        }
        return false;
    }

    public function createContainer(garbage_housePostRequest $request){
        if($this->isContainerExistAlready($this->getModeratorHouseID(), $request->input('garbageID'))){
            return response(['message' => 'that container already exist in house']);
        }
        elseif (!$this->isGarbageExist($request->input('garbageID'))){
            return response(['message' => 'that type of garbage does not exist']);
        }
        else {
            $price = priceModel::create([
                'export_price' => $request->input('export_price'),
                'recycling_price' => $request->input('recycling_price'),
            ]);
            $container = garbage_houseModel::create([
                'houseID' => $this->getModeratorHouseID(),
                'garbageID' => $request->input('garbageID'),
                'maxFullness' => $request->input('maxFullness'),
                'priceID' => $price->priceID,
            ]);
            return response([$container], Response::HTTP_CREATED);
        }
    }

    public function removeContainer($containerID){
        if(!$this->isContainerExistAlready($this->getModeratorHouseID(), $containerID)){
            return response(['message' => 'этот тип контейнера не установлен в этом доме'], Response::HTTP_BAD_REQUEST); // todo change response code
        } else {
            $container = garbage_houseModel::where('houseID', $this->getModeratorHouseID())
                ->where('garbageID', $containerID)
                ->get();
            garbage_houseModel::find($container[0]->garbage_houseID)->delete();
            priceModel::find($container[0]->priceID)->delete();
            return response(['message' => 'container deleted'], Response::HTTP_OK);
        }
    }

    public function updateContainer($containerID, garbage_housePutRequest $request){
        if(!$this->isContainerExistAlready($this->getModeratorHouseID(), $containerID)){
            return response(['message' => 'этот тип контейнера не установлен в этом доме'], Response::HTTP_BAD_REQUEST);
        } else {
            $containerInfo = garbage_houseModel::where('houseID', $this->getModeratorHouseID())
                ->where('garbageID', $containerID)
                ->get();
            $container = garbage_houseModel::find($containerInfo[0]->garbage_houseID);
            $container->update($request->all());
            $price = priceModel::find($containerInfo[0]->priceID);
            $price->update($request->all());
            return response(['message' => 'container updated'], Response::HTTP_OK);
        }
    }

    public function getContainers(){
        $containers = garbage_houseModel::where('houseID', $this->getModeratorHouseID())
            ->join('garbage', 'garbage_house.garbageID', '=', 'garbage.garbageID')
            ->join('price', 'garbage_house.priceID', '=', 'price.priceID')
            ->select('garbage.garbage as Container', 'currentFullness', 'maxFullness', 'export_price', 'recycling_price')
            ->get();
        return response(['containers in my house' => $containers], Response::HTTP_OK);
    }
}
