<?php
namespace App\Masks\Services;

use Crazy\Magic\MaskCollection;

class ServicePackageCollection extends MaskCollection
{
    /**
     * lấy tên class mask tương ứng
     *
     * @return string
     */
    public function getMask()
    {
        return ServicePackageMask::class;
    }
    // xem Collection mẫu ExampleCollection
}
