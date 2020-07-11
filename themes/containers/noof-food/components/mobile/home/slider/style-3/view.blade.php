
@if ($data->slider_id && ($slider = $helper->getSlider($data->slider_id)) && count($slider->items))

                        
            <!--=========== SLIDER ==========-->
            <div class="flexslider flex-control-nav-black" id="slider">
                <ul class="slides">
        
                    @foreach ($slider->items as $item)

                        <li class="item-{{$loop->index+1}}" style="background:linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('{{$item->image_url}}'); background-size:cover;">
                            <div class="container text-center meta">
                                
                                <h1 class="mg-b-6">{{$item->title}}</h1>
                                
                                <p>{{$item->description}}</p>
                                <span class="meta-highlight mg-t-10 meta-black">{{$item->sub_title}}</span>
                                {{-- <a href="{{$item->link}}" class="btn btn-primary btn-radius">{{$data->button_text('Chi tiết')}}</a> --}}
                            </div>  
                        </li><!-- end item-{{$loop->index+1}} -->
                        
                    @endforeach
                </ul>
            </div><!-- end flexslider -->
            

@endif
                
            