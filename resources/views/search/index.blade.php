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
                                            <select class="form-input select-filter2"
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

    <!-- Search tours -->
    <section class="section section-variant-1 bg-default novi-background bg-cover">
        <div class="container container-wide">
            <div class="row row-fix justify-content-xl-end row-30 text-center text-xl-left">
                <div class="col-xl-8">
                    <div class="parallax-text-wrap">
                        <h3> @lang("Search tours") </h3><span class="parallax-text"> @lang("Search tours") </span>
                    </div>
                    <hr class="divider divider-decorate">
                </div>
                <div class="col-xl-3 text-xl-right"></div>
            </div>
            <div class="row row-50">
                @include("components.list_travels", [
                    "travels" => $travels,
                ])
            </div>
        </div>

        {!! $travels->appends($_GET)->links() !!}
    </section>
    <!-- END - Hot tours -->
@stop

@section("scripts")

@stop
