<?php
if(!defined('AREA_NORTHERN')) define('AREA_NORTHERN', 1);
if(!defined('AREA_CENTRAL'))define('AREA_CENTRAL', 2);
if(!defined('AREA_SOUTH')) define('AREA_SOUTH', 3);

if(!defined('THEME_FORMAT_DATE')) define('THEME_FORMAT_DATE', 'Y-d-m');
if(!defined('FORMAT_DATE')) define('FORMAT_DATE', 'Y-m-d');
if(!defined('ALL')) define('ALL', 0);

if(!defined('PAYMENT_METHOD_CASH')) define('PAYMENT_METHOD_CASH', 1);
if(!defined('PAYMENT_METHOD_CARD')) define('PAYMENT_METHOD_CARD', 2);
if(!defined('PAYMENT_METHOD_TRANSLATE')) define('PAYMENT_METHOD_TRANSLATE', [
    PAYMENT_METHOD_CASH => "Pay with cash",
    PAYMENT_METHOD_CARD => "Pay with card",
]);
