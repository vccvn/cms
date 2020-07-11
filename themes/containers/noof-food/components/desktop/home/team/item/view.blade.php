@php
    $list = ['facebook', 'twitter', 'instagram', 'youtube', 'linkedin'];
@endphp
<div class="col-xl-4 col-md-6 col-12">
    <div class="team-item style-2">
        <div class="team-item-inner">
            <div class="team-thumb">
                <div class="t-thumb">
                    <img src="{{$data->avatar}}" alt="{{$data->name}}">
                </div>
                <div class="self-intregration">
                    <div class="intregration-head">
                        <span>Follow Me</span>
                    </div>
                    <div class="intregration-icon">
                        <ul>
                            @foreach ($list as $item)
                                @if ($link = $data->get($item))
                                    <li><a class="{{$item}}" href="{{$link}}" target="_blank"><i class="fab fa-{{$item}}"></i></a></li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
            <div class="team-content">
                <a href="homechef-single.html"><h5 class="member-name">{{$data->name}}</h5></a>
                <span class="member-dagi">{{$data->job}}</span>
                <p class="member-details">{{$data->description}}</p>
                <ul class="icon-style-list codex">
                    <li><i class="icofont-phone"></i><span>{{$data->phone_number}}</span></li>
                    <li><i class="icofont-envelope"></i><span>{{$data->email}}</span></li>
                    <li>
                        <i class="fas fa-share-alt-square"></i>
                        <ul class="d-flex flex-wrap justify-content-start codex">
                            @foreach ($list as $item)
                                @if ($link = $data->get($item))
                                    <li><a class="{{$item}}" href="{{$link}}" target="_blank"><i class="fab fa-{{$item}}"></i></a></li>
                                @endif
                            @endforeach
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>