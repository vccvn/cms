<?php

namespace App\Repositories\Orders;

use App\Repositories\Base\BaseRepository;
use App\Repositories\Products\ProductAttributeRepository;
use App\Repositories\Products\ProductRepository;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Crypt;

class CartRepository extends BaseRepository
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Order::class;
    }
    
    protected $validatorClass = 'Orders\CartValidator';
    protected $resourceClass = 'CartResource';
    protected $collectionClass = 'CartCollection';
    protected $maskClass = 'Orders\CartMask';
    protected $maskCollectionClass = 'Orders\CartCollection';
    protected $responseMode = 'mask';
    protected $currentID = 0;
    protected $cart = null;
    protected $currentAttrs = [];

    /**
     * repo
     *
     * @var \App\Repositories\Products\ProductAttributeRepository
     */
    protected $productAttributeRepository;

    /**
     * repo
     *
     * @var \App\Repositories\Products\ProductRepository
     */
    protected $productRepository;

    /**
     * repo
     *
     * @var OrderItemRepository
     */
    protected $orderItemRepository;
    
    /**
     * init
     *
     * @return void
     */
    public function init()
    {
        $this->addDefaultCondition('type', 'type', 'cart');

        $this->productAttributeRepository = new ProductAttributeRepository();
        $this->productRepository = new ProductRepository();
        $this->productRepository->addDefaultCondition('deleted', 'deleted', 0);
        $this->orderItemRepository = new OrderItemRepository();

        $cookieCartId = Cookie::get('cart_id');
        if($cookieCartId){
            if(!is_numeric($cookieCartId)){
                $cookieCartId = Crypt::decryptString($cookieCartId);
            }
            $this->currentID = $cookieCartId;
        }
        
    }

    public function makeCartExists()
    {
        if($this->currentID && $cart = $this->first(['id' => $this->currentID])){
            // cart 
            $this->cart = $cart;
        }else{
            $cart = $this->create(['name' => 'Customer', 'email' => 'example@gmail.com']);
            $this->currentID = $cart->id;
            $this->cart = $cart;
        }
        return $this->cart;
    }

    
    /**
     * thêm sản phẩm vào giỏ hàng
     *
     * @param int $product_id
     * @param int $quantity
     * @param array $attrs
     * @return void
     */
    public function addItem($product_id, $quantity = 1, $attrs = [])
    {
        if($product = $this->productRepository->findBy('id', $product_id)){
            $this->makeCartExists();
            $order_id = $this->currentID;
            if(!is_numeric($quantity) || $quantity < 1) $quantity = 1;
            // lấy ra các id hợp lệ và mã hóa mảng json
            $attr_values = $this->getAttrKey($product->id, $attrs);
            // tạo biến data để uy cấn và cập nhật data
            $data = compact('order_id', 'product_id', 'attr_values');
            if($item = $this->orderItemRepository->first($data)){
                $cartItem = $item;
                $cartItem->quantity+=$quantity;
                $cartItem->save();
            }else{
                $data['quantity'] = $quantity;
                $data['list_price'] = $this->getProductPriceByOrigin($product->list_price,$product_id,$attrs);
                $data['final_price'] = $this->getProductPriceByOrigin($product->getFinalPrice(),$product_id,$attrs);
                $cartItem = $this->orderItemRepository->create($data);
            }
            return $this->updateCartData()->getCartWidthDetails();
        }
        return false;
    }

    public function removeItem(int $id = 0)
    {
        if($id){
            $this->makeCartExists();
            if($item = $this->orderItemRepository->first(['order_id' => $this->cart->id, 'id' => $id])){
                $item->delete();
            }
            return $this->updateCartData()->getCartWidthDetails();
        }
        return false;
    }

    public function updateCartQuantity($quantityData = [])
    {
        $s = false;
        if(is_array($quantityData)){
            $this->makeCartExists();
            foreach ($quantityData as $id => $qty) {
                if($qty < 1){
                    $this->orderItemRepository->delete($id);
                    $s = true;
                }elseif($this->orderItemRepository->update($id, ['quantity' => $qty])){
                    $s = true;
                }
            }
        }
        if($s){
            return $this->updateCartData()->getCartWidthDetails();
        }
        return false;
        
    }
    /**
     * lấy chi tiết giỏ hàng
     *
     * @return \App\Masks\Orders\CartMask|null
     */
    public function getCartWidthDetails()
    {
        return $this->currentID?$this->parseDetail($this->with('details')->first(['id' => $this->currentID])):null;
    }

    /**
     * làm trống giỏ hảng
     *
     * @return \App\Masks\Orders\CartMask|null
     */
    public function empty()
    {
        if($this->currentID && $this->makeCartExists() && $this->cart){
            $this->cart->items()->delete();
            
            return $this->updateCartData()->getCartWidthDetails();
        }
        return false;
    }


    protected function updateCartData(){
        if($this->cart){
            $sub_total = 0;
            $total_money = 0;
            if(count($items = $this->orderItemRepository->getBy('order_id', $this->cart->id))){
                foreach ($items as $item) {
                    $sub_total+=($item->final_price * $item->quantity);
                }
            }
            // thiết lập thêm tax hoặc gì đó
            $tax = 0;
            $total_money = $sub_total;
            $this->cart = $this->update($this->cart->id, compact('sub_total','total_money','tax'));
        }
        return $this;
    }

    /**
     * lấy key của order item
     *
     * @param integer $product_id
     * @param array $attrs
     * @return string
     */
    public function getAttrKey(int $product_id, array $attrs = [])
    {
        $arr = [];
        if($attrs && $attrVals = $this->productAttributeRepository->getProductAttributeValues($product_id, $attrs, 1)){
            foreach ($attrVals as $attrVal) {
                $arr[] = $attrVal->attribute_value_id;
            }
        }
        sort($arr);

        return implode('-', $arr);
    }


    /**
     * lấy thông tin giá bán dự tên giá và thông tin đầu vào
     *
     * @param integer $origin_price
     * @param integer $product_id
     * @param array $attrs
     * @return void
     */
    public function getProductPriceByOrigin($origin_price = 0, $product_id = 0, $attrs = [])
    {
        if(!$this->currentAttrs){
            $this->currentAttrs = $this->productAttributeRepository->getProductAttributeValues($product_id, $attrs,1,1);
        }
        $price = $origin_price;
        if ($attrs) {
            $change = 0;
            if (count($this->currentAttrs)) {
                foreach ($this->currentAttrs as $key => $attr) {
                    if ($attr->price_type) {
                        if (!$change) {
                            $price = $attr->price;
                            $change = 1;
                        }
                    } else {
                        $price += $attr->price;
                    }
                }
            }
        }
        return $price;
    }

    public function getCartDetail($id)
    {
        return $this->with(['details', 'billing', 'shipping'])->mode('mask')->detail($id);
    }

}