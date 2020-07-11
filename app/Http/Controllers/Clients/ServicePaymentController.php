<?php

namespace App\Http\Controllers\Clients;

use App\Engines\MailAlert;
use App\Http\Controllers\Clients\ClientController;

use App\Repositories\Emails\EmailTokenRepository;
use App\Repositories\Files\FileRepository;
use App\Repositories\Services\UserServiceRepository;
use App\Repositories\Transactions\ServiceTransactionRepository;
use App\Repositories\Users\UserRepository;

use Illuminate\Http\Request;
use Crazy\Helpers\Arr;

class ServicePaymentController extends ClientController
{
    protected $module = 'services';

    protected $moduleName = 'Thanh toán';

    protected $flashMode = true;

    /**
     * customer
     *
     * @var UserRepository $userRepository
     */
    protected $userRepository = null;
    /**
     * email token
     *
     * @var EmailTokenRepository
     */
    protected $emailTokenRepository = null;


    /**
     * file
     *
     * @var FileRepository
     */
    protected $fileRepository = null;


    /**
     * str
     *
     * @var ServiceTransactionRepository
     */
    public $repository = null;



    /**
     * str
     *
     * @var UserServiceRepository 
     */
    public $userServiceRepository = null;


    
        
        

    /**
     * order
     *
     * @var \App\Models\Order
     */
    protected $userSwevice = null;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        ServiceTransactionRepository $serviceTransactionRepository,
        UserServiceRepository $userServiceRepository,
        UserRepository $userRepository,
        EmailTokenRepository $emailTokenRepository,
        FileRepository $fileRepository
    ) {
        $this->repository = $serviceTransactionRepository;
        $this->userServiceRepository = $userServiceRepository;
        $this->userRepository = $userRepository->addDefaultCondition('deleted', 'deleted', 0);

        $this->emailTokenRepository = $emailTokenRepository;
        $this->repository->setValidatorClass('Transactions\ServicePaymentValidator');
        $this->fileRepository = $fileRepository;
        $this->setting = setting();
        $this->siteinfo = siteinfo();
        $this->init();
    }

    /**
     * xem trang thanh toan chuyễn khoản
     *
     * @param Request $request
     * @return void
     */
    public function payment(Request $request)
    {
        $page_title = 'Thanh toán chuyển khoản';

        $userService = ($user_service_id = session('user_service_id'))? $this->userServiceRepository->mode('mask')->detail($user_service_id) : null;
        
        $this->breadcrumb->add($page_title);
        
        $transaction_type = $request->get('transaction_type', session('transaction_type','payment'));

        return $this->viewModule('payment', compact('page_title', 'userService', 'transaction_type'));
    }

    /**
     * kiễm tra thông tin đơn hàng
     *
     * @param Request $request
     * @return void
     */
    public function checkServicePayment(Request $request)
    {
        if (!$request->user_service_id || !($userService = $this->userServiceRepository->findBy('id', $request->user_service_id))) {
            return redirect()->back()->with(['error' => 'Thông tin dịch vụ không hợp lệ'])->withInput($request->all());
        }
        session(['user_service_id' => $userService->id]);
        if($request->transaction_type){
            session(['transaction_type' => $request->transaction_type]);
        }
        return redirect()->route('client.services.payment');
    }

    /**
     * can thiệp thêm data trước khi lưu
     *
     * @param Request $request
     * @param Arr $data
     * @return void
     */
    public function beforeCreate(Request $request, Arr $data)
    {
        $userService = $this->userServiceRepository->mode('mask')->detail($request->user_service_id);
        $total = 0;
        $data->type = 'payment';
        if($package = $userService->package){
            if($data->transaction_type == 'extension'){
                $data->type = 'extension';
                $total = $package->maintenance_fee;
            }else{
                $total = $package->price;
            }
        }
        $data->amount = $total;
        $data->time = date('Y-m-d H:i:s');
        $data->customer_id = $request->user()->id;
        $data->created_id = $request->user()->id;
        
    }

    /**
     * can thiệp sau khi lưu
     *
     * @param Request $request
     * @param \App\Models\Transaction $result
     * @return void
     */
    public function afterSave(Request $request, $result)
    {
        $date_path = date('Y/m/d');
        if ($file = $this->uploadImage($request, 'image', null, 'static/files/' . $date_path)) {
            $upload_by = ($user = $request->user()) ? $user->id : 0;
            $this->fileRepository->create(array_merge($file->all(), [
                'upload_by' => $upload_by,
                'sid' => md5(microtime() . uniqid()),
                'original_filename' => $file->filename,
                'date_path' => $date_path,
                'privacy' => 'public',
                'ref' => 'transaction',
                'ref_id' => $result->id
            ]));
        }
        $this->redirectRoute = 'client.alert';
        $this->addRedirectData([
            'type' => 'success',
            'message' => 'Chúc mừng bạn đã gửi biên lai thanh toán thành công! Vui lòng chờ giây lát trong khi chúng tôi xác thực giao dịch',
            'link' => route('client.services.list'),
            'text' => 'Quãn lý dịch vụ'
        ]);
        // Forget a single key...
        $request->session()->forget('user_service_id');
        
        if($this->setting->send_mail_notification && is_email($this->setting->mail_notification)){
            $customer = $result->customer;
            MailAlert::send([
                'subject' => "Thông báo: Có người vừa gửi thông tin thanh toán Dịch vụ", 
                'content' => ($customer?$customer->name:'Có người')." vừa gửi thông tin thanh toán Dịch vụ.\n ID:".$result->id
            ]);
        }
    }

}
