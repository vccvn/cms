@php
$socials = $options->theme->socials;
$list = ['facebook', 'twitter', 'instagram', 'youtube', 'linkedin'];

$className = '';

foreach(['xs', 'sm', 'md', 'lg', 'xl'] as $size){
    if($col = $data->get('col_' . $size)){
        $className .= (' col-' . ($size == 'xs' ? $col : $size . '-' . $col));
    }
}

@endphp



<div class="{{$className}}">
    <div class="news_letter">
        <h5>{{$data->title('Đăng ký nhận tin')}}</h5>
        <p>
            {{$data->description}}
        </p>
        <div class="contact-search">
            <form method="post" action="{{route('client.subcribe')}}" class="searchForm {{parse_classname('subcribe-form')}}">              
                <input class="searchTerm"  type="email" name="email" placeholder="Nhập Email" autocomplete="off">
                <button type="submit" class="searchBtn"> {{$data->subscribe_button('Đăng ký')}} </button>
            </form> 
        </div>
        @if ($data->show_socials)
            
        <ul class="follow_us">
            <li>
                <p>Follow: </p>
            </li>
            @foreach ($list as $item)
                @if ($link = $socials->get($item))
                <li><a href="{{$link}}"><i class="fab fa-{{$item}}"></i></a></li>
                @endif
            @endforeach
        </ul>
        
        @endif
    </div>
</div>