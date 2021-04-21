<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class houseModel extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'house';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'houseID';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'houseTitle',
        'location',
        'description',
    ];

    public function containers()
    {
        return $this->hasMany(garbage_houseModel::class, 'houseID');
    }
}
