            <!--=============== FEATURED-PRODUCTS ===============-->
            <section id="featured-products" class="grey-featured-products section-padding">
                <div class="container-fluid text-center no-pad">
                    <h3 class="page-heading">{{$data->title}}</h3>
                    <hr class="page-heading-line" />
                    <div class="menu box-menu">
                        <ul class="list-unstyled">
                            @if ($data->list_type == 'data')
                                @if ($data->cate_number > 0 && count($categories = $helper->getProductCategories(['@sort' => $data->sort_type, '@limit' => $data->cate_number(6)])))
                                    @foreach ($categories as $cate)
            
                                        <li>
                                            <a href="{{$cate->getViewUrl()}}" class="dish-list-link">
                                                <div class="dish-list">
                                                    <div class="dish-list-tbl-cell">
                                                        <img src="{{$cate->getFeatureImage()}}" class="img-fluid" alt="{{$cate->name}}" />
                                                        <div class="dish-list-text">
                                                            <h4>{{$cate->name}}</h4>
                                                        </div><!-- end dish-list-text -->
                                                    </div><!-- end dish-list-tbl-cell -->
                                                </div><!-- end dish-list -->
                                            </a>
                                        </li>
                                        
                                    @endforeach
                                @endif
                            @else
                                <!--reviews -->
                                {!! $html->mobile_home_categories->components !!}
                            @endif
            
                        </ul>
                    </div><!-- end menu -->
                </div><!-- end container-fluid -->
            </section><!-- end featured-products -->
            
