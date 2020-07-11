
    <div class="widget widget-banner">
        @if ($data->title)
        <div class="widget-header">
            <h5>{{$data->title}}</h5>
        </div>
        @endif
        <ul class="widget-wrapper d-flex flex-wrap justify-content-center">
            <li>
                @if ($data->ads_type == 'code')
                    {!! $data->ads_code !!}
                @else
                    <a href="{{$data->link}}"><img src="{{$data->banner}}" alt="{{$data->alt}}"></a>    
                @endif
                
            </li>
        </ul>
    </div>