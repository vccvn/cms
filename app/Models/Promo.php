<?php

namespace App\Models;

class Promo extends Model
{
    public $table = 'promos';
    public $fillable = ['name', 'description', 'type', 'down_price', 'down_percent', 'code', 'started_at', 'finished_at', 'deleted'];

    public function productRefs()
    {
        return $this->hasMany('App\Models\ProductRef', 'ref_id', 'id')->where('ref', 'promo');
    }
    /**
     * lay du lieu form
     * @return array
     */
    public function toFormData()
    {
        $data = $this->toArray();
        $data['times'] = substr($this->started_at, 0, 16) . ' - ' . substr($this->finished_at, 0, 16);
        
        return $data;
    }

    public function promoDateFormat($format = 'H:i:s d/m/Y', $column = 'finished_at')
    {
        return date($format, strtotime($this->{in_array($c = strtolower($column), ['finished_at', 'started_at'])?$c:'finished_at'}));
    }

    public function beforeDelete()
    {
        $this->productRefs()->delete();
    }
}
