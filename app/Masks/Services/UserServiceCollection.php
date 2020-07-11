<?php
namespace App\Masks\Services;

use Crazy\Magic\MaskCollection;

class UserServiceCollection extends MaskCollection
{
    /**
     * lấy tên class mask tương ứng
     *
     * @return string
     */
    public function getMask()
    {
        return UserServiceMask::class;
    }
    // xem Collection mẫu ExampleCollection
}
