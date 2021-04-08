<!-- Page Header-->
<header class="section page-header breadcrumbs-custom-wrap bg-gradient bg-secondary-2 novi-background bg-cover">
    <!-- Breadcrumbs-->
    <section class="breadcrumbs-custom" style="background: url({!! asset('images/source/bg2.jpg') !!}); background-size: cover;">
        <div class="container">
            <p class="breadcrumbs-custom-subtitle mb-3"> {!! $travel->name !!} </p>
            <p class="heading-1 breadcrumbs-custom-title"> {!! $travel->location->name !!} </p>
            <ul class="breadcrumbs-custom-path">
                <li> {!! $travel->range_format !!} </li>
            </ul>
        </div>
        <div class="mb-5"></div>
    </section>
</header>

<!-- Travel table -->
<section class="section section-lg bg-default">
    <div class="container container-bigger">
        <div class="row row-50 justify-content-md-center align-items-lg-center justify-content-xl-between flex-lg-row-reverse">
            <div class="col-md-10 col-lg-6 col-xl-5">
                <h3> {!! $travel->name !!} </h3>
                <div class="divider divider-decorate"></div>

                <!-- Table Inform -->
                <table class="table table-striped table-bordered mt-3">
                    <thead></thead>
                    <tbody>
                    <tr>
                        <td class="font-weight-bold"> @lang('Price') </td>
                        <td style="width:70%"> <span class="text-money font-weight-bold"> ${!! $travel->price !!} </span> </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"> @lang('Limit user') </td>
                        <td> {!! $travel->limit_user !!} </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"> @lang('Location') </td>
                        <td> {!! $travel->location->name !!} </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"> @lang('Check In') </td>
                        <td> {!! $travel->check_in_at !!} </td>
                    </tr>
                    <tr>
                        <td class="font-weight-bold"> @lang('Check Out') </td>
                        <td> {!! $travel->check_out_at !!} </td>
                    </tr>
                    </tbody>
                </table>

                <!-- Book now -->
                @if(!request()->is('travels/booking/*'))
                    <button id="btnBookNow"
                            type="button"
                            class="btn btn-outline-warning">
                        @lang("Book now")
                    </button>
                @endif
            </div>
            <div class="col-md-10 col-lg-6">
                <img src="{!! asset(get_image_from_disk($travel->image)) !!}"
                     width="720"
                     height="459"/>
            </div>
        </div>
    </div>
</section>

