<?php
session_start();

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 14:58
 */

class Routing {

    /**
     * Routing constructor.
     * It will catch value from key (GET | POST) and launch correct method.
     */
    function routing(){

        //what value will be catch routing GET | POST
        $catchValueGET  = array("key" => "value");
        $catchValuePOST = array("key" => "value");

        include_once ("class/CatchData.php");
        CatchData::catchPOST($catchValuePOST);
        CatchData::catchGET($catchValueGET);

    }
}

$routing = new Routing();
$routing->routing();

?>