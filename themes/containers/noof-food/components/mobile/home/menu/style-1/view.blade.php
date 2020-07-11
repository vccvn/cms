@php
    $allow_place_order = $ecommerce->allow_place_order;
    $tabs = [];
    if($data->categories && count($categories = $helper->getProductCategories(['id' => $data->categories]))){
        foreach ($categories as $key => $cate) {
            $tab = $cate->toArray();
            
            $tab['products'] = $helper->getProducts([
                '@category'=>$cate->id, 
                '@limit'=>$data->product_number(12), 
                '@sorttype'=>$data->sorttype(1),
                '@with' => ['promoAvailable', 'category'],  // ấy chi tiết khuyến mãi của sản phẩm
                '@withReview' => true, // lấy thông tin đánh giá
                '@withOption' => true // lấy các tùy chọn như màu sắc, kích cỡ, ...
            ]);
            $tabs[] = $tab;
        }
    }else{
        $tabs[] = [
            'name' => 'Danh sách',
            'slug' => 'product-list',
            'products' => $helper->getProducts([
                '@limit'=>$data->product_number(12), 
                '@sorttype'=>$data->sorttype(1),
                '@with' => ['promoAvailable', 'category'],  // ấy chi tiết khuyến mãi của sản phẩm
                '@withReview' => true, // lấy thông tin đánh giá
                '@withOption' => true // lấy các tùy chọn như màu sắc, kích cỡ, ...
            ])
        ];
    }
@endphp

    
<!--============= MENU ============-->    
<section class="menu section-padding">
    <div class="container-fluid text-center">
        <h3 class="page-heading">{{$data->title('Thực đơn')}}</h3>
        <hr class="page-heading-line" />
        <ul class="nav nav-tabs justify-content-center">

            @foreach ($tabs as $tab)

            <li class="nav-item"><a class="nav-link {{$loop->index == 0?'active':''}}" href="#{{$tab['slug']}}-dishes" data-toggle="tab">{{$tab['name']}}</a></li>    

            @endforeach
            
        </ul>
        
        <div class="tab-content">
            @foreach ($tabs as $tab)

                <div id="{{$tab['slug']}}-dishes" class="tab-pane {{$loop->index == 0?'active':''}}">
                    <div class="owl-carousel owl-theme owl-menu">

                        @if ($t = count($tab['products']))
                            @php
                                $i = 0;
                            @endphp
                            @foreach ($tab['products'] as $product)
                                @php
                                    $hasOption = $product->hasOption();
                                    $votes = $product->getReviewPoints();
                                    $intVote = (int) $votes;
                                    $max = $intVote < $votes ? $intVote + 1 : $intVote;
                                    $hasPromo = $product->hasPromo();
                                    $name = str_limit($product->name, 40);


                                    $reviews = $product->getReviewData();
                                @endphp
                                @if ($i==0 || $i%2==0)
                                
                                    <div>

                                @endif

                                        <div class="grid">
                                            <div class="dish-list">
                                                <a href="{{$u = $product->getViewUrl()}}"><img src="{{$product->getThumbnail()}}" class="img-fluid" alt="{{$product->name}}" /></a>
                                                <div class="dish-list-text">
                                                    <h4><a href="{{$u}}">{{$product->sub('name', 40, '...')}}</a></h4>
                                                    <h5>{{$product->priceFormat('final')}}</h5>
                                                    {{-- <p>{{$product->getShortDesc(120)}}</p> --}}
                                                    @if ($allow_place_order)

                                                        <a href="{{$hasOption?$u:'javascript:void(0)'}}" class="btn {{$hasOption? 'product-quick-view '.parse_classname('product-quick-view'): parse_classname('add-to-cart')}}" data-product-id="{{$product->id}}">Thêm giỏ hàng <span><i class="fa fa-shopping-cart"></i></span></a>
                                                    
                                                    @endif
                                                </div><!-- end dish-list-text -->
                                            </div><!-- end dish-list -->
                                        </div><!-- end grid -->
                                        
                                @if ($i==$t-1 || $i%2==1)

                                    </div>

                                @endif

                                @php
                                    $i++;
                                @endphp
                            @endforeach
                        @endif

                    </div><!-- end owl-menu -->
                </div><!-- end breakfast-dishes -->
            @endforeach
            
            
        </div><!-- end tab-content -->
    </div><!-- end container-fluid -->
</section><!-- end menu -->
