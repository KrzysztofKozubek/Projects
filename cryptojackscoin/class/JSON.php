<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 04.05.2017
 * Time: 10:52
 */
class JSON {

    static function decodeJSON($json){

        $request = json_decode($json);
        return $request;
    }

    static function takeJSON(&$data){

        $json = file_get_contents("php://input");
        $request = json_decode($json);

        foreach($data as $key => $value)
            if(isset($request->$key))
                $data[$key] = $request->$key;
    }

    static function getJSON($arr){

        header('Content-Type: application/json');
        return json_encode($arr);
    }

}