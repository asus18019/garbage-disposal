<?php

namespace App\Http\Requests\GarbageRequests;

use Illuminate\Foundation\Http\FormRequest;

class garbagePostRequest extends FormRequest
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
            'garbage' => ['required', 'string','min:3', 'max:255', 'unique:App\Models\gargabeModel,garbage'],
            'description' => ['required', 'string','min:8', 'max:255'],
        ];
    }
}
