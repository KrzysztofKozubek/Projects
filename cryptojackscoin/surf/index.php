<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 02.05.2017
 * Time: 16:22
 */
class RoutingSurf {

    /**
     * Routing surf.
     * It will catch value from key (GET | POST) and launch correct method.
     *
     * routing:
     * GET:
     *      => show ad
     *
     * POST: idCaptcha = integer(1, 4), ad = integer
     *      => check correct captcha, return only {0, 1}
     */

    function routing() {

        //what value will be catch routing GET | POST
        $catchValueGET  = array();
        $catchValuePOST = array("idCaptcha" => "", "ad" => "");

        include_once ("../class/CatchData.php");
        $POSTValue  = CatchData::catchPOST($catchValuePOST);
        $GETValue   = CatchData::catchGET($catchValueGET);

        if (isset($POSTValue['idCaptcha']) && isset($POSTValue['ad']) && $POSTValue['idCaptcha'] != "" && $POSTValue['ad'] != "") {

            // check answer captcha
            echo $this->checkCaptcha($POSTValue);

        }else {

            // show ad
            $this->showSurfBar();

        }
    }

    function checkCaptcha(&$idCaptcha) {

        include_once ("../controller/surf.php");
        $register = new SurfController();
        return $register->checkCaptcha($idCaptcha); // TODO: here method need id login user
    }

    function showSurfBar() {

        include_once ("../controller/surf.php");
        $register = new SurfController();
        $idUser = 1;
        $register->showSurfBar($idUser); // TODO: here method need id login user
    }

}

$routing = new RoutingSurf();
$routing->routing();