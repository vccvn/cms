<?php

namespace App\Repositories\Services;

use App\Repositories\Base\BaseRepository;

class UserServiceRepository extends BaseRepository
{
    /**
     * class chứ các phương thức để validate dử liệu
     * @var string $validatorClass 
     */
    protected $validatorClass = 'Services\UserServiceValidator';
    
    /**
     * tên class mặt nạ. Thường có tiền tố [tên thư mục] + \ vá hậu tố Mask
     *
     * @var string
     */
    protected $maskClass = 'Services\UserServiceMask';

    /**
     * tên collection mặt nạ
     *
     * @var string
     */
    protected $maskCollectionClass = 'Services\UserServiceCollection';

    /**
     * Undocumented variable
     *
     * @var ServiceRepository
     */
    public $serviceRepository = null;


    /**
     * 
     *
     * @var PackageRepository
     */
    public $packageRepository = null;

    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\UserService::class;
    }

    public function init()
    {
        $this->setWith([
            'service', 'package', 'metadatas'
        ]);
    }

    public function fullinfo()
    {
        return $this->join('service_packages', 'service_packages.id', '=', 'user_services.package_id')
                    ->join('services', 'services.id', '=', 'user_services.service_id')
                    ->join('users', 'users.id', '=', 'user_services.user_id')
                    ->select(
                        'user_services.*', 
                        'users.name as user_name', 
                        'users.email as user_email',
                        'services.name as service_name',
                        'services.web_type as web_type',
                        'service_packages.package_name',
                        'service_packages.account_type',
                        'service_packages.price'
                    );
    }
    /**
     * set service
     *
     * @param ServiceRepository $serviceRepository
     * @return static
     */
    public function setServiceRepository(ServiceRepository $serviceRepository)
    {
        $this->serviceRepository = $serviceRepository;
        return $this;
    }

    /**
     * set service
     *
     * @return ServiceRepository $serviceRepository
     * 
     */

    public function getServiceRepository()
    {
        if(!$this->serviceRepository) $this->serviceRepository = app(ServiceRepository::class);
        return $this->serviceRepository;
    }


    
    /**
     * set service
     *
     * @param PackageRepository $packageRepository
     * @return static
     */
    public function setPackageRepository(PackageRepository $packageRepository)
    {
        $this->packageRepository = $packageRepository;
        return $this;
    }

    /**
     * set service
     *
     * @return PackageRepository $packageRepository
     * 
     */

    public function getPackageRepository()
    {
        if(!$this->packageRepository) $this->packageRepository = app(PackageRepository::class);
        return $this->packageRepository;
    }

}