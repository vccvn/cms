<?php

namespace App\Models;

class Client extends Model
{
    public $table = 'clients';
    public $fillable = ['name', 'email', 'phone_number', 'avatar'];

    /**
     * Danh sach phản hồi
     * @return RelationshipQueryBuilder
     */
    public function feedback()
    {
        return $this->hasMany('App\Models\ClientFeedback', 'client_id', 'id');
    }

    /**
     * lay du lieu form
     * @return array
     */
    public function toFormData()
    {
        $data = $this->toArray();
        if($this->avatar) $data['avatar'] = $this->getAvatar();
        return $data;
    }

    
    
    /**
     * get avatar url
     * @return string 
     */
    public function getAvatar()
    {
        if($this->avatar){
            $avatar = $this->avatar;
        }else{
            $avatar = 'default.png';
        }
        $url = url('static/clients/'.$avatar);
        return $url;
    }

    /**
     * xoa avatar
     */
    public function deleteAvatar()
    {
        if($this->avatar && file_exists($path = public_path('static/clients/'.$this->avatar))){
            unlink($path);
        }
    }


     /**
     * ham xóa file cũ
     * 
     * @return boolean
     */
    public function deleteAttachFile()
    {
        return $this->deleteAvatar();
    }

    
    /**
     * lấy tên file đính kèm cũ
     */
    public function getAttachFilename()
    {
        return $this->avatar;
    }

    
    public function beforeDelete()
    {
        $this->deleteAvatar();
        $this->feedback()->delete();
    }
}
