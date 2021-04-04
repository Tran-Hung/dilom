<?php
if (!function_exists('redirect_after_store_updates')) {
    function redirect_after_store_updates($redirect, $message, $status = 'success')
    {
        return redirect()->route($redirect)->with([
            'alert-type' => $status,
            'message'    => $message,
        ]);
    }
}

/**
 * Format money
 *
 */
if (!function_exists('format_money')){
    function format_money($money)
    {
        if ($money == (int)$money)
            return number_format($money);
        else {
            $digits = strlen(substr(strrchr($money, "."), 1));

            if ($digits > 1) { //Ex: 12.733
                return number_format($money, 2);
            } else { //Ex: 12.7
                return number_format($money, 1);
            }
        }

    }
}

/**
 * Remove char
 *
 */
if (!function_exists('replace_char')){
    function replace_char($search, $replace, $value)
    {
        return str_replace($search, $replace, $value);
    }
}
