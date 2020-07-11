@php
    // html là biến đối tưỡng của hệ thống chứa các thuộc tính lá các area object
    // area object chứa 2 thành phần là components và embeds
    // embed là mã nhúng thường là các sdk bên thứ 3 cần nhúng vào trang web
    // component là các thành phần thường đi theo  giao diện có thể dễ dàng yuy2 biến và sắp xếp
    
    $tabs = $html->desktop_home_product_tabs->components->getComponents();
    $active = 0;
    $categories = [];
    if(count($tabs)){
        foreach($tabs as $i => $tab){
            $data = $tab->data;
            if($tab->data->active){
                $active = $i;
            }
            if($data->category_id && $category = $helper->getProductCategory(['id' => $data->category_id])){
                $categories[$i] = $category;
            }else{
                $categories[$i] = null;
            }
        }
    }
@endphp


<!-- Food Product Section Style 2 Start here -->
<section class="product style-2 padding-tb" style="background-image: url({{$data->background(desktop_asset('css/bg-image/product-2.jpg'))}});">
    <div class="container">
        <div class="section-header">
            <img src="{{$data->icon(desktop_asset('images/header/sc-img.png'))}}" alt="sc-img" class="header-img">
            <span>{{$data->sub_title}}</span>
            <h2>{{$data->title}}</h2>
        </div>
        <div class="section-wrapper">
            @if (count($tabs))
                
            <ul class="tab-bar">
                @foreach ($tabs as $tab)
                    @php
                        $data = $tab->data;
                        $category = $categories[$loop->index]??null;
                        $title = $data->title?$data->title:($category?$category->name:'Tab Item ' .  $loop->index);
                    @endphp
                    <li class="tablinks" @if ($loop->index == $active) id="defaultOpen" @endif onclick="openCity(event, 'product-tab-{{$tab->component->id}}')">
                        @if ($data->icon || ($category && $category->feature_image && $image = $category->getFeatureImage()))
                        <img src="{{desktop_asset('images/product/icon/01.png')}}" alt="{{$title}}">
                        @endif
                        <span>{{$title}}</span>
                    </li>
                    
                @endforeach
            </ul>
            @foreach ($tabs as $tab)
                @php
                    $data = $tab->data;
                    $args = [
                        '@sorttype' => $data->sorttype, // sắp xếp
                        '@limit' => $data->product_number(12), // số sản phẩm. mặc dịnh 4
                        '@with' => ['promoAvailable', 'category'],  // ấy chi tiết khuyến mãi của sản phẩm
                        '@withReview' => true, // lấy thông tin đánh giá
                        '@withOption' => true // lấy các tùy chọn như màu sắc, kích cỡ, ...
                    ];
                @endphp
                
                <div id="product-tab-{{$tab->component->id}}" class="tabcontent">
                    @include($_template.'product-grid', [
                        'args' => $args,
                        'list_class' => 'no-gutters',
                        'column_class' => 'col-lg-6 col-12',
                        'item_style' => 2
                    ])
                </div>
                
            @endforeach
            
            @endif
        </div>
    </div>
</section>
<!-- Food Product Section Style 2 Ending here -->