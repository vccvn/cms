<?php

namespace App\Models;

class ProductRef extends Model
{
    public $table = 'product_refs';
    public $fillable = ['product_id', 'ref', 'ref_id'];

    public $timestamps = false;

}
