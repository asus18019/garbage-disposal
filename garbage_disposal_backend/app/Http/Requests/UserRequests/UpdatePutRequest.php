<?php

namespace App\Http\Requests\UserRequests;

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
            'userID' => ['required', 'exists:users,id'],
            'first_name' => ['string','min:3', 'max:255'],
            'last_name' => ['string','min:3', 'max:255'],
            'email' => ['string','min:6', 'max:600', 'unique:App\Models\User'],
            'password' => ['string','min:8', 'max:600'],
            'houseID' => ['exists:house,houseID']
        ];
    }
}
