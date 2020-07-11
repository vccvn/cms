@php
    $column = html('div', $widget = html('div'));
    foreach(['xs', 'sm', 'md', 'lg', 'xl'] as $size){
        if($col = $data->get('col_' . $size)){
            $column->addClass('col-' . ($size == 'xs' ? $col : $size . '-' . $col));
        }
    }
    
    $widget->addClass($data->class_name('opening-time'));

    $widget->append(html('h5', $data->title('Giờ làm việc')));
    $widget->append($menu = $helper->getCustomMenu($data->menu_id, 1, [],[
        'props' => [
            'menu_class' => '',
            'item_class' => '',
            'link_class' => '',
            'text_tag' => 'span'
        ]
    ]));
    $menu->addAction(function($item, $link){
        $link->tagName = null;
        $icon = $link->icon?$link->before('<p>')->after('>/p>'):null;

    });
    
@endphp

{!! $column !!}
                    {{--
                    <div class="col-xl-4 col-lg-4 col-md-6 col-12">
                        <div class="opening-time">
                            <h5>Opening Hours</h5>
                            <ul>
                                <li>
                                    <p><i class="far fa-clock"></i>Saterday</p>
                                    <span>06:00 am - 08:00 pm</span>
                                </li>
                                <li>
                                    <p><i class="far fa-clock"></i>Sunday</p>
                                    <span>09:00 am - 02:00 pm</span>
                                </li>
                                <li>
                                    <p><i class="far fa-clock"></i>Monday</p>
                                    <span>07:00 am - 09:00 pm</span>
                                </li>
                                <li>
                                    <p><i class="far fa-clock"></i>Tuesday</p>
                                    <span>02:00 am - 06:00 pm</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    --}}