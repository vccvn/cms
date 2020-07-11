<?php

namespace App\Http\Controllers\Clients;

use App\Exceptions\NotReportException;
use App\Http\Controllers\Clients\ClientController;
use App\Repositories\Metadatas\MetadataRepository;
use App\Repositories\Services\PackageRepository;
use App\Repositories\Services\ServiceRepository;
use Illuminate\Http\Request;
use Crazy\Helpers\Arr;

use App\Repositories\Services\UserServiceRepository;
use Crazy\Apis\Api;

class ServiceController extends ClientController
{
    protected $module = 'services';

    protected $moduleName = 'Service';

    protected $flashMode = true;

    /**
     * repository chinh
     *
     * @var UserServiceRepository
     */
    public $repository;

    /**
     * Service
     *
     * @var ServiceRepository
     */
    public $serviceRepository;

    /**
     * Service
     *
     * @var PackageRepository
     */
    public $packageRepository;

    /**
     * @var MetadataRepository $metadataRepository
     * Quản lý meta data
     */
    protected $metadataRepository;


    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        UserServiceRepository $repository,
        ServiceRepository $serviceRepository,
        MetadataRepository $metadataRepository,
        PackageRepository $packageRepository
    ) {
        $this->repository = $repository
                            ->setServiceRepository($serviceRepository)
                            ->setPackageRepository($packageRepository);
        $this->packageRepository = $packageRepository;
        $this->serviceRepository = $serviceRepository;
        $this->metadataRepository = $metadataRepository;
        $this->init();
        $this->breadcrumb->add("Gói dịch vụ", route('client.services.list'));
    }

    public function getServices(Request $request)
    {
        return $this->viewModule('list', [
            'userServices' => $this->repository->mode('mask')->getResults($request,[
                'user_id' => $request->user()->id
            ])
        ]);
    }

    public function getServiceForm(Request $request)
    {
        $this->breadcrumb->add("Đăng ký dịch vụ", route('client.services.add'));
        $services = $this->serviceRepository->get([
            'deleted' => 0,
            '@with' => ['packages']
        ]);
        return $this->viewModule('add', [
            'services' => $services
        ]);
    }


    public function addService(Request $request)
    {
        $validator = $this->repository->validator($request);
        $back = redirect()->back()->withInput();
        if (!$validator->success()) {
            return $back->withErrors($validator->getErrorObject());
        } elseif (!($service = $this->serviceRepository->find($request->service_id)) || !($package = $this->packageRepository->find($request->package_id))) {
            return $back->with('error', 'Dịch vụ hoặc gói không hợp lệ');
        }
        $data = $validator->inputs();
        $data['web_type'] = $service->web_type;
        $data['account_type'] = $service->account_type;
        $data['name'] = $request->user()->name;
        $done = false;
        if(!$package->price){
            $data['expired_at'] = $package->getExpiredDate();
            $data['status'] = 1;
            $done = true;
        }

        $api = new Api();
        $api->setResponseType('json');
        try {
            $res = $api->post('http://api.' . $data['domain'] . '/admin/accounts/create', $data);
            
            if (!$res['status']) {
                // dd($res);
                return $back->withErrors($res['errors'])->with('error', 'Không thể tạo trang web');
            }
            
            $data['account_id'] = $res['data'] ? $res['data']['id'] : 0;
            $data['user_id'] = $request->user()->id;
            if (!($userService = $this->repository->create($data))) {
                // remove 
                return $back->with('error', 'Không thể khởi tạo dịch vụ! Vui lòng thử lại sau giây lát');
            }

            $meta = array_copy($data, 'domain', 'subdomain', 'alias_domain');
            $this->metadataRepository->saveMany('user_services', $userService->id, $meta, false);

            if($done){
                return redirect()->route('client.services.list')->with([
                    'success' => 'Đã thêm dịch vụ thành công'
                ]);
    
            }
            session(['user_service_id' => $userService->id]);
            return redirect()->route('client.services.payment')->with([
                'success' => 'Đã thêm dịch vụ thành công!<br>Hãy làm theo hướng dẫn để thanh toán và sử dụng dịch vụ'
            ]);

        } catch (NotReportException $th) {
            return $back->with('error', 'Lỗi không xác định! Vui lòng thử lại sau giây lát');
        }
    }
}
