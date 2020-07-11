<?php

namespace App\Validators\Services;

use App\Repositories\Services\PackageRepository;
use App\Validators\Base\BaseValidator;
use Crazy\Helpers\Arr;

class ServiceValidator extends BaseValidator
{
    /**
     * package
     *
     * @var PackageRepository
     */
    public $packageRepository;
    public $account_types = [];
    public $_packages = [];
    public $ate = [];
    public $checkStatus = true;
    public function extends()
    {
        $this->packageRepository = new PackageRepository;
        $this->account_types = get_account_types()->toArray();
        // Thêm các rule ở đây
        $this->addRule('check_web_type', function($attr, $value){
            return array_key_exists($value, get_system_config('web_type_list'));
        });
        $this->addRule('package_name', function($attr, $value){
            if(!$this->packages) return true;
            if(!$value || in_array($value, $this->_packages)){
                $this->checkStatus = false;
                return false;
            }
            $this->_packages[] = $value;
            return true;
        });
        $this->addRule('account_type', function($attr, $value){
            if(!$this->packages) return true;
            if(!array_key_exists($value, $this->account_types)){
                $this->checkStatus = false;
                return false;
            }
            elseif(in_array($value, $this->ate)){
                $this->checkStatus = false;
                return false;
            }
            $this->ate[] = $value;
            return true;
        });
        $this->addRule('check_cycle_unit', function($attr, $value){
            if(!$this->packages) return true;
            if(!$value || !in_array($value, ['year', 'month', 'forever'])){
                $this->checkStatus = false;
                return false;
            }
            return true;
        });

        
        $this->addRule('price', function($attr, $value){
            if(!$this->packages) return true;
            if($value && (!is_numeric($value) || $value < 0)){
                $this->checkStatus = false;
                return false;
            }
            return true;
        });

        
        
        $this->addRule('check_package', function($attr, $value){
            if(!$value) return true;
            if(!is_array($value) || !Arr::isNumericKeys($value)) return false;
            return $this->checkStatus;
        });
    }

    /**
     * ham lay rang buoc du lieu
     */
    public function rules()
    {
        $r = $this->packages && is_array($this->packages) ? 'required|':'';
        return [
            
            'name' => 'required|unique_prop',
            'description' => 'mixed',
            'web_type' => 'required|check_web_type',
            'packages.*.package_name' => $r.'package_name',
            'packages.*.account_type' => $r.'account_type',
            'packages.*.cycle_unit' => $r.'check_cycle_unit',
            'packages.*.price' => 'price',
            'packages.*.maintenance_fee' => 'price',
            'packages.*.features' => 'mixed',
            'packages' => 'check_package',
            
        ];
    }

    /**
     * các thông báo
     */
    public function messages()
    {
        return [
            
            'name.required' => 'Tên dịch vụ không được nỏ trống',
            'name.unique_prop' => 'Dịch vụ đã tồn tại',
            'description.*' => 'Mô tả Không hợp lệ',
            'web_type.*' => 'Loại web Không hợp lệ',
            'packages.*.package_name.required' => 'Tên gói không dược bỏ trống',
            'packages.*.package_name.package_name' => 'Tên gói không hợp lệ hoặc bị trùng lặp',
            'packages.*.account_type.required' => 'Loại gói không được bỏ trống',
            'packages.*.account_type.account_type' => 'Loại gói không hợp lệ hoặc bị trùng lặp',
            'packages.*.cycle_unit.*' => 'Chu kỳ không hợp lệ',
            'packages.*.price' => 'Giá gói không hợp lệ',
            'packages.*.maintenance_fee.*' => 'Phí duy trì không hợp lệ',
            'packages.*.features.*' => 'Tính năng không hợp lệ',
            
            'packages.check_package' => 'Tùy chọn gói Không hợp lệ',

        ];
    }
}