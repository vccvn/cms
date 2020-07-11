@php
    $args = [
        '@limit' => $data->post_number?$data->post_number:20,
        '@sort' => $data->sorttype?$data->sorttype:1
    ];
    $title = null;
    if($data->dynamic_id && $dynamic = $helper->getDynamic(['id' => $data->dynamic_id])){
        $args['dynamic_id'] = $data->dynamic_id;
        $title = $dynamic->name;
    }
    if($data->category_id && $category = $helper->getPostCategory(['id' => $data->category_id])){
        $args['@category'] = $data->category_id;
        if(!$title) $title = $category->name;
    }
    
    if($data->content_type && $data->content_type != 'all'){
        $args['content_type'] = $data->content_type;
    }
    if($data->title) $title = $data->title;
    
@endphp

@if (count($list = $helper->getPosts($args)))
    
<div class="widget widget-post">
    <div class="widget-header">
        <h5>{{$title?$title:'Mới nhất'}}</h5>
    </div>
    <ul class="widget-wrapper">
        @foreach ($list as $item)
            <li class="d-flex flex-wrap justify-content-between">
                <div class="post-thumb">
                    <a href="{{$u = $item->getViewUrl()}}"><img src="{{$item->getImage('90x90')}}" alt="{{$item->title}}"></a>
                </div>
                <div class="post-content">
                    <h6><a href="{{$u}}">{{$item->title}}</a></h6>
                    <p>{{$item->dateFormat('d/m/Y')}}</p>
                </div>
            </li>
        @endforeach
    </ul>
</div>
@endif