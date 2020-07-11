@if ($promo = $helper->getPromoDetail(['id' => $data->promo_id]))
    @php
        $args = [
            '@promo' => $promo->id, // lấy sản phẩm theo mã chương trình khuyến mãi
            '@sorttype' => $data->sorttype, // sắp xếp
            '@limit' => $data->product_number(4), // số sản phẩm. mặc dịnh 4
            '@with' => ['promoAvailable', 'category'],  // ấy chi tiết khuyến mãi của sản phẩm
            '@withReview' => true, // lấy thông tin đánh giá
            '@withOption' => true // lấy các tùy chọn như màu sắc, kích cỡ, ...
        ];
    @endphp
    @if (count($products = $helper->getProducts($args)))
                
            <!-- Food Product Section Start here -->
            <section class="product bg_size p-rel padding-tb" style="background-image: url({{$data->background(desktop_asset('css/bg-image/product-bg.jpg'))}});">
                <div class="overlay"></div>
                <div class="container">
                    <div class="section-header">
                        <img src="{{$data->icon(desktop_asset('images/header/sc-img.png'))}}" alt="sc-img" class="header-img">
                        <span>{{$data->sub_title}}</span>
                        <h2>{{$data->title}}</h2>
                    </div>
                    <div class="section-wrapper">
                        <div class="row">
                            @foreach ($products as $product)
                                @include($_template.'product-grid-item')
                            @endforeach

                        </div>
                    </div>
                </div>
            </section>
            <!-- Food Product Section Ending here -->
    @endif
@endif