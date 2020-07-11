<?php

namespace App\Repositories\Services;

use App\Repositories\Base\BaseRepository;

class ServiceRepository extends BaseRepository
{
    /**
     * class chứ các phương thức để validate dử liệu
     * @var string $validatorClass 
     */
    protected $validatorClass = 'Services\ServiceValidator';
    
    /**
     * tên class mặt nạ. Thường có tiền tố [tên thư mục] + \ vá hậu tố Mask
     *
     * @var string
     */
    protected $maskClass = 'Services\ServiceMask';

    /**
     * tên collection mặt nạ
     *
     * @var string
     */
    protected $maskCollectionClass = 'Services\ServiceCollection';

    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Service::class;
    }

    public function init()
    {
        $this->setWith('packages');
    }

}