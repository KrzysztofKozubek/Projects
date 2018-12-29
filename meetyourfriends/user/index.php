<?php
session_start();

/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2017-03-08
 * Time: 08:49
 */
$ip = "http://".$_SERVER ["SERVER_NAME"];

/**
 *  link: /user
 *  logic:
 *
 *      sign in:
 *
 *      /user/...
 *      -> show profile user
 *
 *      not sign in:
 *
 *      /user/
 *      -> show forms login and register
 *
 *      /user/?[POST]name=var&surname=var&age=int&email=var&password=var
 *      -> do process register
 *
 *      /user/?[POST]email=var&password=var
 *      -> do process sign in
 *
 */

/*
 * Check user is sign in
 */
include_once ('../class/JSON.php');

$data = array('email'=>'','password'=>'','name'=>'','surname'=>'','birthDate'=>'','logout'=>'');
JSON::takeJSON($data);
JSON::takePOST($data);

    header("Access-Control-Allow-Origin: http://localhost:8000");
    header('Access-Control-Allow-Credentials: true');
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");

if(isset($_COOKIE['id']) && $_COOKIE['id'] != null){

    if($data['logout'] != ''){

        include_once 'controller/sign.php';
        $user = new SignController();
        $user->logout($_COOKIE['id']);

        $arr = array('success'=>1);
        echo JSON::getJSON($arr);
        return;

    }else{

        $arr = array('error'=>'jesteś już zalogowany');
        echo JSON::getJSON($arr);
        return;
    }

/*
 * Not sign in:
 */

}elseif ($data['name'] != '' && $data['surname'] != '' && $data['birthDate'] != '' && $data['email'] != '' && $data['password'] != '') {
    /*
     * Register new user
     */

    include_once 'controller/sign.php';
    $user = new SignController();
    $user->register($data['name'], $data['surname'], $data['birthDate'], $data['email'], $data['password']);
    return;

}elseif ($data['email'] != '' && $data['password'] != '') {
    /*
     * Sign in user
     */

    include_once 'controller/sign.php';
    $user = new SignController();
    $user->signIn($data['email'], $data['password']);
    return;

}else{
    /*
     * Bad link -> result (go to location: /user)
     */

    $arr = array ('success'=>0,'error'=>'Zły link *****! ');
    header('Content-Type: application/json');
    echo json_encode($arr);
    return;
}
