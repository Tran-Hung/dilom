@foreach($travels as $travel)
    <article class="post-blog">
        <a class="post-blog-image" href="#">
            <img src="{!! asset(get_image_from_disk($travel->image, "images/landing-private-airlines-7-570x415.jpg")) !!}"
                 alt="" width="570" height="415"/>
        </a>
        <div class="post-blog-caption">
            <div class="post-blog-caption-header">
                <ul class="post-blog-tags">
                    <li>
                        <a class="button-tags" href="#">
                            {!! $travel->location->name !!}
                        </a>
                    </li>
                </ul>
                <ul class="post-blog-meta">
                    <li>
                        Limit {!! $travel->limit_user !!}
                    </li>
                </ul>
            </div>
            <div class="post-blog-caption-body">
                <h5><a class="post-blog-title" href="#"> {!! $travel->name !!} </a></h5>
            </div>
            <div class="post-blog-caption-footer">
                                        <span class="check_in">
                                            Check In: {!! $travel->check_in_at !!}
                                        </span>
                <span class="check_out text-right">
                                            Check Out: {!! $travel->check_out_at !!}
                                        </span>
            </div>
        </div>
    </article>
@endforeach
