            
            <!--=============== ABOUT-US ===============-->
            <section id="about-us" class="section-padding">
                <div class="container-fluid text-center">
                    <h3 class="page-heading">{{$data->title('Giới thiệu')}}</h3>
                    <hr class="page-heading-line" />
                    @if ($data->image)
                        <img src="{{$data->image}}" class="img-fluid" alt="{{$siteinfo->site_name}}">
                    @endif
                    <p>{{$data->description}}</p>
                </div><!-- end container-fluid -->
            </section><!-- end about-us -->
            
            