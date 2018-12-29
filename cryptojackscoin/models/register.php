<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 19:16
 */
include_once ("model.php");

class RegisterModel extends Model {


    function register(&$data) {

        $query  = "CALL `p_registration`('$data[id]', '$data[username]', '$data[email]', '$data[wallet]', '$data[password]', '$data[ip]');";
        return $this->resultQuestion($query);
    }
}