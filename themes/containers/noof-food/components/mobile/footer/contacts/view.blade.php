@php
    $contacts = $options->theme->contacts;
    $address = $data->address?$data->address:($contacts->address?$contacts->address:$siteinfo->address);
    $email = $data->email?$data->email:($contacts->email?$contacts->email:$siteinfo->email);
    $phone_number = $data->phone_number?$data->phone_number:($contacts->phone_number?$contacts->phone_number:$siteinfo->phone_number);
@endphp
<ul class="footer-contact list-unstyled">
    <li><span><i class="fa fa-map-marker-alt"></i></span>{{$address}} </li>
    <li><span><i class="fa fa-envelope"></i></span><a href="mailto:{{$email}}">{{$email}}</a></li>
    <li><span><i class="fa fa-phone"></i></span><a href="tel:{{$phone_number}}">{{$phone_number}}</a></li>
</ul>