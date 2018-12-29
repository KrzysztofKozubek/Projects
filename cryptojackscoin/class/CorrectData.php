<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 16:09
 */
class CorrectData {

    /**
     * @param $value
     * Method change all special character for example ' " & < > to html version
     */
    public static function removeDanger(&$value) {

        $value = strip_tags($value);
        $value = htmlentities($value);
        $value = htmlspecialchars($value);
    }

    /**
     * @param $id => id sponsor
     * @return bool
     *
     * method check ID can be correct
     */
    public function checkID ($id) {

        self::removeDanger($id);
        if(!is_numeric($id) || !is_int($id) || $id < 0) return false;
        return true;
    }

    /**
     * @param $username
     * @return bool
     *
     * method check $username can be correct
     */
    public function checkUsername ($username) {

        self::removeDanger($username);
        if(!preg_match("/^[a-zA-Z ]*$/",$username)) return false;
        return true;
    }

    /**
     * @param $email
     * @return bool
     *
     * Method check email can be correct
     */
    public function checkEmail ($email) {

        self::removeDanger($email);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) return false;
        return true;
    }

    /**
     * @param $wallet
     *      => $wallet; string (27;34); fist sign (1 or 3); without 0 and O, I, l
     * @return bool
     * Method check $wallet can be correct
     */
    public function checkWallet ($wallet) {

        /*
         * string (27;34)
         * fist sign (1 or 3)
         * without 0 and O, I, l
         */
        self::removeDanger($wallet);
        if(strlen($wallet) < 35 && strlen($wallet) > 26 &&
            substr($wallet, 1) != "1" && substr($wallet, 1) != "3" &&
            !strpos($wallet, "0") && !strpos($wallet, "O") && !strpos($wallet, "I") && !strpos($wallet, "l")) return true;
        return false;
    }

    /**
     * @param $password
     *      => $password; string(3;25)
     * @return bool
     * Method check $password can be correct
     */
    public function checkPassword ($password) {

        self::removeDanger($password);
        if(strlen($password) < 3 && strlen($password) > 24) return false;
        return true;
    }

    /**
     * @param $country
     * @return bool
     * Method check $country can be correct
     */
    public function checkCountry ($country) {

        /*
         * country on the world ~194
         */
        self::removeDanger($country);
        if(is_numeric($country) && is_int($country) && $country > 0 && $country < 195) return true;
        return false;
    }
}