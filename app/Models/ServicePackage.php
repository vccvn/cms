<?php

namespace App\Models;

class ServicePackage extends Model
{
    public $table = 'service_packages';
    public $fillable = [
        'package_name', 'account_type',
        'service_id', 'features', 
        'price', 'maintenance_fee', 
        'cycle_unit', 'deleted'
    ];

    public function service()
    {
        return $this->belongsTo(Service::class, 'service_id', 'id');
    }

    public function userServices()
    {
        return $this->hasMany(UserService::class, 'service_id', 'id');
    }
    
    public function beforeDelete()
    {
        $this->userServices()->delete();
    }

    public function getExpiredDate()
    {
        $time = time();
        if($this->cycle_unit == 'forever'){
            return '2036-12-31 23:00:00';
        }
        if($this->cycle_unit == 'year'){
            $time += 3600*24*365;
        }
        else{
            $time += 3600*24*30;
        }

        return date('Y-m-d H:i:s', $time);
    }

    /**
     * get ecpured left time
     *
     * @return int
     */
    public function getExpiredLeftTime()
    {
        $time = time();

        if($this->cycle_unit == 'forever'){
            return strtotime('2035-12-31 23:00:00') - $time;
        }
        if($this->cycle_unit == 'year'){
            $time = 3600*24*365;
        }
        else{
            $time = 3600*24*30;
        }

        return$time;
    }
}
