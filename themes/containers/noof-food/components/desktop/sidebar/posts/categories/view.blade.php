@php
    $url = null;
    $args = [
        '@limit' => $data->cate_number?$data->cate_number:10,
        '@advance' => ['post_count'],
    ];
    $title = null;
    if($data->get_by_dynamic_active && $active = $helper->getActiveModel('dynamic')){
        $args['dynamic_id'] = $active->id;
        $title = $active->name;
        
    }
    else{
        if($data->dynamic_id && $dynamic = $helper->getDynamic(['id' => $data->dynamic_id])){
            $args['dynamic_id'] = $data->dynamic_id;
            $title = $dynamic->name;
            $url = $dynamic->getViewUrl();
        }
        if($data->category_id && $category = $helper->getPostCategory(['id' => $data->category_id])){
            $args['parent_id'] = $data->category_id;
            if(!$title) $title = $category->name;
        }
        
    }
    if($data->title) $title = $data->title;
@endphp



@count($categories = $helper->getPostCategories($args))

<div class="widget widget-category">
    <div class="widget-header">
        <h5>{{$title}}</h5>
    </div>
    <ul class="widget-wrapper">
        @foreach ($categories as $category)
            
            <li>
                <a class="d-flex flex-wrap justify-content-between" href="{{$category->getViewUrl()}}" title="{{$category->name}}">
                    <span><i class="icofont-double-right"></i>{{$category->name}}</span> <span>({{$category->post_count}})</span>
                </a>
            </li>
            
        @endforeach
    </ul>
</div>

@endcount

