@extends('master')

@section('content')
    <!-- Page Header-->
    <header class="section page-header breadcrumbs-custom-wrap bg-gradient bg-secondary-2 novi-background bg-cover">
        <!-- Breadcrumbs-->
        <section class="breadcrumbs-custom"
                 style="background: url({!! asset('images/source/bg2.jpg') !!});
                     background-size: cover;">
            <div class="container">
                <p class="breadcrumbs-custom-subtitle mb-3"> @lang("Order detail") </p>
                <p class="heading-1 breadcrumbs-custom-title"> @lang("Order") #{!! $order->id !!} </p>
                <p>
                    @lang("Location"): {!! $order->travel->location->name !!}
                </p>
            </div>
            <div class="mb-5"></div>
        </section>
    </header>

    <!-- Inform Order -->
    <section class="section section-lg novi-background bg-cover bg-default pt-4">
        <div class="container">
            <div class="row row-50">
                <!-- Message -->
                @if (Session::has('alert-success'))
                   <div class="col-sm-12">
                       <div class="alert alert-success"> <strong>@lang('Congratulation')</strong>, {{ Session::get('alert-success') }} </div>
                   </div>
                @endif

                <div class="col-sm-6 mb-3">
                    @include("components.item_order_show", [
                        "title" => "Name",
                        "value" => $order->informOrder->name
                    ])

                    @include("components.item_order_show", [
                        "title" => "Phone",
                        "value" => $order->informOrder->phone
                    ])
                </div>
                <div class="col-sm-6 mb-3">
                    @include("components.item_order_show", [
                        "title" => "Email",
                        "value" => $order->informOrder->email
                    ])

                    @include("components.item_order_show", [
                        "title" => "Address",
                        "value" => $order->informOrder->address
                    ])
                </div>
                <div class="col-sm-12">
                    <h6> @lang("Note") </h6>
                    <p class="mt-0">
                        {!! $order->informOrder->note ?? "<i>". __('There is no note for this order') ."</i>" !!}
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Tour inform -->
    <section class="section section-lg novi-background bg-cover bg-default pt-4">
        <div class="container">
            <div class="row row-50">
                <div class="col-sm-12">
                    <h4 class="mb-4"> @lang('Tour information') </h4>
                    <table class="table table-striped">
                        <thead></thead>
                        <tbody>
                        <tr>
                            <th scope="row"> @lang("Tour name") </th>
                            <td> {!! $order->travel->name !!}</td>
                        </tr>
                        <tr>
                            <th scope="row"> @lang("Location") </th>
                            <td> {!! $order->travel->location->name !!}</td>
                        </tr>
                        <tr>
                            <th scope="row"> @lang("Time") </th>
                            <td> {!! $order->travel->range_format !!} </td>
                        <tr>
                            <th scope="row"> @lang("Price") </th>
                            <td> {!! $order->price !!} </td>
                        </tr>
                        <tr>
                            <th scope="row"> @lang("Quality") </th>
                            <td> {!! $order->quality !!} </td>
                        </tr>
                        <tr>
                            <th scope="row"> @lang("Amount") </th>
                            <td> {!! $order->amount !!} </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
@stop
