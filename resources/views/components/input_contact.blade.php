<div class="form-group col-md-6">
    <label class="d-block text-left" for="{!! $name !!}"> @lang($title) </label>
    <input type="text"
           class="form-control"
           id="$name"
           placeholder="{!! ucfirst($name) !!}"
           value="{!! $value !!}"
           autocomplete="true"
           disabled>
</div>
