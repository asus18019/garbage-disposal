<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class UsersExport implements FromCollection, WithHeadings, WithMapping
{

    public function headings(): array {
        return[
            'id',
            'first_name',
            'last_name',
            'email',
            'password',
            'houseID',
            'created_at',
            'updated_at',
            'role_id',
            'model_type',
            'model_id',
        ];
    }
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return User::all()->makeVisible(['password']);
    }

    public function map($user): array
    {
        return [
            $user->id,
            $user->first_name,
            $user->last_name,
            $user->email,
            $user->makeVisible(['password'])->password,
            $user->houseID,
            $user->created_at,
            $user->updated_at,

            $user->role->role_id,
            $user->role->model_type,
            $user->role->model_id,
        ];
    }
}
