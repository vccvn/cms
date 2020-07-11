@php
$socials = $options->theme->socials;
$list = ['facebook', 'twitter', 'instagram', 'youtube', 'linkedin'];
$class = $data->style == '3' ? ' no-back bordered-social mg-t15-b0 ' : (
    $data->style == '2' ? '-2 no-back ': (
        ' '
    )
)
@endphp

<ul class="footer-social{{$class}} list-unstyled list-inline">
    @foreach ($list as $item)
        @if ($link = $data->get($item, $socials->get($item)))
        <li class="list-inline-item"><a href="{{$link}}"><span><i class="fab fa-{{$item.($item == 'facebook'?'-f':'')}}"></i></span></a></li>
        @endif
    @endforeach
</ul>