<?php

namespace App\Validators\Promos;

use App\Validators\Base\BaseValidator;
use App\Repositories\Products\ProductRepository;

class PromoValidator extends BaseValidator
{
    public function extends()
    {
        $this->addRule('check_down_price', function($prop, $value){
            if(!$value) return true;
            if(!is_numeric($value)) return false;
            return ($this->type == 1 && $value > 100) ? false : true;
        });

        $this->addRule('check_products', function($prop, $value){
            if(!$value) return true;
            if(!is_array($value)) return false;
            return (count($value) == (new ProductRepository())->count(['id' => $value]));
        });
    }
    /**
     * ham lay rang buoc du lieu
     */
    public function rules()
    {
    
        $rules = [
            'name'                            => 'required|string|max:191|unique_prop',
            'description'                     => 'max:500',
            'type'                            => 'binary',
            'down_price'                      => 'check_down_price',
            'code'                            => 'max:32',
            'times'                           => 'datetimerange',
            'products'                        => 'check_products'
            
        ];
        
        return $rules;
        // return $this->parseRules($rules);
    }

    public function messages()
    {
        return [
            'name.required'                    => 'Tên chương trình khuyến mãi không được bỏ trống',
            'name.string'                      => 'Tên chương trình khuyến mãi không hợp lệ',
            'name.max'                         => 'Tên chương trình khuyến mãi hơi... dài!',
            'name.unique_prop'                 => 'Tên chương trình khuyến mãi bị trùng lặp',
            'description.max'                  => 'Mô tả hơi dài',
            'down_price.check_down_price'      => 'Mức khuyến mãi',
            'code.max'                         => 'Mã khuyến mãi không được vượt quá 32 ký tự',
            'products.check_products'          => 'Hình như có một vài sản phẩm không hợp lệ',
            'times.datetimerange'              => 'Thời gian khuyến mãi không hợp lệ'
        ];
    }
}