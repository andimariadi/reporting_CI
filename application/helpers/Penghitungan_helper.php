<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
* 
*/
    function get_percent($value, $value2) {
            $result = number_format(($value/$value2)*100, 2);
            return $result;
    }