@extends('master')

@section('content')
    @include('components.travel_show', [
        "travel" => $travel
    ])

    <!-- Information -->
    <section class="section section-lg novi-background bg-cover bg-default text-center">
        <div class="container container-bigger">
            <div class="row row-50">
                <div class="col-sm-12">
                    <h3> @lang("Contact Information") </h3>
                    <div class="divider divider-decorate"></div>

                    <form id="frmSubmit" method="POST" action="{{ route('travels.store') }}">
                        @csrf
                        <input type="hidden" name="travel_id" value="{!! $travel->id !!}">
                        <input type="hidden" name="price" value="{!! $travel->price !!}">
                        <div class="form-row">
                            @include("components.input_contact", [
                                "title" => "Name",
                                "name" => "name",
                                "require" => true,
                                "value" => Auth::user()->name,
                            ])
                            @include("components.input_contact", [
                                "title" => "Email",
                                "name" => "email",
                                "require" => true,
                                "value" => Auth::user()->email,
                            ])
                            @include("components.input_contact", [
                                "title" => "Phone",
                                "name" => "phone",
                                "require" => true,
                                "value" => Auth::user()->informUser->phone ?? null,
                            ])
                            @include("components.input_contact", [
                                "title" => "Address",
                                "name" => "address",
                                "value" => Auth::user()->informUser->address ?? null,
                            ])
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label class="d-block text-left"
                                       for="exampleFormControlTextarea1"> @lang("Note") </label>
                                <textarea class="form-control"
                                          id="exampleFormControlTextarea1"
                                          name="note"
                                          placeholder="@lang("Your note")..."
                                          rows="3">{!! old('note', '') !!}</textarea>
                            </div>
                        </div>
                        <div class="form-row">
                            @include("components.input_contact", [
                                "title" => "Quality",
                                "name" => "quality",
                                "require" => true,
                                "value" => old('quality', 0),
                                "col" => "col-md-8",
                            ])

                            @include("components.input_contact", [
                               "title" => "Amount",
                               "name" => "amount",
                               "disabled" => "disabled",
                               "value" => 0,
                               "col" => "col-md-4",
                           ])
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label class="d-block text-left" for="exampleFormControlSelect1"> @lang("Payment method") </label>
                                <select style="height: auto !important;"
                                        class="form-control"
                                        id="exampleFormControlSelect1"
                                        name="payment_method">
                                    @foreach(PAYMENT_METHOD_TRANSLATE as $key => $payment)
                                        <option value="{!! $key !!}"> {!! $payment !!} </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <button id="btnCheckout" class="btn btn-primary"> @lang("Checkout") </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- END - Information -->

    <!-- Large modal (Check out) -->
    <div
         id="modalCheckout"
         class="modal fade bd-example-modal-lg"
         tabindex="-1" role="dialog"
         aria-labelledby="myLargeModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header d-block">
                    <h4 class="modal-title text-center"> @lang("Check out") </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        @include('components.item_checkout_order_show', [
                            "title" => "Name",
                            "name" => "name"
                        ])
                        @include('components.item_checkout_order_show', [
                            "title" => "Email",
                            "name" => "email"
                        ])
                        @include('components.item_checkout_order_show', [
                            "title" => "Phone",
                            "name" => "phone"
                        ])
                        @include('components.item_checkout_order_show', [
                            "title" => "Address",
                            "name" => "name"
                        ])

                        <div class="col-md-12">
                            <div class="modal-item mb-2">
                                <h6> @lang("Payment method") </h6>
                                <p class="m-0 p-payment_method"></p>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="modal-item mb-2">
                                <h6> @lang("Note") </h6>
                                <p class="m-0 p-note"></p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <h6 class="mb-4"> @lang("Tour information") </h6>
                            <table class="table table-striped">
                                <thead></thead>
                                <tbody>
                                <tr>
                                    <th scope="row"> @lang("Tour name") </th>
                                    <td> {!! $travel->name !!}</td>
                                </tr>
                                <tr>
                                    <th scope="row"> @lang("Location") </th>
                                    <td> {!! $travel->location->name !!}</td>
                                </tr>
                                <tr>
                                    <th scope="row"> @lang("Time") </th>
                                    <td> {!! $travel->range_format !!} </td>
                                <tr>
                                    <th scope="row"> @lang("Price") </th>
                                    <td> {!! $travel->price !!} </td>
                                </tr>
                                <tr>
                                    <th scope="row"> @lang("Quality") </th>
                                    <td><p class="p-quality"></p></td>
                                </tr>
                                <tr>
                                    <th scope="row"> @lang("Amount") </th>
                                    <td><p class="p-amount"></p></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btnSubmit" type="button" class="btn btn-primary"> @lang("Submit") </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"> @lang("Close") </button>
                </div>
            </div>
        </div>
    </div>
@stop
@section('scripts')
    <script !src="">
        var price = {!! $travel->price !!};
        var limit_user = {!! $travel->limit_user !!};
    </script>
    <script src="{!! asset('js/pages/booking.js') !!}"></script>
@stop
