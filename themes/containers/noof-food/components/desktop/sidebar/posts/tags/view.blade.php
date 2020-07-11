@if (count($tags = $helper->getTags(['@sort'=> $data->sorttype, '@limit' => $data->tag_number])))


<div class="widget widget-tags">
    <div class="widget-header">
        <h5>{{$data->title('Thẻ bải viết')}}</h5>
    </div>
    <ul class="widget-wrapper">
        @foreach ($tags as $tag)
        <li>
            <a href="{{route('client.posts.tag', ['tag' => $tag->slug])}}">{{$tag->name}}</a>
        </li>
        @endforeach
    </ul>
</div>
    


@endif