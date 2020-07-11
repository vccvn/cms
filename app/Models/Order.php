<?php

namespace App\Models;

class Order extends Model
{
    public $table = 'orders';
    public $fillable = [
        'user_id', 'customer_id', 'type', 'ship_to_different_address', 
        'payment_method', 'shipping_fee', 'tax', 'sub_total', 'total_money', 'note', 
        'status', 'deleted', 'completed_at', 'ordered_at'
    ];


    /**
     * @var array $jsonFields các cột dùng kiểu json
     */
    protected $jsonFields = ['shipping_data'];
    
    /**
     * kết nối với bảng order item
     * @return QueryBuilder
     */
    public function items()
    {
        return $this->hasMany('App\Models\OrderItem', 'order_id', 'id');
    }

    public function details()
    {
        return $this->items()->join('products', 'products.id', '=', 'order_items.product_id')
                    ->select('order_items.*', 'products.name as product_name', 'products.slug', 'products.feature_image as product_image');
    }

    
    public function productItems()
    {
        return $this->details();
    }

    public function orderAddress()
    {
        return $this->hasMany('App\Models\OrderAddress', 'order_id', 'id');
    }

    public function billing()
    {
        return $this->hasOne('App\Models\OrderAddress', 'order_id', 'id')->where('type', 'billing');
    }

    public function shipping()
    {
        return $this->hasOne('App\Models\OrderAddress', 'order_id', 'id')->where('type', 'shipping');
    }

    
    /**
     * feedback
     */
    public function feedback()
    {
        return $this->hasMany('App\Models\OrderFeedback', 'order_id', 'id');
    }

    public function isTransferPayment()
    {
        return ($this->payment_method == 1);
    }

    /**
     * kiểm tra trạng thái
     *
     * @param string|int $status
     * @return boolean
     */
    public function isStatus($status)
    {
        $statusList = get_order_status_list();
        $s = str_slug($status);
        if($status == $this->status || ($s && ($a = $statusList->get($s)) && $a->code == $this->status)) return true;
        return false;
    }
    

    
    /**
     * lay du lieu form
     * @return array
     */
    public function toFormData()
    {
        $data = $this->toArray();
        $items = [];
        if(count($this->items)){
            foreach ($this->items as $item) {
                $idata = $item->toFormData();
                $items[] = $idata;

            }
        }
        $data['items'] = $items;
        return $data;
    }

    public function canCancel()
    {
        return ($this->status < 500 && $this->status > -1);
    }

    public function beforeDelete()
    {
        $this->items()->delete();
        $this->feedback()->delete();
        $this->orderAddress()->delete();
    }
}
