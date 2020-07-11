
            
            <!--==================== BANNER-2 ====================-->
            <section id="banner-2" style="background:url('{{$data->background?$data->background:mobile_asset('images/banner-2-fast-food.jpg')}}'); background-size:cover;"> 
                <div class="container-fluid section-padding overlay">
                    <p>{{$data->sub_title}}</p>
                    <h2>{{$data->title}}</h2>
                    <p>{{$data->description}}</p>
                    <a href="{{$data->link('#')}}" class="btn btn-black">{{$data->button_text('Chi tiết')}}</a>
                </div><!-- end container -->
            </section><!-- end banner-2 -->
        	