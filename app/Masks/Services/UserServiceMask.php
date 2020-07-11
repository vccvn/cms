<?php
namespace App\Masks\Services;

use App\Masks\Users\UserMask;
use App\Models\UserService;
use Crazy\Magic\Mask;

class UserServiceMask extends Mask
{
    public $meta = [];
    // xem thêm ExampleMask
    /**
     * thêm các thiết lập của bạn
     * ví dụ thêm danh sách cho phép truy cập vào thuộc tính hay gọi phương thức trong model
     * hoặc map vs các quan hệ dữ liệu
     *
     * @return void
     */
    protected function init(){
        $this->map([
            'metadatas'        => MetadataCollection::class,
            'user'       => UserMask::class,
            'service'    => ServiceMask::class,
            'package'    => ServicePackageMask::class
        ]);
    }

    /**
     * lấy data từ model sang mask
     * @param UserService $userService Tham số không bắt buộc phải khai báo. 
     * Xem thêm ExampleMask
     */
    // public function toMask()
    // {
    //     $data = $this->getAttrData();
    //     // thêm data tại đây.
    //     // Xem thêm ExampleMask
    //     return $data;
        
    // }

    /**
     * sẽ được gọi sau khi thiết lập xong
     *
     * @return void
     */
    protected function onLoaded()
    {
        if ($metadatas = $this->relation('metadatas')) {
            $jsf = $this->model->getJsonFields();
            foreach ($metadatas as $m) {
                if(in_array($m->name, $jsf)){
                    $value = json_decode($m->value, true);
                }else{
                    $value = $m->value;
                }
                
                $this->meta[$m->name] = $value;
            }
        }
    }
    
    /**
     * gán dự liệu meta cho product
     * @return void
     */
    public function applyMeta()
    {
        if(!$this->meta){
            if ($metadatas = $this->relation('metadatas', true)) {
                $jsf = $this->model->getJsonFields();
                foreach ($metadatas as $m) {
                    if(in_array($m->name, $jsf)){
                        $value = json_decode($m->value, true);
                    }else{
                        $value = $m->value;
                    }
                    $this->data[$m->name] = $value;
                    $this->meta[$m->name] = $value;
                }
            }
        }
        else{
            foreach ($this->meta as $key => $value) {
                $this->data[$key] = $value;
                
            }
        }
    }
    
    // khai báo thêm các hàm khác bên dưới nếu cần
}