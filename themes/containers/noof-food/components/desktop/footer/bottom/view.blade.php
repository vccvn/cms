@php

    $year = date('Y');
@endphp

        <!-- footer menu start -->
        <div class="fotter-header">
            <header>
                <div class="footer-bg">
                    <div class="container">
                        <div class="header-item">
                            <div class="header-logo">
                                @if ($data->copyright)
                                    <p>
                                        {!! $data->copyright !!}
                                    </p>
                                @else
                                    
                                @endif
                                <p>&copy; 2020 {{$year != 2020 ? '- ' .$year: ''}}<a href="{{route('home')}}">{{$siteinfo->site_name}}</a> Thiết kế bởi <a href="https://themeforest.net/user/labartisan">Labartisan</a></p>
                            </div>
                            <div class="header-menu d-none d-lg-block">
                                <nav class="primary-menu">
                                    <div class="main-menu-area">
                                        {!! 
                                            $helper->getCustomMenu($data->menu_id, 1, [],[
                                                'props' => [
                                                    'menu_class' => 'main-menu',
                                                    'item_class' => '',
                                                    'link_class' => ''
                                                ]
                                            ])
                                        !!}
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- <div class="footer-bottom"></div> -->
        </div>
        <!-- footer menu ends -->
