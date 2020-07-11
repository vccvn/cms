<?php
namespace App\Masks\Users;

use App\Models\User;
use Crazy\Magic\Mask;

class UserMask extends Mask
{

    // xem thêm ExampleMask
    protected function init(){
        $this->allow('getAvatar');
    }

    // khai báo thêm các hàm khác bên dưới nếu cần
}