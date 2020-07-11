<?php

namespace App\Models;

use Crazy\Helpers\Arr;

class Product extends Model
{
    public $table = 'products';
    public $fillable = [
        'category_id', 'name', 'slug', 'description', 'detail', 'keywords', 'feature_image', 'code', 
        'list_price', 'sale_price', 'on_sale', 'views', 'privacy', 'category_map', 'status', 'deleted', 
        'shop_id'
    ];


    protected $totalProductOnWarehouse = -1;

    /**
     * @var array $jsonFields các cột dùng kiểu json
     */
    protected $jsonFields = ['resources'];


    protected $attributeDataGroups = [];




    // public $resources = [];
    /**
     * ket noi voi bang user_meta
     * @return queryBuilder 
     */
    public function metadatas()
    {
        return $this->hasMany('App\Models\Metadata','ref_id','id')->where('ref', 'product');
    }
    /**
     * danh mục
     */
    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id', 'id');
    }

    public function shop()
    {
        return $this->belongsTo('App\Models\User', 'shop_id', 'id')->select('id', 'name', 'avatar', 'email');
    }

    public function productTags()
    {
        return $this->hasMany('App\Models\TagRef', 'ref_id', 'id')->where('tag_refs.ref','product');
    }

    public function tags()
    {
        return $this->productTags()->join('tags', 'tag_refs.tag_id', '=', 'tags.id')->select('tags.name', 'tags.keyword','tags.slug');
    }

    public function gallery()
    {
        return $this->hasMany('App\Models\File', 'ref_id', 'id')->where('ref', 'product');
    }
    public function refs()
    {
        return $this->hasMany('App\Models\ProductRef', 'product_id', 'id');
    }


    public function warehouse()
    {
        return $this->hasMany('App\Models\Warehouse', 'product_id', 'id');
    }


    public function productReviews()
    {
        return $this->hasMany('App\Models\ProductReview', 'product_id', 'id');
    }

    public function reviews()
    {
        return $this->productReviews()
                    ->leftJoin('customers','customers.id', '=', 'product_reviews.customer_id')
                    ->leftJoin('users', 'users.id', '=', 'customers.user_id')
                    ->select(
                        'product_reviews.*', 
                        'customers.name as customer_name', 
                        'customers.email as customer_email', 
                        'users.avatar', 
                        'users.name as user_name', 
                        'users.email as user_email'
                    );
    }

    
    public function comments()
    {
        return $this->hasMany('App\Models\Comment', 'ref_id', 'id')->where('ref', 'product');
    }

    public function publishComments()
    {
        return $this->comments()->where('privacy', 'public')->where('parent_id', 0)->where('approved', 1);
    }

    public function promos()
    {
        return $this->refs()->where('ref', 'promo')->join('promos', 'promos.id', '=', 'product_refs.ref_id')->select('promos.*', 'product_refs.product_id', 'product_refs.ref_id', 'product_refs.ref');
    }

    public function orderItems()
    {
        return $this->hasMany('App\Models\OrderItem', 'product_id', 'id')
                    ->join('orders', 'orders.id', '=', 'order_items.order_id')
                    ->where('orders.status', 1000);
    }

    /**
     * Các chuong trinh khuyen mai con hieu luc
     * @return QueryBuilder
     */
    public function promoAvailable()
    {
        $now = date('Y-m-d H:i:s');
        return $this->promos()->where('promos.started_at', '<=', $now)->where('promos.finished_at', '>=', $now);
    }






    public function productAttributes()
    {
        return $this->hasMany('App\Models\ProductAttribute', 'product_id', 'id');
    }




    public function attrs()
    {
        return $this->productAttributes()
                    ->join('attribute_values', 'attribute_values.id', 'product_attributes.attribute_value_id')
                    ->join('attributes', 'attributes.id', '=', 'attribute_values.attribute_id')
                    ->orderBy('attributes.is_order_option', 'DESC')
                    ->orderBy('attributes.is_variant', 'DESC')
                    ->orderBy('attributes.price_type', 'DESC')
                    ->orderBy('attributes.id', 'ASC')
                    ->orderBy('attribute_values.id', 'ASC')
                    ->select(
                        'product_attributes.id as product_attribute_id', 
                        'attribute_values.attribute_id', 
                        'attributes.name', 
                        'attributes.label', 
                        'attributes.input_type',
                        'attributes.value_type',
                        'attributes.show_type', 
                        'attributes.price_type', 
                        'attributes.value_unit', 
                        'attributes.is_variant', 
                        'attributes.advance_value_type', 
                        'attributes.use_list', 
                        'product_attributes.attribute_value_id', 
                        'attributes.is_order_option',
                        'attribute_values.varchar_value', 
                        'attribute_values.int_value', 
                        'attribute_values.decimal_value',
                        'attribute_values.text_value', 
                        'attribute_values.advance_value as attribute_advance_value', 
                        'product_attributes.advance_value as variant_advance_value', 
                        'product_attributes.price', 
                        'product_attributes.product_id'
                    )
                    ;
                // lùi 1 tab
            // lùi 1 tab
        // lùi 1 tab        
    }

    public function orderOptions()
    {
        return $this->attrs()->where('attributes.is_order_option', 1);
    }

    public function notOrderOptions()
    {
        return $this->attrs()->where('attributes.is_order_option', 0);
    }

    public function variantAttributes()
    {
        return $this->orderOptions()->where('attributes.is_variant', 1);
    }

    public function variants()
    {
        return $this->variantAttributes();
    }

    
    public function notVariantAttributes()
    {
        return $this->orderOptions()->where('attributes.is_variant', 0);
    }

    /**
     * lấy ra các thuộc tính biến thể
     *
     * @return array
     */
    public function getVariantAttributes()
    {
        return $this->parseAttributeData($this->variants, 1, 1);
    }

    /**
     * lấy ra các thuộc tính trong đơn hàng nhưng không phải biến thể
     *
     * @return array
     */
    public function getNotVariantAttributes()
    {
        return $this->parseAttributeData($this->notVariantAttributes, 1, 0);
    }


    /**
     * lấy ra các thuộc tính trong đơn hàng nhưng không phải biến thể
     *
     * @return array
     */
    public function getOrderAttributes()
    {
        return $this->parseAttributeData($this->notVariantAttributes, 1, 0);
    }

    /**
     * lấy ra các thuộc tính không nằm trong đơn hàng
     * @return array
     */
    public function getProductAttributes()
    {
        return $this->parseAttributeData($this->notOrderOptions);
    }
    

    /**
     * chuần hóa data trả về theo đúng logic
     *
     * @param \Illuminate\Support\Collection $attributes
     * @param integer $is_order_option
     * @param integer $is_variant
     * @return array
     */
    protected function parseAttributeData($attributes, $is_order_option = 0, $is_variant = 0)
    {
        $data = [];
        if(count($attributes)){
            $group = $is_variant ? 'variant': 'attribute';
            $pg = 'product-'.$group;
            $prefix = get_prefix_classname();
            foreach ($attributes as $attr) {
                $avt = $attr->advance_value_type;
                if(!isset($data[$attr->attribute_id])){
                    $d = [
                        'attribute_id' => $attr->attribute_id,
                        'name' => $attr->name,
                        'label' => $attr->label,
                        'type' => $attr->show_type,
                        'group_class' => parse_classname($pg . '-group', $pg . '-group-'. $attr->name, $pg . '-type-' . $avt),
                        'list_class' => parse_classname($pg . '-type-' . $avt . '-list', $pg . '-'. $attr->name . '-list', 'product-attribute-'.$avt.'-values'),
                        'select_class' => parse_classname($pg . '-select', $pg . '-select-' . $avt, $pg . '-type-' . $avt . '-select', $pg . '-' . $attr->name . '-select'),
                        'prefix_class' => $prefix
                    ];

                    if($is_order_option){
                        $f = [
                            'advance_value_type' => $attr->advance_value_type,
                            'value_unit' => $attr->value_unit,
                            'values' => []
                        ];
                        if($is_variant){
                            $f['change_type'] = $attr->price_type ? 'replace' : 'plus';
                        }
                        $d+=$f;
                    }                    
                    $data[$attr->attribute_id] = $d;
                }
                
                $values = [
                    'id' => $attr->product_attribute_id,
                    'value_id' => $attr->attribute_value_id,
                    'value' => $attr->{$attr->value_type.'_value'},
                    'text' => $attr->text_value?$attr->text_value:(
                        $attr->{$attr->value_type.'_value'} . (
                            ($attr->value_type == 'int' || $attr->value_type == 'decimal') ? ' '.$attr->value_unit:''
                        )
                    ),
                    'advance_type' => $attr->advance_value_type,
                    'advance_value' => ($av = $attr->variant_advance_value ?$attr->variant_advance_value: $attr->attribute_advance_value) ? (
                        $attr->advance_value_type == 'image' ? asset('static/products/'.($av?(($attr->variant_advance_value?'variants/':'attributes/').$av):'variants/default.png')) : $av
                    ) : null,
                    'item_class' => parse_classname($pg.'-value', $pg.'-value-item', $pg.'-value-id-'.$attr->product_attribute_id, $pg.'-value-option')
                ];

                
                
                if($is_variant){
                    $values['price'] = $attr->price;
                    
                }
                
                $data[$attr->attribute_id]['values'][$attr->attribute_value_id] = new Arr($values);
            }
        }
        if($data){
            return array_map(function($value){return new Arr($value);}, $data);
        }
        return [];
    }
    
    public function priceFormat($price_type = 'list')
    {
        $price = $price_type == 'final' ? $this->getFinalPrice() : $this->{$price_type.'_price'};
        return get_currency_format($price);
    }

    /**
     * tính giá cuối cùng (sau các loại khuyến mãi)
     * @return double
     */
    public function getFinalPrice()
    {
        $price = $this->on_sale?$this->sale_price:$this->list_price;
        if(count($this->promoAvailable)){
            foreach ($this->promoAvailable as $promo) {
                $down_price = $promo->down_price;
                if($promo->type == 2){
                    $price = $down_price;
                }elseif ($promo->type == 1) {
                    $down = $down_price * $price / 100;
                    $price -= $down;
                }else{
                    $price -= $down_price;
                }
            }
        }
        return $price;
    }

    /**
     * tính giá cuối cùng (sau các loại khuyến mãi)
     * @return double
     */
    public function getDownPercent()
    {
        $price = $this->getFinalPrice();
        $list_price = $this->list_price?$this->list_price:1;
        return round(($this->list_price - $price) / $list_price * 100);
    }

    

    /**
     * lấy điểm dánh giá trung bình
     *
     * @return int
     */
    public function getReviewPoints()
    {
        $t = count($this->reviews);
        if(!$t) return 0;
        $total = 0;
        $perfect = 5;
        foreach ($this->reviews as $review) {
            $total += $review->rating;
        }
        $avg = $total / ($t * $perfect) * $perfect;

        return round($avg, 1);

    }

    
    /**
     * lấy điểm dánh giá trung bình
     *
     * @return int
     */
    public function getReviewData()
    {
        $t = count($this->reviews);
        if(!$t) return 0;
        $total = 0;
        $perfect = 5;
        foreach ($this->reviews as $review) {
            $total += $review->rating;
        }
        $avg = $total / ($t * $perfect) * $perfect;

        return round($avg, 1);

    }
    public function countReview()
    {
        return count($this->reviews);
    }

    /**
     * có khuyến mãi
     * @return bool
     */
    public function hasPromo()
    {
        return (count($this->promoAvailable) > 0 || $this->on_sale);
    }

    public function countTotal()
    {
        return $this->warehouse()->sum('total');
    }

    public function hasVariant()
    {
        return (($this->variants_count!==null) ? $this->variants_count : count($this->variants)) > 0;
    }

    public function hasOption()
    {
        return count($this->orderOptions) > 0;
    }

    public function canReview()
    {
        return true;
        return can_review_product($this->id);
    }
    /**
     * ẩn sản phẩm
     */
    public function hidden()
    {
        $this->deleted++;
        $this->save();
    }

    /**
     * hiện sản phẩm
     */
    public function visible()
    {
        $this->deleted--;
        $this->save();
    }
    

    /**
     * lay du lieu form
     * @return array
     */
    public function toFormData()
    {
        $this->applyMeta();
        $data = $this->toArray();
        if($this->feature_image){
            $data['feature_image'] = $this->getFeatureImage();
        }
        $tags = [];
        if(count($this->productTags)){
            foreach ($this->productTags as $tagged) {
                $tags[] = $tagged->tag_id;
            }
        }
        $data['tags'] = $tags;
        $data['total'] = $this->countTotal()??'';
        return $data;
    }


    /**
     * lấy tên thư mục chứa ảnh thumbnail / feature image
     * @return string tên tư mục
     */
    public function getImageFolder() : string
    {
        return 'products';
    }


    /**
     * get image url
     * @param boolean $urlencode mã hóa url
     * @return string 
     */
    public function getFeatureImage($size=false)
    {
        if($this->feature_image){
            $feature_image = $this->feature_image;
        }else{
            $feature_image = '000-default.png';
        }
        $fd = $this->getImageFolder();
        if($size && file_exists(public_path('static/'.$fd.'/'.$size.'/'.$feature_image))){
            return asset('static/'.$fd.'/'.$size.'/'.$feature_image);
        }
        $url = asset('static/'.$fd.'/'.$feature_image);
        return $url;
    }

    public function getThumbnail()
    {
        if($this->feature_image){
            $feature_image = $this->feature_image;
        }else{
            $feature_image = '000-default.png';
        }
        $fd = $this->getImageFolder();
        if(file_exists(public_path('static/'.$fd.'/thumbs/'.$feature_image))){
            return asset('static/'.$fd.'/thumbs/'.$feature_image);
        }
        $url = asset('static/'.$fd.'/'.$feature_image);
        return $url;
    }
    
    // lấy hình ảnh theo kích thước

    public function getImage($size = null)
    {
        if (!$size) {
            return $this->getFeatureImage();
        } elseif (in_array($size, ['thumb',  'thumbnail'])) {
            return $this->getThumbnail();
        } elseif (in_array($size, ['social',  '90x90'])) {
            return $this->getFeatureImage($size);
        } else {
            if ($this->feature_image) {
                $feature_image = $this->feature_image;
            } else {
                $feature_image = '000-default.png';
            }
            return asset('static/' . $this->getImageFolder() . '/' . $size . '/' . $feature_image);
        }
    }

    public function getViewUrl()
    {
        return get_product_url($this);
    }
    
    
    public function getFullTitle()
    {
        $title = '';
        if($this->category_id){
            if($category = get_model_data('product_category', $this->category_id)){
                $tree = $category->getTree();

                foreach ($tree as $cate) {
                    $title = $cate->name.' | '.$title;
                }
            }
        }
        $title = $this->name . ' | '.$title;
        $title.=' | Sản phẩm';
        return $title;
    }

        /**
     * lay61 key words
     *
     * @return void
     */
    public function getSeoKeywords()
    {
        $data = [];
        if($this->keywords) $data[] = $this->keywords;
        if(count($tags = $this->tags)){
            foreach ($tags as $key => $tag) {
                $data[] = $tag->keyword;
            }
        }
        return implode(', ', $data);
    }


    /**
     * xoa image
     */
    public function deleteFeatureImage()
    {
        $fd = $this->getImageFolder();
        if ($this->feature_image && file_exists($path = public_path('static/' . $fd . '/' . $this->feature_image))) {
            unlink($path);
            if (file_exists($p = public_path('static/' . $fd . '/90x90/' . $this->feature_image))) {
                unlink($p);
            }
            if (file_exists($p = public_path('static/' . $fd . '/thumbs/' . $this->feature_image))) {
                unlink($p);
            }if (file_exists($p = public_path('static/' . $fd . '/social/' . $this->feature_image))) {
                unlink($p);
            }
        }
    }


     /**
     * ham xóa file cũ
     * @param int $id
     * 
     * @return boolean
     */
    public function deleteAttachFile()
    {
        return $this->deleteFeatureImage();
    }

    /**
     * lấy tên file đính kèm cũ
     */
    public function getAttachFilename()
    {
        return $this->feature_image;
    }

    /**
     * xóa tài nguyên
     */
    public function deleteResources()
    {
        $this->applyMeta();
        if($this->resources && is_array($this->resources)){
            $fd = $this->getImageFolder();
            foreach ($this->resources as $file) {
                if(file_exists($p = public_path('static/'.$fd.'/'.$file))){
                    unlink($p);
                }
                if(file_exists($p = public_path('static/'.$fd.'/thumbs/'.$this->feature_image))){
                    unlink($p);
                }
            }
        }
    }
    
    /**
     * xóa dữ liệu
     */
    public function beforeDelete()
    {
        // delete meta
        if(count($this->metadatas)){
            foreach ($this->metadatas as $metadata) {
                $metadata->delete();
            }
        }
        // deletegallery
        if(count($this->gallery)){
            foreach ($this->gallery as $gallery) {
                $gallery->delete();
            }
        }
        if(count($this->productAttributes)){
            foreach ($this->productAttributes as $productAttribute) {
                $productAttribute->delete();
            }
        }
        // xóa tài nguyên
        $this->deleteResources();
        
        // delete image
        $this->deleteFeatureImage();

        // xóa liên kết sản phẩm
        $this->refs()->delete();

        // xóa kho hàng
        $this->warehouse()->delete();

        $this->productReviews()->delete();

    }

}
