@foreach($travels as $travel)
    <div class="col-md-6 col-xl-4">
        <article class="event-default-wrap">
            <div class="event-default">
                <figure class="event-default-image">
                    <img
                        src="{!! get_image_from_disk($travel->image) !!}"
                        alt=""
                        width="570"
                        height="370"/>
                </figure>
                <div class="event-default-caption">
                    <a class="button button-xs button-secondary button-nina" href="#"> Watch </a>
                </div>
                <div class="abs-top-left">
                    <div class="d-block d-block mb-1">
                        <span class="bg-1 ribbon py-1 px-4"> {!! $travel->range_days !!} </span>
                    </div>
                    <div class="d-block d-block mb-1">
                        <span class="bg-2 ribbon py-1 px-4"> {!! $travel->limit_user !!} persons </span>
                    </div>
                    <div class="d-block d-block mb-1">
                        <span class="bg-3 ribbon py-1 px-4"> {!! $travel->location->name !!} </span>
                    </div>
                </div>
            </div>
            <div class="event-default-inner">
                <h5>
                    <a class="event-default-title" href="#">
                        {!! $travel->name !!}
                    </a>
                </h5>
                <span class="heading-5">${!! $travel->price !!} </span>
            </div>
        </article>
    </div>
@endforeach
