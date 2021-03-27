<?php

namespace App\Http\Requests\Garbage_houseRequests;

use Illuminate\Foundation\Http\FormRequest;

class garbage_housePostRequest extends FormRequest
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
            'garbageID' => ['required', 'numeric'],
            'maxFullness' => ['required', 'numeric','min:1', 'max:1000'],
            'export_price' => ['required', 'numeric','min:1', 'max:100'],
            'recycling_price' => ['required', 'numeric','min:1', 'max:100'],
        ];
    }
}
