<?php

namespace App\Http\Requests\HouseRequests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePutRequest extends FormRequest
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
            'location' => ['string','min:8', 'max:255'],
            'description' => ['string','min:8', 'max:255'],
            'houseTitle' => ['string','min:3', 'max:255'],
        ];
    }
}
