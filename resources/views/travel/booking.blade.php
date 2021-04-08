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

                    <form>
                        <div class="form-row">
                            @include("components.input_contact", [
                                "title" => "Name",
                                "name" => "name",
                                "value" => Auth::user()->name,
                            ])
                            @include("components.input_contact", [
                                "title" => "Email",
                                "name" => "email",
                                "value" => Auth::user()->email,
                            ])
                            @include("components.input_contact", [
                                "title" => "Phone",
                                "name" => "phone",
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
                                <label class="d-block text-left" for="exampleFormControlTextarea1"> @lang("Note") </label>
                                <textarea class="form-control"
                                          id="exampleFormControlTextarea1"
                                          placeholder="@lang("Your note")..."
                                          rows="3"></textarea>
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
