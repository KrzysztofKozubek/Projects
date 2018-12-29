<?php
session_start();
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2017-03-08
 * Time: 08:49
 */
$ip = "http://".$_SERVER ["SERVER_NAME"];

/*
 * Check user is sign in
 */
if(isset($_SESSION['id'])){

    if(isset($_GET['sign'])){
        session_destroy();
        header("Location: $ip/?comment=You are correct logout :)");
    }

    include_once 'controller/user.php';

    $ob = new UserController();

    if(isset($_GET['add'])){
        $ob->addFriend($_SESSION['id'], $_GET['id']);
    }else{
        if(!isset($_POST['remove'])){
            if(isset($_GET['remove'])){
                $ob->removeFriend($_SESSION['id'], $_GET['id']);
            }else{
                if(!isset($_GET['id']))
                    $ob->index($_SESSION['id'], $_SESSION['id']);
                else
                    $ob->index($_SESSION['id'], $_GET['id']);
            }
        }else{
            /*
             * remove movie from list
             */
            include_once 'controller/user.php';
            $user = new UserController();
            $user->removeMovie($_POST['idUser'], $_POST['idMovie']);
        }
    }

    /*
     * Not sign in:
     */
}elseif (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['age']) && isset($_POST['sex']) && isset($_POST['password'])) {
    /*
     * Register new user
     */

    include_once 'controller/sign.php';
    $ob = new SignController();
    $ob->registion($_POST['name'], $_POST['email'], $_POST['age'], $_POST['sex'], $_POST['password']);

}elseif (isset($_GET['name']) && isset($_GET['email']) && isset($_GET['age']) && isset($_GET['sex']) && isset($_GET['error'])){
    /*
     * Register with error
     */
    include_once 'controller/sign.php';
    $user = new SignController();
    $user->registionError($_GET['name'], $_GET['email'], $_GET['age'], $_GET['sex'], $_GET['error']);

}elseif (isset($_POST['email']) && isset($_POST['password'])) {
    /*
     * Sign in user
     */

    include_once 'controller/sign.php';
    $ob = new SignController();
    $ob->login($_POST['email'], $_POST['password']);

}elseif(isset($_GET['email']) && isset($_GET['error'])){
    /*
     * Show forms login with completed field username and error
     */
    include_once 'controller/sign.php';
    $user = new SignController();
    $user->loginError($_GET['email'], $_GET['error']);
}else{
    /*
     * Bad link -> result (go to location: /user)
     */
    include_once 'controller/sign.php';
    $user = new SignController();
    $user->showForms();
}