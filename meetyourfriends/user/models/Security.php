<?php

/**
 * Created by PhpStorm.
 * User: Kriss
 * Date: 08.03.2017
 * Time: 09:09
 */
class Security {

    public static function securityInput($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    public static function checkEmail($email) {

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return 0;
        }
        return 1;
    }



}