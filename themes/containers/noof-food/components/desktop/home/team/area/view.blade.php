@php
    $list = ['facebook', 'twitter', 'instagram', 'youtube', 'linkedin'];
@endphp
<!-- Team Member Section Start here -->
<div class="team-section style-2 padding-tb {{$data->background?'bg-image':''}}" @if($data->background) style="backgroubd-image: url({{$data->background}});" @endif>
    <div class="container">
        <div class="section-header">
            <img src="{{$data->icon(desktop_asset('images/header/sc-img.png'))}}" alt="sc-img" class="header-img">
            <span>{{$data->sub_title}}</span>
            <h2>{{$data->title}}</h2>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="team-bottom">
                    <div class="team-bottom-area">
                        <div class="row justify-content-center align-items-center">
                            @if ($data->list_type == 'data')
                                @if ($data->item_number > 0 && count($members = $helper->getTeamMembers(['team_id' => $data->team_id, '@sort' => $data->sort_type, '@limit' => $data->item_number])))
                                    @foreach ($members as $member)
                                    <div class="col-xl-4 col-md-6 col-12">
                                        <div class="team-item style-2">
                                            <div class="team-item-inner">
                                                <div class="team-thumb">
                                                    <div class="t-thumb">
                                                        <img src="{{$member->avatar}}" alt="{{$member->name}}">
                                                    </div>
                                                    <div class="self-intregration">
                                                        <div class="intregration-head">
                                                            <span>Follow Me</span>
                                                        </div>
                                                        <div class="intregration-icon">
                                                            <ul>
                                                                @foreach ($list as $item)
                                                                    @if ($link = $member->get($item))
                                                                        <li><a class="{{$item}}" href="{{$link}}" target="_blank"><i class="fab fa-{{$item}}"></i></a></li>
                                                                    @endif
                                                                @endforeach
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="team-content">
                                                    <a href="homechef-single.html"><h5 class="member-name">{{$member->name}}</h5></a>
                                                    <span class="member-dagi">{{$member->job}}</span>
                                                    <p class="member-details">{{$member->description}}</p>
                                                    <ul class="icon-style-list codex">
                                                        <li><i class="icofont-phone"></i><span>{{$member->phone_number}}</span></li>
                                                        <li><i class="icofont-envelope"></i><span>{{$member->email}}</span></li>
                                                        <li>
                                                            <i class="fas fa-share-alt-square"></i>
                                                            <ul class="d-flex flex-wrap justify-content-start codex">
                                                                @foreach ($list as $item)
                                                                    @if ($link = $member->{$item})
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


                                    @endforeach
                                @endif
                            @else
                                {!! $html->desktop_team_members->components !!}
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Team Member Section Ending here -->
