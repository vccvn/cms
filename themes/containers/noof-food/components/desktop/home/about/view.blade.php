
            <!-- About Section Start here -->
            <section class="about padding-tb">
                <div class="container">
                    <div class="row align-items-center flex-row-reverse">
                        <div class="col-lg-6 col-12">
                            <div class="about-thumb">
                                <img src="{{$data->image(desktop_asset('images/about/01.png'))}}" alt="about-food">
                            </div>
                        </div>
                        <div class="col-lg-6 col-12">
                            <div class="about-content">
                                <div class="section-header">
                                    <span>{{$data->sub_title}}</span>
                                    <h3>{{$data->title}}</h3>
                                </div>
                                <div class="section-wrapper">
                                    <p>
                                        {!! nl2br($data->description) !!}
                                    </p>
                                    <a href="{{$data->button_link}}" class="food-btn style-2"><span>{{$data->button_text}}</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About Section Ending here -->