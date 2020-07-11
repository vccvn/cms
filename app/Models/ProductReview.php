<?php

namespace App\Models;

class ProductReview extends Model
{
    public $table = 'product_reviews';
    public $fillable = [
        'product_id', 'customer_id', 'approved_id', 
        'rating', 'name', 'email', 'comment', 
        'approved'
    ];

    /**
     * lay du lieu form
     * @return array
     */
    public function toFormData()
    {
        $data = $this->toArray();
        return $data;
    }

    
    public function timeFormat($format = 'd/m/Y')
    {
        return date($format, strtotime($this->created_at));
    }

    public function getReviewerName()
    {
        return $this->name?$this->name:$this->customer_name;
    }
    public function getReviewerEmail()
    {
        return $this->email?$this->email:$this->customer_email;
    }

    
    /**
     * get image url
     * @param boolean $urlencode mã hóa url
     * @return string 
     */
    public function getFeatureImage($size=false)
    {
        if($this->feature_image){
            $feature_image = $this->feature_image;
        }else{
            $feature_image = '000-default.png';
        }
        $fd = 'products';
        if($size && file_exists(public_path('static/'.$fd.'/'.$size.'/'.$feature_image))){
            return asset('static/'.$fd.'/'.$size.'/'.$feature_image);
        }
        $url = asset('static/'.$fd.'/'.$feature_image);
        return $url;
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
        $url = url('static/users/avatar/'.$avatar);
        if($urlencode) return urlencode($url);
        return $url;
    }
}
