<?php

namespace App\Http\Requests\Garbage_houseRequests;

use Illuminate\Foundation\Http\FormRequest;

class garbage_housePutReqForAdmin extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'houseID' => ['required', 'exists:house,houseID'],
            'garbageID' => ['required', 'exists:garbage,garbageID'],
            'maxFullness' => ['numeric','min:1', 'max:1000'],
        ];
    }
}
