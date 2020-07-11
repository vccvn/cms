@php
    $general = $options->theme->general->makeByPrefix('mobile_');
    if($data->custom){
        $logo_type = $data->logo_type;
        $logo = $logo_type == 'image'?(
            $data->logo?$data->logo:($siteinfo->mobile_logo?$siteinfo->mobile_logo:$siteinfo->logo)
        ): null;
        $logo_icon = $data->logo_icon;
        $logo_text = $data->logo_text($general->logo_text($siteinfo->site_name));
    }else{
        $logo_type = $general->logo_type;
        $logo = $logo_type == 'image'?(
            $general->logo?$general->logo:($siteinfo->mobile_logo?$siteinfo->mobile_logo:$siteinfo->logo)
        ): null;
        $logo_icon = $general->logo_icon;
        $logo_text = $general->logo_text($siteinfo->site_name);
    }
@endphp
@if ($logo_type == 'image' && $logo)
    <img src="{{$logo}}" alt="{{$siteinfo->site_name}}">
@else
    <h3>
        @if ($logo_icon)
        <span><i class="{{$logo_icon}}"></i></span>
        @endif
        {!!$logo_text!!}
    </h3>
@endif