<div class="swiper-slide">
    <div class="clients-item text-center">
        <div class="clients-thumb">
            <img src="{{$data->avatar}}" alt="{{$data->name}}">
        </div>
        <div class="clients-text">
            <p>
                <span><i class="fas fa-quote-left"></i></span>
                {{$data->comment}}
                <span><i class="fas fa-quote-right"></i></span>
            </p>
            <div class="rating">
                @for ($i = 0; $i < $data->rating; $i++)
                    <span><i class="fa fa-star"></i></span>
                @endfor
            </div>
            <h6>{{$data->name}}</h6>
            <span>{{$data->job}}</span>
        </div>
    </div>
</div>