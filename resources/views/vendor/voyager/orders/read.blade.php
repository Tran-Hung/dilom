@extends('voyager::master')

@section('page_title', __('voyager::generic.view').' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ __('voyager::generic.viewing') }} {{ ucfirst($dataType->getTranslatedAttribute('display_name_singular')) }} &nbsp;

        @can('browse', $dataTypeContent)
            <a href="{{ route('voyager.'.$dataType->slug.'.index') }}" class="btn btn-warning">
                <span class="glyphicon glyphicon-list"></span>&nbsp;
                {{ __('voyager::generic.return_to_list') }}
            </a>
        @endcan
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-6">
                @include("components.item_voyager_order", [
                    "title" => "Name",
                    "value" => $dataTypeContent->informOrder->name
                ])
                @include("components.item_voyager_order", [
                    "title" => "Phone",
                    "value" => $dataTypeContent->informOrder->phone
                ])
                @include("components.item_voyager_order", [
                    "title" => "Note",
                    "value" => $dataTypeContent->informOrder->note
                ])
            </div>
            <div class="col-md-6">
                @include("components.item_voyager_order", [
                    "title" => "Email",
                    "value" => $dataTypeContent->informOrder->email
                ])
                @include("components.item_voyager_order", [
                    "title" => "Address",
                    "value" => $dataTypeContent->informOrder->address
                ])
            </div>
            <div class="col-md-12 pl-5">
                <div class="panel-heading" style="border-bottom:0;">
                    <h3 class="panel-title"> Tour Information </h3>
                </div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead></thead>
                        <tbody>
                        <tr>
                            <th scope="row"> Tour name </th>
                            <td> {!! $dataTypeContent->travel->name !!}</td>
                        </tr>
                        <tr>
                            <th scope="row"> Location </th>
                            <td> {!! $dataTypeContent->travel->location->name !!}</td>
                        </tr>
                        <tr>
                            <th scope="row"> Time </th>
                            <td> {!! $dataTypeContent->travel->range_format !!} </td>
                        <tr>
                            <th scope="row"> Price </th>
                            <td> {!! $dataTypeContent->price !!} </td>
                        </tr>
                        <tr>
                            <th scope="row"> Quality </th>
                            <td> {!! $dataTypeContent->quality !!} </td>
                        </tr>
                        <tr>
                            <th scope="row"> Amount </th>
                            <td> {!! $dataTypeContent->amount !!} </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

@stop

