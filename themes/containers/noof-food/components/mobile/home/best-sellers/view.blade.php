@php
    $allow_place_order = $ecommerce->allow_place_order;
    $args = [
        '@limit'=>$data->product_number(12), 
        '@sorttype'=>$data->sorttype(1),
        '@with' => ['promoAvailable', 'category'],  // ấy chi tiết khuyến mãi của sản phẩm
        '@withReview' => true, // lấy thông tin đánh giá
        '@withOption' => true // lấy các tùy chọn như màu sắc, kích cỡ, ...
    ];
    if($data->category_id && count($category = $helper->getProductCategory(['id' => $data->category_id]))){
        $args['@category'] = $category->id;
    }
    $products = $helper->getProducts($args);
@endphp

@if ($t = count($products))
    <!--=============== BEST-SELLERS ===============-->    
    <section id="best-sellers" class="section-padding">
        <div class="container-fluid text-center">
            <h3 class="page-heading">{{$data->title('Bán chạy')}}</h3>
            <hr class="page-heading-line" />
            
            <div class="menu">
                                    
                <div class="owl-carousel owl-theme owl-auto-arrow" id="owl-best-sellers">

                    @foreach ($products as $product)
                        @php
                            $hasOption = $product->hasOption();
                            $votes = $product->getReviewPoints();
                            $intVote = (int) $votes;
                            $max = $intVote < $votes ? $intVote + 1 : $intVote;
                            $hasPromo = $product->hasPromo();
                            $name = str_limit($product->name, 40);


                            $reviews = $product->getReviewData();
                        @endphp
                        @if ($loop->index == 0 || $loop->index % 2 == 0)
                        
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

                                                <a href="{{$hasOption?$u:'javascript:void(0)'}}" class="btn btn-primary {{$hasOption? 'product-quick-view '.parse_classname('product-quick-view'): parse_classname('add-to-cart')}}" data-product-id="{{$product->id}}">Thêm giỏ hàng <span><i class="fa fa-shopping-cart"></i></span></a>
                                            
                                            @endif
                                        </div><!-- end dish-list-text -->
                                    </div><!-- end dish-list -->
                                </div><!-- end grid -->
                                
                        @if ($loop->last || $loop->index %2 == 1)

                            </div>

                        @endif

                    @endforeach
                
                </div><!-- end owl-menu -->
                        
            </div><!-- end menu -->
            
        </div><!-- end container-fluid -->
    </section><!-- end best-sellers -->
@endif
