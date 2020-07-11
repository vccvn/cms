<?php
namespace App\Masks\Services;

use Crazy\Magic\MaskCollection;

class ServiceCollection extends MaskCollection
{
    /**
     * lấy tên class mask tương ứng
     *
     * @return string
     */
    public function getMask()
    {
        return ServiceMask::class;
    }
    // xem Collection mẫu ExampleCollection
}
