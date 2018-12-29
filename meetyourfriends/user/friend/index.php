<?php
session_start();
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2017-03-04
 * Time: 21:12
 */

$ip = "http://".$_SERVER ["SERVER_NAME"];

include_once ('../../class/JSON.php');

$data = array('addFriend' => '' , 'removeFriend' => '', 'id'=>'');
JSON::takeJSON($data);
JSON::takePOST($data);

header("Access-Control-Allow-Origin: http://localhost:8000");
header('Access-Control-Allow-Credentials: true');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

if(!empty($_COOKIE['id'])){

    if($data['addFriend'] != '' && $data['id'] != ''){
        include "controller/friend.php";

        $friend = new FriendController();
        $result = $friend->addFriend($_COOKIE['id'], $data['id']);

        echo JSON::getJSON($result);
    }

    if($data['removeFriend'] != '' && $data['id'] != ''){
        include "controller/friend.php";

        $friend = new FriendController();
        $result = $friend->removeFriend($_COOKIE['id'], $data['id']);

        echo JSON::getJSON($result);
    }
}

?>