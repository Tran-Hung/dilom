@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());

    // check_in_at & check_out_at default
    $checkInAt = \Carbon\Carbon::now()->addDays(1)->format(FORMAT_DATE);
    $checkOutAt = \Carbon\Carbon::now()->addDays(4)->format(FORMAT_DATE);
@endphp

@extends('voyager::master')

@section('page_title', __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
@stop

@section('content')
    <div class="page-content container-fluid">
        <form class="form-edit-add" role="form"
              action="@if(!is_null($dataTypeContent->getKey())){{ route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) }}@else{{ route('voyager.'.$dataType->slug.'.store') }}@endif"
              method="POST" enctype="multipart/form-data" autocomplete="off">

            <!-- PUT Method if we are editing -->
            @if(isset($dataTypeContent->id))
                {{ method_field("PUT") }}
            @endif
            {{ csrf_field() }}

            <div class="row">
                <div class="col-md-8">
                    <div class="panel panel-bordered">
                        {{-- <div class="panel"> --}}
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div class="panel-body">
                            <!-- ### NAME ### -->
                            <div class="form-group">
                                <label for="name">{{ __('voyager::generic.name') }}</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="{{ __('voyager::generic.name') }}"
                                       value="{{ old('name', $dataTypeContent->name ?? '') }}">
                            </div>

                            <!-- ### LIMIT USERS ### -->
                            <div class="form-group">
                                <label for="limit_user">{{ __('Limit Users') }}</label>
                                <input type="limit_user" class="form-control" id="limit_user" name="limit_user" placeholder="{{ __('Limit Users') }}"
                                       value="{{ old('email', $dataTypeContent->limit_user ?? '') }}">
                            </div>

                            <!-- ### PRICE ### -->
                            <div class="form-group">
                                <label for="price">{{ __('Price') }}</label>
                                <input type="text" class="form-control" id="price" name="price" placeholder="{{ __('Price') }}"
                                       value="{{ old('price', replace_char(',', '', $dataTypeContent->price) ?? '') }}">
                            </div>

                            <!-- ### LOCATION ### -->
                            <div class="form-group">
                                <label for="location">{{ __('Location') }}</label>
                                <select class="form-control select2" id="location" name="location">
                                    @foreach (\App\Models\Location::get() as $location)
                                        <option value="{{ $location->id }}"
                                            {{ ($dataTypeContent->location_id == $location->id ? 'selected' : '') }}>{{ $location->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- ### CONTENT ### -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Travel Content (Body)</h3>
                                    <div class="panel-actions">
                                        <a class="panel-action voyager-resize-full" data-toggle="panel-fullscreen" aria-hidden="true"></a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <textarea class="form-control richTextBox" name="body" id="richtextbody">
                                        {{ old('body', $dataTypeContent->travelContent->content ?? '') }}
                                    </textarea>
                                </div>
                            </div><!-- .panel -->
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <!-- ### IMAGE ### -->
                    <div class="panel panel panel-bordered panel-warning">
                        <div class="panel-body">
                            <div class="form-group">
                                @if(isset($dataTypeContent->image))
                                    <img src="{{
                                         filter_var($dataTypeContent->image, FILTER_VALIDATE_URL) ?
                                         $dataTypeContent->image :
                                         Voyager::image($dataTypeContent->image) }}"
                                         style="width:200px; height:auto; clear:both; display:block; padding:2px; border:1px solid #ddd; margin-bottom:10px;" />
                                @endif
                                <input type="file" data-name="image" name="image">
                            </div>
                        </div>
                    </div>

                    <!-- ### CHECK IN ### -->
                    <div class="form-group">
                        <label class="control-label" for="name"> Check In </label>
                        <input type="date"
                               class="form-control"
                               name="check_in_at"
                               placeholder="check_in_at"
                               value="{!! old('check_in_at', $checkInAt) !!}">
                    </div>

                    <!-- ### CHECK OUT ### -->
                    <div class="form-group">
                        <label class="control-label" for="name"> Check Out </label>
                        <input type="date"
                               class="form-control"
                               name="check_out_at"
                               placeholder="check_out_at"
                               value="{!! old('check_out_at', $checkOutAt)  !!}">
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary pull-right save">
                {{ __('voyager::generic.save') }}
            </button>
        </form>

        <iframe id="form_target" name="form_target" style="display:none"></iframe>
        <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post" enctype="multipart/form-data" style="width:0px;height:0;overflow:hidden">
            {{ csrf_field() }}
            <input name="image" id="upload_file" type="file" onchange="$('#my_form').submit();this.value='';">
            <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
        </form>
    </div>
@stop

@section('javascript')
    <script>
        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();
        });
    </script>
    <script>
        $(document).ready(function() {
            // Textarea Tinymce
            var additionalConfig = {
                selector: 'textarea.richTextBox[name="body"]',
            }
            $.extend(additionalConfig, "{}");
            tinymce.init(window.voyagerTinyMCE.getConfig(additionalConfig));
        });
    </script>
@stop

