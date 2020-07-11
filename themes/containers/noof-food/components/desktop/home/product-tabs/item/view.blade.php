@php
    $args = [
        '@sorttype' => $data->sorttype, // sắp xếp
        '@limit' => $data->product_number(12), // số sản phẩm. mặc dịnh 4
        '@with' => ['promoAvailable', 'category'],  // ấy chi tiết khuyến mãi của sản phẩm
        '@withReview' => true, // lấy thông tin đánh giá
        '@withOption' => true // lấy các tùy chọn như màu sắc, kích cỡ, ...
    ];
@endphp

<div id="product-tab-{{$tab->component->id}}" class="tabcontent">
    @include($_template.'product-grid', [
        'args' => $args,
        'list_class' => 'no-gutters',
        'column_class' => 'col-lg-6 col-12',
        'item_style' => 2
    ])
</div>
