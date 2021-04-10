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

                    <form method="POST" action="{{ route('travels.store') }}">
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
                                "value" => Auth::user()->informUser->phone,
                            ])
                            @include("components.input_contact", [
                                "title" => "Address",
                                "name" => "address",
                                "value" => Auth::user()->informUser->address,
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
                                <label class="d-block text-left" for="exampleFormControlSelect1">Example select</label>
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
                        <button type="submit" class="btn btn-primary"> @lang("Submit") </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- END - Information -->
@stop
@section('scripts')
    <script !src="">
        var price = {!! $travel->price !!};
        var limit_user = {!! $travel->limit_user !!};
    </script>
    <script src="{!! asset('js/pages/booking.js') !!}"></script>
@stop
