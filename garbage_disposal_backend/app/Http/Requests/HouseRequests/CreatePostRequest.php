<?php

namespace App\Http\Requests\HouseRequests;

use Illuminate\Foundation\Http\FormRequest;

class CreatePostRequest extends FormRequest
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
            'location' => ['required', 'string','min:8', 'max:255'],
            'description' => ['required', 'string','min:8', 'max:255'],
            'houseTitle' => ['required', 'string','min:3', 'max:255', 'unique:App\Models\houseModel,houseTitle'],
        ];
    }
}
