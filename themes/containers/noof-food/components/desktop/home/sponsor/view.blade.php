

@if ($data->slider_id && ($slider = $helper->getSlider($data->slider_id)) && count($slider->items))
    <!-- Sponsor Section Start Here -->
    <div class="sponsor-section">
        <div class="container">
            <div class="section-wrapper">
                <div class="sponsor-slider">
                    <div class="swiper-wrapper">
                        @foreach ($slider->items as $item)
                            <div class="swiper-slide">
                                <div class="sponsor-item">
                                    <div class="sponsor-thumb">
                                        <a href="{{$item->link}}"><img src="{{$item->image_url}}" alt="{{$item->title}}"></a>
                                    </div>
                                </div>
                            </div>
                            
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Sponsor Section Ending Here -->

@endif
