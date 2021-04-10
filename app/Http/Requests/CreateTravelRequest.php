<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CreateTravelRequest extends FormRequest
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
            "name" => "required",
            "phone" => "required",
            "email" => "required|email",
            "quality" => "required|numeric|min:1",
            "price" => "required|numeric",
            "payment_method" => [
                Rule::in([
                    PAYMENT_METHOD_CASH,
                    PAYMENT_METHOD_CARD
                ])
            ],
            "travel_id" => "required|exists:travels,id",
        ];
    }
}
