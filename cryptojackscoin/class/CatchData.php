<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 14:58
 */
class CatchData {

    static function catchGET(&$catchValue){

        $data = [];
        foreach ($_GET as $key => $value)
            $data[$key] = $value;

        return $data;
    }

    static function catchPOST(&$catchValue){

        $data = [];
        foreach ($_POST as $key => $value)
            $data[$key] = $value;

        return $data;
    }
}