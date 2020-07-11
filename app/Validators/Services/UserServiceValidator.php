<?php

namespace App\Validators\Services;

use App\Validators\Base\BaseValidator;

class UserServiceValidator extends BaseValidator
{
    public function extends()
    {
        $this->addRule('check_service', function ($attr, $value)
        {
            return $this->repository->getServiceRepository()->count([
                'id' => $value,
                'deleted' => 0
            ]) == 1;
        });
        $this->addRule('check_package', function ($attr, $value)
        {
            return $this->repository->getPackageRepository()->count([
                'id' => $value,
                'service_id' => $this->service_id,
                'deleted' => 0
            ]) == 1;
        });

        $this->addRule('check_domain', function($prop, $value){
            if(!in_array($value, get_system_config('domain_list'))) return false;
            return true;
        });

        $this->addRule('check_subdomain', function($attr, $value){
            return preg_match('/^[A-z0-9]+[A-z0-9]*$/i', $value);
        });
        $this->addRule('check_alias', function($attr, $value){
            if($value){
                return preg_match('/^[A-z0-9]+[A-z0-9\.\-]*\.[A-z0-9]+$/i', $value);
            }
            return true;
        });
    }

    /**
     * ham lay rang buoc du lieu
     */
    public function rules()
    {
    
        return [
            
            'service_id'           => 'check_service',
            'package_id'           => 'check_package',
            'email'                => 'required|email',
            'password'             => 'required|string|min:6',
            'domain'               => 'required',
            'subdomain'            => 'required|check_subdomain',
            'alias_domain'         => 'check_alias',

        ];
    }

    /**
     * các thông báo
     */
    public function messages()
    {
        return [
            
            'service_id.*'               => 'Dịch vụ Không hợp lệ',
            'package_id.*'               => 'Gói Không hợp lệ',
            'email.required'             => 'Email không được bỏ trống',
            'email.email'                => 'Email không hợp lệ',
            'domain.required'            => 'Tên miền không được bỏ trống',
            'domain.check_domain'        => 'Tên miền không hợp lệ',
            'subdomain.required'         => 'Tên miền phụ không được bỏ trống',
            'subdomain.check_subdomain'  => 'Tên miền phụ không hợp lệ',
            'alias_domain'               => 'Tên miền alias không hợp lệ',

            'password.required'                    => 'Bạn chưa nhập mật khẩu',
            'password.min'                         => 'Mật khẩu phải có ít nhất 6 ký tự',
            'password.confirmed'                   => 'Mật khẩu không khớp',
            
        ];
    }
}