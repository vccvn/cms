@php
    $args = [
        '@limit' => $data->post_number?$data->post_number:4,
        '@sort' => $data->sorttype?$data->sorttype:1,
        '@withTags' =>  true,
        '@withAuthor' => true,
        '@withCountPublishComments' => 'comment_count'
    ];
    $link = null;
    $title = null;
    if($data->dynamic_id && $dynamic = $helper->getDynamic(['id' => $data->dynamic_id])){
        $args['dynamic_id'] = $data->dynamic_id;
        $title = $dynamic->name;
        $link = $dynamic->getViewUrl();
    }
    if($data->category_id && $category = $helper->getPostCategory(['id' => $data->category_id])){
        $args['@category'] = $data->category_id;
        if($category->hasChild() && $data->group_by_category) $args['@groupBy'] = ['posts.category_id'];
        if(!$title) $title = $category->name;
        $link = $category->getViewUrl();
    }elseif($data->group_by_category) $args['@groupBy'] = ['posts.category_id'];
    $args['@withCategory'] = true;
    if($data->title) $title = $data->title;
    if($data->link) $link = $data->link;
@endphp

@if (count($posts = $helper->getPosts($args)))
    <!-- Blog Section Start Here -->
    <section class="blog-section blog-page padding-tb {{$data->background?'bg-image':''}}" @if($data->background) style="backgroubd-image: url({{$data->background}});" @endif>
        <div class="container">
            <div class="section-header">
                <img src="{{$data->icon(desktop_asset('images/header/sc-img.png'))}}" alt="sc-img" class="header-img">
                <span>{{$data->sub_title}}</span>
                <h2>{{$data->title}}</h2>
            </div>
            <div class="section-wrapper">
                <div class="row justify-content-center">
                    @foreach ($posts as $post)
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="post-item">
                                <div class="post-item-inner">
                                    <div class="post-thumb">
                                        <a href="{{$u = $post->getViewUrl()}}">
                                            <img src="{{$post->getThumbnail()}}" alt="{{$post->title}}">
                                        </a>
                                    </div>
                                    <div class="post-content">
                                        <h5><a href="{{$u}}">{{$post->sub('title', 40)}}</a></h5>
                                        <div class="author-date">
                                            <a href="{{$u}}" class="date"><i class="icofont-calendar"></i>{{$post->dateFormat('d/m/Y')}}</a>
                                            <a href="{{$u}}" class="admin"><i class="icofont-ui-user"></i>{{$post->author?$post->author->name:''}}</a>
                                        </div>
                                        <p>{{$post->getShortDesc(100)}}</p>
                                        <div class="post-footer">
                                            <a href="{{$u}}" class="text-btn">Chi tiết<i class="icofont-double-right"></i></a>
                                            <a href="{{$u}}#comments" class="comments"><i class="icofont-comment"></i><span>{{$post->comment_count?$post->comment_count:0}}</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section Ending Here -->
@endif