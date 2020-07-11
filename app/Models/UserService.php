<?php

namespace App\Models;

class UserService extends Model
{
    public $table = 'user_services';
    public $fillable = [
        'service_id', 'package_id', 'user_id', 'account_id', 
        'paid', 'expired_at', 'status', 'deleted'
    ];

    
    /**
     * ket noi voi bang user_meta
     * @return queryBuilder 
     */
    public function metadatas()
    {
        return $this->hasMany('App\Models\Metadata','ref_id','id')->where('ref', 'user_services');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function service()
    {
        return $this->belongsTo(Service::class, 'service_id', 'id');
    }
    
    public function package()
    {
        return $this->belongsTo(ServicePackage::class, 'package_id', 'id');
    }

    public function getCurrentExpired()
    {
        if($this->paid && $this->expired_at && parse_date_time($this->expired_at)){
            return strtotime($this->expired_at);
        }
        return time();
    }
}
