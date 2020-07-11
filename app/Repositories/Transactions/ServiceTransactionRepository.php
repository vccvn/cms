<?php

namespace App\Repositories\Transactions;

use App\Exceptions\NotReportException;
use App\Repositories\Base\BaseRepository;
use App\Repositories\Customers\CustomerRepository;
use App\Repositories\Orders\OrderRepository;
use App\Repositories\Services\UserServiceRepository;
use App\Repositories\Users\UserRepository;
use Crazy\Apis\Api;
use Crazy\Helpers\Arr;
use Crazy\Mailer\Email;

class ServiceTransactionRepository extends BaseRepository
{
    /**
     * class chứ các phương thức để validate dử liệu
     * @var string $validatorClass 
     */
    protected $validatorClass = 'Transactions\ServiceTransactionValidator';
    
    /**
     * tên class mặt nạ. Thược có tiền tố [tên thư mục] + \ vá hậu tố Mask
     *
     * @var string
     */
    protected $maskClass = 'Transactions\TransactionMask';

    /**
     * tên collection mặt nạ
     *
     * @var string
     */
    protected $maskCollectionClass = 'Transactions\TransactionCollection';

    /**
     * Undocumented variable
     *
     * @var array
     */
    protected $statusValues = [
        'approve' => 1,
        'unapprove' => 0,
        'decline' => -1,
        'restore' => 0
    ];

    public $logs = [];

    
    /**
     * @var array $defaultSortBy Mảng key value là twen6 cộ và kiểu sắp xếp
     */
    protected $defaultSortBy = [
        'transactions.id' => 'DESC'
    ];

    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Transaction::class;
    }

    public function init()
    {
        $this->addDefaultValue([
            'ref' => 'service'
        ]);
        $this->addDefaultParam('ref', 'ref', 'service');

        $this->setJoinable([
            ['join', 'users', 'users.id', '=', 'transactions.customer_id']
        ]);
        $columns = [
            'code' => 'transactions.code',
            'ref_id' => 'transactions.ref_id',
            'customer_name' => 'users.name',
            'customer_email' => 'users.email'
        ];
        $this->setSearchable($columns);
        $this->setSortable(array_merge($columns, ['time' => 'transactions.time']));
        
        $this->setSelectable(array_merge(['transactions.*'], [
            'customer_name' => 'users.name',
            'customer_email' => 'users.email',
        ]));

        $this->setWith('bills');
    }

    /**
     * @param array $data
     * @return array $data
     */
    public function beforeSave($data)
    {
        if(array_key_exists('user_service_id', $data)){
            $data['ref_id'] = $data['user_service_id'];
        }
        return $data;
    }

    
    /**
     * kiểm tra daterange trước khi filter
     * @param Request $request
     */
    public function beforeFilter($request)
    {
        // nếu có date range và date range hợp lệ thì sẽ thêm vào query
        if($request->daterange && $date = get_date_range($request->daterange)){
            $from = $date['from'];
            $to = $date['to'];
            $this->whereDate('transactions.time', '>=', "$from[year]-$from[month]-$from[day]");
            $this->whereDate('transactions.time', '<=', "$to[year]-$to[month]-$to[day]");
        }
    }

    /**
     * cập nhật trạng thái
     *
     * @param integer $id
     * @param integer $statusUpdate
     * @param integer $statusFind
     * @return void
     */
    public function updateStatus($id, int $statusUpdate = 1, $statusFind = null)
    {
        $args = ['id' => $id];
        if(!is_null($statusFind)){
            $args['status'] = $statusFind;
        }
        if($id && $this->count($args) && $detail = $this->update($id, ['status' => $statusUpdate])){
            return $detail;
        }
        return null;
    }
    /**
     * duyệt giao dịch
     * @param integer $id
     */
    public function approve($id)
    {
        return $this->updateStatus($id, 1, 0);
    }

    /**
     * hoàn tác duyệt giao dịch
     * @param integer $id
     */
    public function unApprove($id)
    {
        return $this->updateStatus($id, 0, 1);
    }

    /**
     * từ chối duyệt giao dịch
     * @param integer $id
     */
    public function decline($id)
    {
        return $this->updateStatus($id, -1);
    }

    
    /**
     * cập nhật trạng thái giao dịch và gửi mail
     *
     * @param integer $id
     * @param integer $status
     * @return void
     */
    public function updateStatusAndSendEmail($id, $status)
    {
        
        # code...
        $transaction = $this->FindBy('id', $id);
        $data = null;
        $stt = false;
        if($transaction && $transaction->status != $status && ($detail = $this->updateStatus($id, $status))){
            $userServiceRepository = new UserServiceRepository();
            $userService = $userServiceRepository->findBy('id', $transaction->ref_id);
            // nếu đã dược duyệt
            $stt = true;
            if($status == 1){
                // nếu có đơn hàng
                if($userService){
                    $package = $userService->package;
                    $service = $userService->service;
                    
                    if($package){
                        if(
                            ($transaction->type == 'payment' && $transaction->amount >= $package->price) || 
                            ($transaction->type == 'extension' && $transaction->amount >= $package->maintenance_fee) 
                        )
                        {
                            // $this->updateStatus($id, $transaction->status);
                            // $expired_at = $package->getExpiredDate();
                            $status = 1;
                            $userService->applyMeta();
                            $time = $userService->getCurrentExpired() + $package->getExpiredLeftTime();
                            $expired_at = date('Y-m-d H:i:s', $time);
                            $d = [
                                'web_type' => $service->web_type,
                                'account_type' => $package->account_type,
                                'expired_at' => $expired_at,
                                'account_id' => $userService->account_id,
                                'status' => $status
                            ];
                            try {
                                $api = new Api(['response_type'=>'json']);
                                $res = new Arr($api->post('http://api.vcc.vn/admin/accounts/upgrade', $d));
                                // die(json_encode($res->all()));
                                if($res->status){
                                    $data = $detail;
                                    $userServiceRepository->update($userService->id, [
                                        'status' => 1, 
                                        'paid'   => $userService->paid + $transaction->amount,
                                        'expired_at' => $expired_at
                                    ]);
                                }else{
                                    $this->updateStatus($id, $transaction->status);
                                    $this->logs = $res->all();
                                    $stt = false;
                                }

                            } catch (NotReportException $th) {
                                $stt = false;
                                $this->updateStatus($id, $transaction->status);
                                $this->logs = [
                                    'message' => $th->getMessage()
                                ];
                            }
                        }
                    }
                }
            }
            elseif($transaction->status == 1){
                
            }
            if($stt){
                $this->sendMailAlertStatus($transaction->id);
            }
            
            
            return $data;
        }
    }


    

    public function sendMailAlertStatus($id)
    {
        if($transaction = $this->find($id)){
            $customer = $transaction->userCustomer;
            if(!$customer) return;
            // thông báo email hoặc làm gì đó
            $subject = 'Thông báo về trạng thái giao dịch';

            $messages = [
                0 => 'được chuyển về trạng thái chờ',
                1 => 'đã được xác nhận',
                -1=>'bị từ chối'
            ];

            $message = 'Giao dịch của bạn '.$messages[$transaction->status];
            $data = [
                'name' =>$customer?$customer->name:'Quý khách',
                'content' => $message
            ];

            Email::to($customer->email)->subject($subject)->body('mails.simple-alert')->data($data)->send();
        }
    }

}