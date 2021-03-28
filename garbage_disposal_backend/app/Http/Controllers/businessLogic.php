<?php

namespace App\Http\Controllers;

use App\Models\garbage_houseModel;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class businessLogic extends Controller
{
    public static function businessLogic($request): array{
        $result = [];
        $id = Auth::user()->getAuthIdentifier();
        array_push($result, $id);
        $authenticatedUser= User::find($id);
        array_push($result, $authenticatedUser->houseID);
        $garbageID = $request->input('garbageID');
        $price = garbage_houseModel::where('houseID', $authenticatedUser->houseID)
            ->where('garbageID', $garbageID)
            ->join('price', 'garbage_house.priceID', '=', 'price.priceID')
            ->select('export_price', 'recycling_price')
            ->get();
        $weight = $request->input('weight');
        $sum = round($price[0]->recycling_price * $weight + $price[0]->export_price * $weight, 2);
        array_push($result, $sum);
        return $result;
    }
}
