@extends('master')

@section('content')
    <!-- Page Header-->
    <header class="section page-header breadcrumbs-custom-wrap bg-gradient bg-secondary-2 novi-background bg-cover">
        <!-- Breadcrumbs-->
        <section class="breadcrumbs-custom"
                 style="background: url({!! asset('images/source/bg2.jpg') !!});
                     background-size: cover;">
            <div class="container">
                <p class="breadcrumbs-custom-subtitle mb-3"> @lang("Check your order history here") </p>
                <p class="heading-1 breadcrumbs-custom-title"> @lang("Order History") </p>
                <ul class="breadcrumbs-custom-path">
                    @if(isset(Auth::user()->orders))
                        <li> @lang("Last tour") </li>
                        <li> #{!! Auth::user()->orders->first()->id !!} </li>
                        <li> {!! Auth::user()->orders->first()->travel->location->name !!} </li>
                        <li> {!! Auth::user()->orders->first()->created_at !!} </li>
                    @endif
                </ul>
            </div>
            <div class="mb-5"></div>
        </section>
    </header>

    <section class="section section-lg novi-background bg-cover bg-default">
        <div class="container">
            <div class="row row-50">
                <div class="col-sm-12">
                    <table id="table_orders" class="display" style="width:100%">
                        <thead>
                        <tr>
                            <th> @lang("ID") </th>
                            <th> @lang("Tour") </th>
                            <th> @lang("Quality") </th>
                            <th> ($) @lang("Price") </th>
                            <th> @lang("Amount") </th>
                            <th> @lang("Order time") </th>
                            <th> @lang("Action") </th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
@stop

@section("scripts")
    <script>
        let url = {
            data: "{!! route('orders.data') !!}"
        };

        let trans = {
            delete: "@lang("Delete")",
            show: "@lang("Show")"
        };
    </script>
    <script src="{!! asset("js/pages/order_index.js") !!}"></script>
@stop
