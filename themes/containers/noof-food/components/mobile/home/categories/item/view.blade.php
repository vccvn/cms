@php
    $name = null;
    $image = null;
    $link = null;
    if($data->category_id && $category = $helper->getProductCategory(['id' => $data->category_id])){
        $image = $category->getFeatureImage();
        $name = $category->name;
        $link = $category->getViewUrl();
    }
    if($data->name) $name = $data->name;
    if($data->image) $image = $data->image;
    if($data->link) $link = $data->link;
@endphp
@if ($link && $name)
    
<li>
    <a href="{{$link}}" class="dish-list-link">
        <div class="dish-list">
            <div class="dish-list-tbl-cell">
                <img src="{{$image?$image:mobile_desktop('images/fast-food-1.png')}}" class="img-fluid" alt="{{$name}}" />
                <div class="dish-list-text">
                    <h4>{{$name}}</h4>
                </div><!-- end dish-list-text -->
            </div><!-- end dish-list-tbl-cell -->
        </div><!-- end dish-list -->
    </a>
</li>

@endif