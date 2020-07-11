

            <!-- banner section satrt here -->
            <section class="banner-area bg_size" style="background-image: url({{$data->background(desktop_asset('css/bg-image/banner-bg.jpg'))}});">
                <div class="overlay"></div>
                <div class="container">
                    <div class="banner-content text-center">
                        <span>{{$data->sub_title}}</span>
                        <h2>{{$data->title}}</h2>
                        <h3>{{$data->title2}}</h3>
                        <div class="banner-btn-group">
                            @if ($data->button_1_text)
                                <a href="{{$data->button_1_link}}" class="food-btn"><span>{{$data->button_1_text}}</span></a>
                            @endif
                            @if ($data->button_2_text)
                                <a href="{{$data->button_2_link}}" class="food-btn style-2"><span>{{$data->button_2_text}}</span></a>
                            @endif
                            
                        </div>
                    </div>
                </div>
            </section>
            <!-- banner section ending here -->
         