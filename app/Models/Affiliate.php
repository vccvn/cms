<?php

namespace App\Models;

class Affiliate extends Model
{
    public $table = 'affiliates';
    public $fillable = ['name', 'slug', 'logo', 'color', 'website', 'deleted'];


    public function urls()
    {
        return $this->hasMany(AffiliatProducteUrl::class, 'affiliate_id', 'id');
    }
    
    

    /**
     * get avatar url
     * @param boolean $urlencode mã hóa url
     * @return string 
     */
    public function getLogo()
    {
        if($this->logo && file_exists(public_path($p = 'static/affiliates/' . $this->logo))){
            return asset($p);
            
        }else{
            $logo = 'default.png';
        }
        $url = url('static/images/default-image.png');
        return $url;
    }

    /**
     * xoa anh
     */
    public function deleteLogo()
    {
        if($this->logo && file_exists($p = public_path('static/affiliates/' . $this->logo))){
            unlink($p);
            
        }
    }
    public function beforeDelete()
    {
        $this->deleteList('urls');
        $this->deleteLogo();
    }
}
