<?php

namespace App\Imports;

use App\Models\model_has_rolesModel;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class UserRoleImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new model_has_rolesModel([
            'role_id'     => $row['role_id'],
            'model_type' => $row['model_type'],
            'model_id' => $row['model_id']
        ]);
    }
}
