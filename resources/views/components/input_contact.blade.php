<div class="form-group {!! $col ?? 'col-md-6' !!} {!! isset($require) && $require? 'required': '' !!}">
    <label class="d-block text-left control-label" for="{!! $name !!}"> @lang($title) </label>
    <input type="text"
           class="form-control"
           id="{!! $name !!}"
           name="{!! $name !!}"
           placeholder="{!! ucfirst($name) !!}"
           value="{!! old($name, $value ?? '')!!}"
           autocomplete="true"
           {!! $disabled ?? '' !!}>

    @if($errors->has($name))
        <div class="invalid-feedback text-left d-block">
            {{ $errors->first($name) }}
        </div>
    @endif
</div>
