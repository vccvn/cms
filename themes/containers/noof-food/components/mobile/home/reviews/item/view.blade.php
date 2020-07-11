<div class="item">
    <div class="review-block">
        <div class="reviewer-text">
            <ul class="list-unstyled list-inline star-rating">
                @for ($i = 0; $i < $data->rating; $i++)
                    <li class="list-inline-item"><span><i class="fa fa-star"></i></span></li>
                @endfor
            </ul>
            
            <blockquote> {{$data->comment}}
                <footer class="blockquote-footer">{{$data->review_name}}</footer>
            </blockquote>
        </div><!-- end reviewer-text -->

        <div class="reviewer-img">
            <img src="{{$data->avatar}}" alt="{{$data->review_name}}" class="rounded-circle">
        </div><!-- end reviewer-img -->
    </div><!-- end review-block -->
</div><!-- end item -->

