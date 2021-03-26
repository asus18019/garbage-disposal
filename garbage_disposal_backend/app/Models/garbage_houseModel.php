<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class garbage_houseModel extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'garbage_house';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'garbage_houseID';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'houseID',
        'garbageID',
        'currentFullness',
        'maxFullness'
    ];
}
