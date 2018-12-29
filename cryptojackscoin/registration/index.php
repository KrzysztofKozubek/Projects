<?php
session_start();

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 16:39
 */

class RoutingRegistration {

    /**
     * Routing registration.
     * It will catch value from key (GET | POST) and launch correct method.
     *
     * routing:
     * GET: id = integer
     *      => show form with registration and fill input of sponsor (default: 1 admin)
     *
     * POST: id = integer, username = string(3, 15)[A-z], email = string(6, 256), wallet = string(34), password = string(8, 20), country = integer
     *      => register user in program
     *
     * POST: codeMail = string(5, 10)
     *      => confirm email
     *
     * GET: do = "codeMail" string
     *      => show form confirm mail
     *
     * GET: id = integer, username = string(3, 15)[A-z], email = string(6, 256), wallet = string(34), country = integer, error = string
     *      => show error in form register
     *
     * GET: codeMail = string(5, 10); error = string
     *      => show error in form codeMail
     */
    function routing() {

        //what value will be catch routing GET | POST
        $catchValueGET  = array("id" => "", "username" => "", "email" => "", "wallet" => "", "country" => "", "error" => "");
        $catchValuePOST = array("id" => "", "username" => "", "email" => "", "wallet" => "", "password" => "", "country" => "", "error" => "");

        include_once ("../class/CatchData.php");
        $POSTValue  = CatchData::catchPOST($catchValuePOST);
        $GETValue   = CatchData::catchGET($catchValueGET);

        if (isset($GETValue['id']) && isset($GETValue['username']) && isset($GETValue['email']) && isset($GETValue['wallet']) && isset($GETValue['error']) && isset($GETValue['country'])
            && $GETValue['id'] != "" && $GETValue['username'] != "" && $GETValue['email'] != "" && $GETValue['wallet'] != "" && $GETValue['error'] != "" && $GETValue['country'] != "" ) {

            // show form register with fill input and message about error
            $this->showFromWithError($GETValue);

        }elseif (isset($GETValue['codeMail']) && $GETValue['codeMail'] != "" && isset($GETValue['error']) && $GETValue['error'] != "") {

            // show form confirm mail with error
            $this->showFormConfirmMailWithError($GETValue);

        }elseif (isset($GETValue['do']) && $GETValue['codeMail'] != "confirmMail"){

            // show form confirm mail
            $this->showFormConfirmMail();

        }elseif (isset($GETValue['id']) && $GETValue['id'] != "") {

            // show form to register with fill input of sponsor
            $this->showForm($GETValue);

        }elseif (isset($POSTValue['id']) && isset($POSTValue['username']) && isset($POSTValue['email']) && isset($POSTValue['wallet']) && isset($POSTValue['password']) && isset($POSTValue['country'])
            && $POSTValue['id'] != "" && $POSTValue['username'] != "" && $POSTValue['email'] != "" && $POSTValue['wallet'] != "" && $POSTValue['password'] != "" && $POSTValue['country'] != "" ) {

            // register user in program
            $this->register($POSTValue);

        }elseif (isset($POSTValue['codeMail']) && $POSTValue['codeMail'] != ""){

            // confirm registration
            $this->confirmMail($POSTValue);
        }else{

            // show form to register
            $data = array("id" => "1");
            $this->showForm($data);
        }
    }

    /*
     * function to routing
     */

    function register(&$data) {

        include_once ("../controller/register.php");
        $register = new RegisterController();
        $register->register($data);
    }

    function confirmMail(&$data) {

        include_once ("../controller/register.php");
        $register = new RegisterController();
        $register->confirmMail($data);
    }

    /*
     * functions show forms
     */

    function showForm(&$data) {

        include_once ("../controller/register.php");
        $register = new RegisterController();
        $register->showFrom($data);
    }

    function showFromWithError(&$data) {

        include_once ("../controller/register.php");
        $register = new RegisterController();
        $register->showFormWithError($data);
    }

    function showFormConfirmMail() {

        include_once ("../controller/register.php");
        $register = new RegisterController();
        $register->showFormConfirmMail();
    }

    function showFormConfirmMailWithError(&$data) {

        include_once ("../controller/register.php");
        $register = new RegisterController();
        $register->showFormConfirmMailWithError($data);
    }
}

$routing = new RoutingRegistration();
$routing->routing();

?>