<?php

namespace App\Http\Controllers\Admin\Business;

use App\Http\Controllers\Admin\AdminController;

use Illuminate\Http\Request;
use Crazy\Helpers\Arr;

use App\Repositories\Services\UserServiceRepository;

class UserServiceController extends AdminController
{
    protected $module = 'services.users';

    protected $moduleName = 'UserService';

    protected $flashMode = true;

    /**
     * repository chinh
     *
     * @var UserServiceRepository
     */
    public $repository;
    
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(UserServiceRepository $repository)
    {
        $this->repository = $repository;
        $this->init();
    }
    public function beforeGetListData($request)
    {
        $this->repository->fullinfo();
    }
    public function beforeGetIndexData($request)
    {
        $this->repository->fullinfo();
    }

}
