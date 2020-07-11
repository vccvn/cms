
            
            <!--=============== NEWSLETTER ===============-->
            <section id="newsletter" class="section-padding"> 
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                            <h3>{{$data->title('Đăng ký nhận thông báo')}}</h3>
                            <p>{{$data->description}}</p>	
                            <form method="post" action="{{route('client.subcribe')}}" class="{{parse_classname('subcribe-form')}}">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="email" class="form-control" placeholder="Nhập địa chỉ email" required/>
                                        <div class="input-group-append"><button class="btn"><i class="fa fa-envelope"></i></button></div>
                                    </div>
                                </div>
                            </form>
                        </div><!-- end columns -->
                    </div><!-- end row -->
                </div><!-- end container-fluid -->
            </section><!-- end newsletter -->
        
        