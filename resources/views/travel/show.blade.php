@extends('master')

@section('content')
    @include('components.travel_show', [
        "travel" => $travel
    ])

    <!-- Travel content -->
    <div class="container container-bigger mb-5">
        <h4 class="d-block"> @lang('Description') </h4>
        <div class="content">
            {!! $travel->travelContent->content !!}
        </div>
    </div>

    <!-- Related tours -->
    <section class="section section-lg novi-background bg-cover bg-default text-center">
        <div class="container-wide">
            <div class="row row-50">
                <div class="col-sm-12">
                    <h3> @lang("Related Tours") </h3>
                    <div class="divider divider-decorate"></div>
                    <!-- Owl Carousel-->
                    <div class="owl-carousel owl-carousel-team owl-carousel-inset"
                         data-items="1"
                         data-md-items="2"
                         data-xl-items="3"
                         data-stage-padding="15"
                         data-loop="false"
                         data-margin="30"
                         data-mouse-drag="false"
                         data-dots="true"
                         data-autoplay="true">
                            @include("components.list_slide_travels", [
                                "travels" => $relatedTravels,
                            ])
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END - Related tours -->

    <!-- Recommend tours -->
    <section class="section section-lg novi-background bg-cover bg-default text-center">
        <div class="container-wide">
            <div class="row row-50">
                <div class="col-sm-12">
                    <h3> @lang("Recommend Tours") </h3>
                    <div class="divider divider-decorate"></div>
                    <!-- Owl Carousel-->
                    <div class="owl-carousel owl-carousel-team owl-carousel-inset"
                         data-items="1"
                         data-md-items="2"
                         data-xl-items="3"
                         data-stage-padding="15"
                         data-loop="false"
                         data-margin="30"
                         data-mouse-drag="false"
                         data-dots="true"
                         data-autoplay="true">
                        @include("components.list_slide_travels", [
                            "travels" => $recommendTravels,
                        ])
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END - Recommend tours -->
@stop
@section("scripts")
    <script !src="">
        $("#btnBookNow").on("click", function (e) {
            e.preventDefault();

            window.location.href = '/travels/booking/' + {!! $travel->id !!}
        });
    </script>
@stop
