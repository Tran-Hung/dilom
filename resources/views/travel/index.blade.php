@extends('master')

@section('content')
    <!-- Slide -->
    <section class="section">
        <div class="swiper-form-wrap">
            <img src="{!! asset('images/source/bg1.jpg') !!}" alt="">

            <!-- Search -->
            <div class="container container-bigger form-request-wrap form-request-wrap-modern">
                <div class="row row-fix justify-content-sm-center justify-content-lg-end">
                    <div class="col-lg-6 col-xxl-5">
                        <div class="form-request form-request-modern bg-gray-lighter novi-background">
                            <h4> @lang('Find your Tour') </h4>
                            <!-- RD Mailform-->
                            <form id="frmSearch" class="form-fix" action="{!! route("search") !!}">
                                <div class="row row-20 row-fix">
                                    <div class="col-sm-12">
                                        <label class="form-label-outside">@lang('Tour Name') </label>
                                        <div class="form-wrap form-wrap-validation">
                                            <input class="form-input"
                                                   id="name"
                                                   name="name"
                                                   type="text"
                                                   value="{!! $name !!}">
                                            <label class="form-label" for="name">
                                                @lang("Tour Name")
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <label class="form-label-outside">@lang('Location') </label>
                                        <div class="form-wrap form-wrap-inline">
                                            <select class="form-input select-filter"
                                                    data-placeholder="All"
                                                    data-minimum-results-for-search="Infinity"
                                                    name="location">
                                                <option value="{!! ALL !!}"> @lang("All") </option>
                                                @foreach(\App\Models\Location::get() as $location)
                                                    <option
                                                        {!! ($location_id == $location->id)? 'selected': '' !!}
                                                        value="{!! $location->id !!}">
                                                        {!! $location->name !!}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-lg-6">
                                        <label class="form-label-outside"> @lang('Check In') </label>
                                        <div class="form-wrap form-wrap-validation">
                                            <!-- Select -->
                                            <input class="form-input"
                                                   id="dateForm"
                                                   name="check_in_at"
                                                   type="text"
                                                   value="{!! $check_in_at !!}"
                                                   data-time-picker="date">
                                            <label class="form-label" for="dateForm">
                                                @lang("Choose the date")
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-lg-6">
                                        <label class="form-label-outside"> @lang('Check Out') </label>
                                        <div class="form-wrap form-wrap-validation">
                                            <!-- Select -->
                                            <input class="form-input"
                                                   id="dateForm"
                                                   name="check_out_at"
                                                   type="text"
                                                   value="{!! $check_out_at !!}"
                                                   data-time-picker="date">
                                            <label class="form-label" for="dateForm">
                                                @lang("Choose the date")
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-wrap form-button">
                                    <button class="button button-block button-secondary"
                                            type="submit"> @lang("Search") </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END - Slide -->
    <section class="section section-variant-1 bg-default novi-background bg-cover">
        <div class="container container-wide">
            <div class="row row-fix justify-content-xl-end row-30 text-center text-xl-left">
                <div class="col-xl-8">
                    <div class="parallax-text-wrap">
                        <h3> @lang("All tours") </h3><span class="parallax-text"> @lang("All tours") </span>
                    </div> 
                </div>
                <div class="col-xl-3 text-xl-right"></div>
            </div>
        </div>
    </section>
    <!-- Northern Tours (Tours by area) -->
    <section class="section section-lg novi-background bg-cover bg-default text-center">
        <div class="container-wide">
            <div class="row row-50">
                <div class="col-sm-12">
                    <h3> @lang("Northern Tours") </h3>
                    <div class="divider divider-decorate"></div>
                    <!-- Owl Carousel-->
                    <div class="owl-carousel owl-carousel-team owl-carousel-inset"
                         data-items="1"
                         data-md-items="2"
                         data-xl-items="3"
                         data-stage-padding="15"
                         data-margin="30"
                         data-mouse-drag="false"
                         data-dots="true"
                         data-loop="false"
                         data-autoplay="true">index
                        @foreach($northernTravels as $travel)
                            <article class="post-blog"><a class="post-blog-image" href="{!! route("travels.show", ["id" => $travel->id]) !!}">
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
                                        <h5><a class="post-blog-title" href="{!! route("travels.show", ["id" => $travel->id]) !!}"> {!! $travel->name !!} </a></h5>
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END - Northern Tours (Tours by area) -->

    <!-- Central Tours (Tours by area) -->
    <section class="section section-lg novi-background bg-cover bg-default text-center">
        <div class="container-wide">
            <div class="row row-50">
                <div class="col-sm-12">
                    <h3> @lang("Central Tours") </h3>
                    <div class="divider divider-decorate"></div>
                    <!-- Owl Carousel-->
                    <div class="owl-carousel owl-carousel-team owl-carousel-inset"
                         data-items="1"
                         data-md-items="2"
                         data-xl-items="3"
                         data-stage-padding="15"
                         data-margin="30"
                         data-mouse-drag="false"
                         data-dots="true"
                         data-loop="false"
                         data-autoplay="true">index
                        @foreach($centralTravels as $travel)
                            <article class="post-blog"><a class="post-blog-image" href="{!! route("travels.show", ["id" => $travel->id]) !!}">
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
                                        <h5><a class="post-blog-title" href="{!! route("travels.show", ["id" => $travel->id]) !!}"> {!! $travel->name !!} </a></h5>
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END - Central Tours (Tours by area) -->

    <!-- South tours (Tours by area) -->
    <section class="section section-lg novi-background bg-cover bg-default text-center">
        <div class="container-wide">
            <div class="row row-50">
                <div class="col-sm-12">
                    <h3> @lang("South Tours") </h3>
                    <div class="divider divider-decorate"></div>
                    <!-- Owl Carousel-->
                    <div class="owl-carousel owl-carousel-team owl-carousel-inset"
                         data-items="1"
                         data-md-items="2"
                         data-xl-items="3"
                         data-stage-padding="15"
                         data-margin="30"
                         data-mouse-drag="false"
                         data-dots="true"
                         data-loop="false"
                         data-autoplay="true">index
                        @foreach($southTravels as $travel)
                            <article class="post-blog"><a class="post-blog-image" href="{!! route("travels.show", ["id" => $travel->id]) !!}">
                                    <img src="{!! asset(get_image_from_disk($travel->image, "images/landing-private-airlines-7-570x415.jpg")) !!}"
                                         alt="" width="570" height="370"/>
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
                                        <h5><a class="post-blog-title" href="{!! route("travels.show", ["id" => $travel->id]) !!}"> {!! $travel->name !!} </a></h5>
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
                    </div>
                </div>
            </div>
        </div>

        {!! $travels->appends($_GET)->links() !!}
    </section>
    <!-- END - Hot tours -->
@stop

@section("scripts")

@stop
