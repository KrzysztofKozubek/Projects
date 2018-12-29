<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 05.04.2017
 * Time: 13:18
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

    static function takeDataJSON(&$data, $json){

        foreach($data as $key => $value)
            if(isset($json->$key))
                $data[$key] = $json->$key;
    }

    static function takePOST(&$data){

        foreach ($_POST as $key => $value)
            $data[$key] = $value;
    }

    static function getJSON($arr){

        header('Content-Type: application/json');
        return json_encode($arr);
    }
}
