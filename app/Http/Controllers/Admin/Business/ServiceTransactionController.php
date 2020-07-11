<?php

namespace App\Http\Controllers\Admin\Business;

use Illuminate\Http\Request;
use App\Http\Controllers\Admin\AdminController;
use Crazy\Helpers\Arr;
use App\Repositories\Transactions\ServiceTransactionRepository;
use App\Repositories\Files\FileRepository;
// use App\Repositories\Services\UserServiceRepository;
use App\Repositories\Customers\CustomerRepository;
use App\Repositories\Services\UserServiceRepository;

class ServiceTransactionController extends AdminController
{
    protected $module = 'transactions.services';

    protected $moduleName = 'Giao dịch';

    protected $flashMode = true;

    protected $statusValues = [
        'approve' => 1,
        'unapprove' => 0,
        'decline' => -1,
        'restore' => 0
    ];

    /**
     * @var App\Repositories\Files\FileRepository $fileRepository
     * Quản lý file upload
     */
    protected $fileRepository;

    /**
     * Create a new controller instance.
     *
     * @param ServiceTransactionRepository $serviceTransactionRepository
     * @param UserServiceRepository $userServiceRepository
     * @param FileRepository $fileRepository
     * @param CustomerRepository $customerRepository
     * 
     * @return void
     */
    public function __construct(
        ServiceTransactionRepository $serviceTransactionRepository, 
        UserServiceRepository $userServiceRepository, 
        FileRepository $fileRepository, 
        CustomerRepository $customerRepository
    )
    {
        $this->repository                  = $serviceTransactionRepository;
        $this->fileRepository              = $fileRepository;
        $this->userServiceRepository       = $userServiceRepository;
        $this->customerRepository          = $customerRepository;
        $this->init();
        $this->activeMenu('transactions');
    }

    /**
     * on start
     *
     * @return void
     */
    public function start()
    {
        add_js_data('transaction_service',[
            'urls' => [
                // 'get_service_options' => route($this->routeNamePrefix.'services.select-options'),
                'get_detail' => $this->getModuleRoute('resource-detail'),
                'approve' => $this->getModuleRoute('status', ['slug' => 'approve']),
                'unapprove' => $this->getModuleRoute('status', ['slug' => 'unapprove']),
                'decline' => $this->getModuleRoute('status', ['slug' => 'decline']),
                'restore' => $this->getModuleRoute('status', ['slug' => 'restore']),
                'delete' => $this->getModuleRoute('move-to-trash')
            ]
        ]);
        add_js_src('static/manager/js/transaction.service.js');
    }

    public function beforeGetResourceDetail($request)
    {
        $this->repository->mode('mask');
    }
 
    /**
     * xử lý data trước khi lưu
     *
     * @param Request $request
     * @param Arr $data
     * @return void
     */
    public function beforeSave(Request $request, Arr $data)
    {
        if(!$request->time){
            $data->time = date('Y-m-d H:i:s');
        }
    }

    /**
     * lưu biên lai sau khi lưu giao dịch
     *
     * @param Request $request
     * @param \App\Models\Transaction $transaction
     * @param Arr $data
     * @return void
     */
    public function afterSave(Request $request, $transaction, Arr $data)
    {
        if($request->id == $transaction->id){
            $this->fileRepository->deleteRefFileIgnoreList('transaction', $transaction->id, is_array($request->bills_ids)?$request->bills_ids:[]);
        }
        if($request->bills_data){
            $this->fileRepository->saveBase64List($data->bills_data, 'transaction', $transaction->id, $request->user()->id);
        }
    }
    
    /**
     * thay doi trang thnai giao dich
     *
     * @param Request $request
     * @param string $statusSlug
     * @return JSON
     */
    public function changeStatus(Request $request, $statusSlug)
    {
        extract($this->apiDefaultData);
        $sttKeys = array_flip($this->statusValues);
        $stt = array_key_exists($statusSlug, $sttKeys) ? ((int) $statusSlug) : (
            array_key_exists($k = strtolower($statusSlug), $this->statusValues) ? $this->statusValues[$k] : null
        );
        if(!is_null($stt) && $detail = $this->repository->updateStatusAndSendEmail($request->id, $stt)){
            
            $data = $detail;
            $status = true;
        }elseif($this->repository->logs && isset($this->repository->logs['message'])){
            $message = $this->repository->logs['message'];
            if(isset($this->repository->logs['errors'])){
                $errors = $this->repository->logs['errors'];
            }
        }
        else{
            $message = "Không tìm thấy mục yêu càu";
        }
    
        return $this->json(compact(...$this->apiSystemVars));
    }

    
    /**
     * thay đổi trạng thái đơn hàng
     * @param Request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getTransactionDetail(Request $request)
    {
        extract($this->apiDefaultData);
        if($request->id && $detail = $this->repository->mode('mask')->detail($request->id)){
            $data = $detail;
            $status = true;
        }else{
            $message = "Không tìm thấy mục yêu càu";
            
        }
        return $this->json(compact(...$this->apiSystemVars));
    }
}
