
@if ($data->worktimes && $worktimes = nf_text_to_array($data->worktimes))
    
            <!--======= BANNER-1 ========-->
            <section id="banner-1">
                <div class="container-fluid  text-center overlay section-padding">
                    <ul class="list-unstyled">
                        @foreach ($worktimes as $days => $times)
                        <li><span><i class="far fa-clock"></i>{{$days}} :</span> {{$times}}</li>
                        @endforeach
                    </ul>
                </div><!-- end container-fluid -->
            </section><!-- end banner-1 -->
            
@endif