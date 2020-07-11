
    
        <!-- link area start -->
        <div class="news_link">
            <div class="container">
                <div class="order-content">
                    <div class="content-logo">
                        <a href="{{$data->link(route('home'))}}">
                            <img src="{{$data->logo($siteinfo->logo)}}" alt="{{$siteinfo->site_name}}">
                            <p>{{$data->slogan($siteinfo->slogan)}}</p>
                        </a>
                    </div>
                    <div class="content-link">
                        <ul>
                            <li>
                                <h5>{{$data->right_title}}</h5>
                            </li>
                            @if ($data->show_button)
                                
                            <li>
                                <a href="{{$data->button_link}}" class="food-btn style-2">
                                    <span>{{$data->button_text}}</span>
                                </a>
                            </li>
                            
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- link area ends -->

