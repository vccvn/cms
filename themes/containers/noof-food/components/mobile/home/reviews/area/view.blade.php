@php
    $styles = [
        1 => 'text-white',
        2 => ''
    ];
    $class = $styles[$data->style]??'text-white';
@endphp
                
            <!--=============== TESTIMONIAL ===============-->
            <section id="testimonial" class="section-padding {{$class}}"> 
                <div class="container-fluid">
                    <h3 class="page-heading white-heading">{{$data->title}}</h3>
                    <hr class="page-heading-line white-line" />
                    <div class="owl-carousel owl-theme" id="owl-testimonial">
                    

                    @if ($data->list_type == 'data')
                        @if ($data->item_number > 0 && count($reviews = $helper->getProductReviews(['@sort' => $data->sort_type, '@limit' => $data->item_number])))
                            @foreach ($reviews as $review)
    
                                <div class="item">
                                    <div class="review-block">
                                        <div class="reviewer-text">
                                            <ul class="list-unstyled list-inline star-rating">
                                                @for ($i = 0; $i < $review->rating; $i++)
                                                    <li class="list-inline-item"><span><i class="fa fa-star"></i></span></li>
                                                @endfor
                                            </ul>
                                            
                                            <blockquote> {{$review->comment}}
                                                <footer class="blockquote-footer">{{$review->review_name}}</footer>
                                            </blockquote>
                                        </div><!-- end reviewer-text -->
            
                                        <div class="reviewer-img">
                                            <img src="{{$review->getFeatureImage()}}" alt="{{$review->review_name}}" class="rounded-circle">
                                        </div><!-- end reviewer-img -->
                                    </div><!-- end review-block -->
                                </div><!-- end item -->
                                

                                
                            @endforeach
                        @endif
                    @else
                        <!--reviews -->
                        {!! $html->mobile_home_reviews->components !!}
                    @endif
                    
                        
                    </div><!-- end owl-testimonial -->
                </div><!-- end container-fluid -->
            </section><!-- end testimonial -->
            
