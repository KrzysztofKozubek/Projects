<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 16:39
 */
include_once ("controller.php");

class SurfController extends Controller {

    /**
     * @param $data
     * $data: { id = integer, username = string, email = string(6, 256), wallet = string(34), password = string(8, 20), country = integer }
     * @return bool|mixed
     * check correct form to register user
     * return "true" if not find any mistake or message what is wrong for example "Bad Username"
     */
    function checkDataToRegisterUser(&$data){

        include_once ("../class/CorrectData.php");
        $correctData = new CorrectData();

        $error[0] = $correctData->checkID($data['id']);
        $error[1] = $correctData->checkUsername($data['username']);
        $error[2] = $correctData->checkEmail($data['email']);
        $error[3] = $correctData->checkWallet($data['wallet']);
        $error[4] = $correctData->checkPassword($data['password']);
        $error[5] = $correctData->checkCountry($data['country']);

        $descriptionError = array(
            "0" => "Bad ID sponsor",
            "1" => "Bad Username",
            "2" => "Bad Email",
            "3" => "Bad Wallet",
            "4" => "Bad Password",
            "5" => "Bad Country"
        );

        $result = true;
        for($i = 0; $i < count($error); $i++) if($error[$i] == true) $result = $descriptionError[$i];

        return $result;
    }

    function checkCaptcha(&$data) {

        include_once ("../models/surf.php");
        $modelSurf = new Surfmodel();
        $result = $modelSurf->checkCaptcha($data); // TODO: here method need id login user
        return $result[0];
    }

    /*
     * functions show forms
     */

    function showSurfBar(&$idUser) {

        include_once ("../views/surf.php");
        $viewSurf = new SurfView();
        $viewSurf->showSurfBar($idUser); // TODO: here method need id login user
    }
}