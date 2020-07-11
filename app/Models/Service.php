<?php

namespace App\Models;

class Service extends Model
{
    public $table = 'services';
    public $fillable = ['name', 'description', 'web_type', 'deleted'];

    public function servicePackages()
    {
        return $this->hasMany(ServicePackage::class, 'service_id', 'id');
    }

    public function packages()
    {
        return $this->servicePackages()->where('deleted', 0);
    }

    public function beforeDelete()
    {
        $this->servicePackages()->delete();
    }

    public function toFormData()
    {
        $a = $this->packages;
        return $this->toArray();
    }

    public function getPackageNameList()
    {
        $names = [];
        if(count($this->packages)){
            foreach ($this->packages as $package) {
                $names[] = $package->package_name;
            }
        }
        return implode(', ', $names);
    }

    public function getPricingTable()
    {
        # code...
    }
}
