
            <!-- Booking Table Section Start Here -->
            <section class="booking-table bg_size p-rel padding-tb" style="background-image: url({{$data->background(desktop_asset('css/bg-image/contact-bg.jpg'))}});">
                <div class="overlay"></div>
                <div class="container">
                    <div class="section-header">
                        <img src="{{$data->icon(desktop_asset('images/header/sc-img.png'))}}" alt="sc-img" class="header-img">
                        <span>{{$data->sub_title}}</span>
                        <h2>{{$data->title}}</h2>
                    </div>
                    <div class="section-wrapper">
                        <div class="row justify-content-center align-items-center">
                            <div class="col-lg-6 col-12">
                                <div class="bg-table" @if ($data->image) style="background-image: url({{$data->image}})" @endif></div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="contact-form">
                                    <form method="POST" action="{{route('client.contacts.send')}}" data-ajax-url="{{route('client.contacts.ajax-send')}}" class="{{parse_classname('contact-form1')}}">
                                        @csrf
                                        <input id="name" name="name" type="text" class="w-100p" required="" placeholder="Họ và tên">
                                        <input id="email1" name="email" type="email" required="" placeholder="Địa chỉ e-mail">
                                        <input id="phone" name="phone_number" type="tel" class="form-control" placeholder="Số điện thoại">
                                        <textarea id="message1" name="message" rows="4" placeholder="Nội dung"></textarea>
                                        <button type="submit" class="food-btn style-2"><span>{{$data->button_text('Send message')}}</span></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Booking Table Section Ending Here -->
    