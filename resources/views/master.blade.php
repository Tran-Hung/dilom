<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
<head>
    <!-- Site Title-->
    <title>Home</title>
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="{!! asset('images/favicon.ico') !!}" type="image/x-icon">
    <!-- Stylesheets -->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Oswald:200,400%7CLato:300,400,300italic,700%7CMontserrat:900">
    <link rel="stylesheet" href="{!! asset('css/bootstrap.css') !!}">
    <link rel="stylesheet" href="{!! asset('css/style.css') !!}">
    <link rel="stylesheet" href="{!! asset('css/fonts.css') !!}">
    <link rel="stylesheet" href="{!! asset('css/my-style.css') !!}">

    <!--[if lt IE 10]>
    <div style="background: #212121; padding: 10px 0; box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3); clear: both; text-align:center; position: relative; z-index:1;">
        <a href="http://windows.microsoft.com/en-US/internet-explorer/">
        <img src="{!! asset('images/ie8-panel/warning_bar_0000_us.jpg') !!}"
         border="0"
         height="42"
         width="820"
         alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today.">
        </a>
    </div>
    <script src="{!! asset('js/html5shiv.min.js') !!}"> </script>
    <![endif]-->
</head>
<body>
<!-- Page preloader-->
<div class="page-loader">
    <div class="page-loader-body">
        <div class="preloader-wrapper big active">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"> </div>
                </div>
                <div class="gap-patch">
                    <div class="circle"> </div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"> </div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"> </div>
                </div>
            </div>
            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Page-->
<div class="page">
    <!-- Page Header-->
    <header class="section page-header">
        <!-- RD Navbar-->
        <div class="rd-navbar-wrap rd-navbar-corporate">
            <nav class="rd-navbar" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-fullwidth" data-xl-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-fixed" data-xl-device-layout="rd-navbar-static" data-md-stick-up-offset="130px" data-lg-stick-up-offset="100px" data-stick-up="true" data-sm-stick-up="true" data-md-stick-up="true" data-lg-stick-up="true" data-xl-stick-up="true">
                <div class="rd-navbar-collapse-toggle" data-rd-navbar-toggle=".rd-navbar-collapse"><span></span></div>
                <div class="rd-navbar-inner">
                    <!-- RD Navbar Panel-->
                    <div class="rd-navbar-panel">
                        <!-- RD Navbar Toggle-->
                        <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                        <!-- RD Navbar Brand-->
                        <div class="rd-navbar-brand"><a class="brand-name" href="index.html"><img class="logo-default" src="{!! asset('images/logo-default-208x46.png') !!}" alt="" width="208" height="46"/><img class="logo-inverse" src="images/logo-inverse-208x46.png" alt="" width="208" height="46"/></a></div>
                    </div>
                    <div class="rd-navbar-aside-center">
                        <div class="rd-navbar-nav-wrap">
                            <!-- RD Navbar Nav-->
                            <ul class="rd-navbar-nav">
                                <li class="active"><a href="{!! route("index") !!}"> @lang('Home') </a>
                                </li>
                                <li><a href="{!! route("travels") !!}"> @lang('Tours') </a></li>
{{--                                <li><a href="#">Contacts</a>--}}
{{--                                </li>--}}
{{--                                <li><a href="#">Typography</a>--}}
{{--                                </li>--}}
                            </ul>
                        </div>
                    </div>
                    <div class="rd-navbar-aside-right">
                        <a class="button button-sm button-secondary button-nina" href="#">@lang('Book tour')</a>
                    </div>
                </div>
            </nav>
        </div>
    </header>

    @yield("content")

    <!-- Footer Minimal-->
    <footer class="section page-footer page-footer-minimal novi-background bg-cover text-center bg-gray-darker">
        <div class="container container-wide">
            <div class="row row-fix justify-content-sm-center align-items-md-center row-30">
                <div class="col-md-10 col-lg-7 col-xl-4 text-xl-left">
                    <a href="index.html">
                        <img class="inverse-logo"
                             src="{!! asset('images/logo-inverse-208x46.png') !!}" alt="" width="208" height="46"/></a></div>
                <div class="col-md-10 col-lg-7 col-xl-4">
                    <p class="right">&#169;
                        &nbsp;<span class="copyright-year"></span>
                        @lang('All Rights Reserved. Design by')
                        <a href="https://www.templatemonster.com"> Hung Tran </a>
                    </p>
                </div>
                <div class="col-md-10 col-lg-7 col-xl-4 text-xl-right">
                    <ul class="group-xs group-middle">
                        <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi mdi-facebook" href="#"></a></li>
                        <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi mdi-twitter" href="#"></a></li>
                        <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi mdi-instagram" href="#"></a></li>
                        <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi mdi-google" href="#"></a></li>
                        <li><a class="icon novi-icon icon-md-middle icon-circle icon-secondary-5-filled mdi mdi-linkedin" href="#"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>

<!-- Global Mailform Output-->
<div class="snackbars" id="form-output-global"> </div>

<!-- Javascript-->
<script src="{!! asset('js/core.min.js') !!}"></script>
<script src="{!! asset('js/script.js') !!}"></script>

@yield("scripts")
<!-- coded by barber-->
</body>
</html>
