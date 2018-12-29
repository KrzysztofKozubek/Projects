<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 16:39
 */
include_once ("controller.php");

class RegisterController extends Controller {

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

    /**
     * @param $data
     * $data: { id = integer, username = string, email = string(6, 256), wallet = string(34), password = string(8, 20), country = integer }
     * check correct data and control result from database
     * if find mistake forwarding /registration/ with description error
     */
    function register(&$data) {

        if($this->checkDataToRegisterUser($data) == true) {
            include_once ("../models/register.php");
            include_once ("../views/register.php");

            $viewRegister   = new RegisterView();
            $modelRegister  = new RegisterModel();

            $result = $modelRegister->register($data);
            // if registration done correct
            if ($result == 0) {
                $viewRegister->register($data);
                return;
            }else {

                $descriptionError = array(
                    "1" => "Bad ID sponsor",
                    "2" => "Username exists",
                    "3" => "Username contains uncorrected signs",
                    "4" => "Email exists",
                    "5" => "Wallet exists",
                    "6" => "Bad Password",
                    "7" => "Bad Country"
                );
                $data['error'] = $descriptionError[$result];
            }
        } // in other way
        $ip = "http://".$_SERVER ["SERVER_NAME"];
        header("Location: $ip/registration/?id=$data[id]&&username=$data[username]&&email=$data[email]&&country=$data[country]&&error=$data[error]");
    }

    /**
     * @param $data
     * $data: { codeMail = string(5, 10) }
     */
    function confirmMail(&$data) {

        include_once ("../class/CorrectData.php");
        CorrectData::removeDanger($data['codeMail']);

        include_once ("../models/register.php");
        include_once ("../views/register.php");

        $modelRegister  = new RegisterModel();

        if($modelRegister->confirmMail($data) == true) {

            // correct confirm mail
            $ip = "http://".$_SERVER ["SERVER_NAME"];
            header("Location: $ip/");
        } // in other way
        $data['error'] = "Incorrect code";
        header("Location: $ip/registration/?codeMail=$data[codeMail]&&error=$data[error]");
    }

    /*
     * functions show forms
     */

    function showFrom(&$data) {

        include_once ("../views/register.php");
        $viewRegister = new RegisterView();
        $viewRegister->showForm($data);
    }

    function showFormWithError(&$data) {

        include_once ("../views/register.php");
        $viewRegister = new RegisterView();
        $viewRegister->showFormWithError($data);
    }

    function showFormConfirmMail() {

        include_once ("../views/register.php");
        $viewRegister = new RegisterView();
        $viewRegister->showFormConfirmMail();
    }

    function showFormConfirmMailWithError(&$data) {

        include_once ("../views/register.php");
        $viewRegister = new RegisterView();
        $viewRegister->showFormConfirmMailWithError($data);
    }
}