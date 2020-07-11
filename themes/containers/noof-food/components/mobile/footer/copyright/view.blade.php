@php
    $general = $options->theme->general->makeByPrefix('mobile_')
@endphp
<p class="copyright">
    @if ($data->copyright)
        {!! $data->copyright !!}
    @else
        @php
            $y = date('Y');
        @endphp
        © 2020 {{$y==2020?'': ' - ' . $y}} 
        <a href="{{route('home')}}"> @if ($general->logo_icon)
            <span><i class="{{$general->logo_icon}}"></i></span>
            @endif
            {!!$general->logo_text($siteinfo->site_name)!!}
        </a>. Giữ toàn quyền
    @endif
    
</p>