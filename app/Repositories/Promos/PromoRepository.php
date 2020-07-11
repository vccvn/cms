<?php

namespace App\Repositories\Promos;

use App\Repositories\Base\BaseRepository;

class PromoRepository extends BaseRepository
{
    /**
     * class chứ các phương thức để validate dử liệu
     * @var string $validatorClass 
     */
    protected $validatorClass = 'App\Validators\Promos\PromoValidator';
    

    /**
     * tên class mặt nạ. Thược có tiền tố [tên thư mục] + \ vá hậu tố Mask
     *
     * @var string
     */
    protected $maskClass = 'Promos\PromoMask';

    /**
     * tên collection mặt nạ
     *
     * @var string
     */
    protected $maskCollectionClass = 'Promos\PromoCollection';

    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return \App\Models\Promo::class;
    }

    /**
     * lấy option còn hiệu lực
     *
     * @param array $args
     * @return array
     */
    public function getPromoAvailableOptions($args = [])
    {
        $this->whereDate('finished_at', '>=', date('Y-m-d'));
        $this->withCount('productRefs');
        $data = ['Chọn một chương trình khuyến mãi'];
        if(count($promos = $this->get($args))){
            foreach ($promos as $promo) {
                $data[$promo->id] = $promo->name . ' ('.$promo->productRefs_count . ' sản phẩm)';
            }
        }
        return $data;

    }

}