<?php

namespace App\Http\Controllers\Admin\Business;

use App\Http\Controllers\Admin\AdminController;
use App\Repositories\Services\PackageRepository;
use Illuminate\Http\Request;
use Crazy\Helpers\Arr;

use App\Repositories\Services\ServiceRepository;

class ServiceController extends AdminController
{
    protected $module = 'services';

    protected $moduleName = 'Service';

    protected $flashMode = true;

    /**
     * repository chinh
     *
     * @var ServiceRepository
     */
    public $repository;
    

    /**
     * package
     *
     * @var PackageRepository
     */
    public $packageRepository;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(ServiceRepository $repository, PackageRepository $packageRepository)
    {
        $this->repository = $repository;
        $this->packageRepository = $packageRepository;
        $this->init();
    }

    public function afterSave($request, $result, $data)
    {
        $this->packageRepository->updateServicePackages($result->id, $request->packages);
    }

}
