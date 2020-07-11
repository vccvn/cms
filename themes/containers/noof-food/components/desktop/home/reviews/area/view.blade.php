
    
            <!-- clients area start -->
            <section class="clients-area padding-tb bg_size p-rel" style="background-image: url({{$data->background(desktop_asset('images/clients/clients_bg.jpg'))}});">
                <div class="overlay"></div>
                <div class="container">
                    <div class="section-header text-center">
                        <img src="{{$data->icon(desktop_asset('images/header/sc-img.png'))}}" alt="sc-img" class="header-img">
                        <span>{{$data->sub_title}}</span>
                        <h2>{{$data->title}}</h2>
                    </div>
                    <div class="section-wrapper">
                        <div class="clients-container">
                            <div class="swiper-wrapper">
                                @if ($data->list_type == 'data')
                                    @if ($data->item_number > 0 && count($reviews = $helper->getProductReviews(['@sort' => $data->sort_type, '@limit' => $data->item_number])))
                                        @foreach ($reviews as $review)
                                            <div class="swiper-slide">
                                                <div class="clients-item text-center">
                                                    <div class="clients-thumb">
                                                        <img src="{{$review->getFeatureImage()}}" alt="{{$review->review_name}}">
                                                    </div>
                                                    <div class="clients-text">
                                                        <p>
                                                            <span><i class="fas fa-quote-left"></i></span>
                                                            {{$review->comment}}
                                                            <span><i class="fas fa-quote-right"></i></span>
                                                        </p>
                                                        <div class="rating">
                                                            @for ($i = 0; $i < $review->rating; $i++)
                                                                <span><i class="fa fa-star"></i></span>
                                                            @endfor
                                                        </div>
                                                        <h6>{{$review->review_name}}</h6>
                                                        <span>Khách hàng</span>
                                                    </div>
                                                </div>
                                            </div>
                
                                            
                                        @endforeach
                                    @endif
                                @else
                                    <!--reviews -->
                                    {!! $html->desktop_home_reviews->components !!}
                                @endif
                                
                            </div>
                        </div>
                        <div class="clients-pagination"></div>
                    </div>
                </div>
            </section>
            <!-- clients area ends -->
    
    