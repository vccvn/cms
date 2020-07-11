@php
    $column = html('div', $widget = html('div'));
    foreach(['xs', 'sm', 'md', 'lg', 'xl'] as $size){
        if($col = $data->get('col_' . $size)){
            $column->addClass('col-' . ($size == 'xs' ? $col : $size . '-' . $col));
        }
    }
    if($data->class_name){
        $widget->addClass($data->class_name);
    }
    $widget->append(html('h5', $data->title('Liên kết')));
    $widget->append($menu = $helper->getCustomMenu($data->menu_id, 1, ['class' => 'info'],[
        'props' => [
            'menu_class' => '',
            'item_class' => '',
            'link_class' => '',
            'text_tag' => 'span'
        ]
    ]));
    $menu->addAction(function($item, $link){
        $link->tagName = null;
    });
    
@endphp

{!! $column !!}
                    {{--
                    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
                        <div class="contant-info">
                            <h5>Contact info</h5>
                            <ul class="info">
                                <li>
                                    <i class="fas fa-home"></i>
                                    <span>Suite 02 Level Tropical Center</span>
                                </li>
                                <li>
                                    <i class="fas fa-phone"></i>
                                    <span>+880 1234 567890, 025984712</span>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fas fa-globe-asia"></i>
                                        <span>www.foodbuzz@gmail,com</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fas fa-headphones"></i>
                                        <span>support@codexcoder.com</span>
                                    </a>
                                </li>
    
                            </ul>
                        </div>
                    </div>
                    --}}