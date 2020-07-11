<?php

namespace App\Repositories\Services;

use App\Repositories\Base\BaseRepository;
use Crazy\Helpers\Arr;

class PackageRepository extends BaseRepository
{
    /**
     * class chứ các phương thức để validate dử liệu
     * @var string $validatorClass 
     */
    protected $validatorClass = 'Services\PackageValidator';
    
    /**
     * tên class mặt nạ. Thường có tiền tố [tên thư mục] + \ vá hậu tố Mask
     *
     * @var string
     */
    protected $maskClass = 'Services\PackageMask';

    /**
     * tên collection mặt nạ
     *
     * @var string
     */
    protected $maskCollectionClass = 'Services\PackageCollection';

    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\ServicePackage::class;
    }

    /**
     * cập nhật gói dịch vụ
     *
     * @param int $service_id
     * @param array $packages
     * @return array
     */
    public function updateServicePackages($service_id, $packages = [])
    {
        $ignore = [];
        if(is_array($packages) && count($packages) && Arr::isNumericKeys($packages)){
            
            foreach ($packages as $index => $packageData) {
                $pack = new Arr($packageData);
                $pack->service_id = $service_id;
                if($package = $this->save($pack->all(), $pack->id)){
                    $ignore[] = $package->id;
                }
            }
        }

        if($ignore){
            $this->whereNotIn('service_packages.id', $ignore);
        }
        $this->query(compact('service_id'))->delete();
    }
}