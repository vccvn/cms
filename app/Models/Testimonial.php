<?php

namespace App\Models;

class testimonial extends Model
{
    public $table = 'testimonials';
    public $fillable = ['client_id', 'name', 'email', 'job', 'company', 'content', 'avatar'];

    public $timestamps = false;

    public function client()
    {
        return $this->belongsTo('App\Models\Client', 'client_id', 'id');
    }

    
        
    /**
     * get avatar url
     * @param boolean $urlencode mã hóa url
     * @return string 
     */
    public function getAvatar($urlencode=false)
    {
        if($this->avatar){
            $avatar = $this->avatar;
        }else{
            $avatar = 'default.png';
        }
        $url = url('static/testimonials/'.$avatar);
        if($urlencode) return urlencode($url);
        return $url;
    }

    /**
     * xoa anh
     */
    public function deleteFeatureImage()
    {

        
        if($this->avatar){
            if(file_exists($path = public_path('static/testimonials/'.$this->avatar))){
                unlink($path);
            }
        }
    }

     /**
     * ham xóa file cũ
     * @param int $id
     * 
     * @return boolean
     */
    public function deleteAttachFile()
    {
        return $this->deleteFeatureImage();
    }

    /**
     * lấy tên file đính kèm cũ
     */
    public function getAttachFilename()
    {
        return $this->avatar;
    }

        /**
     * thủ tục trước khi xóa
     */
    public function beforeDelete()
    {
        $this->deleteFeatureImage();
    }
}
