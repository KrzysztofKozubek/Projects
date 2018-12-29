<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 19:16
 */
include_once ("model.php");

class SurfModel extends Model {

    function getWebsite(&$idUser) {

        $query = "CALL `p_getWebsiteToSurf`('$idUser');";
        return $this->resultQuestion($query);
    }

    function getCaptcha(&$idUser, &$idAd) {

        $query = "CALL `p_getCaptcha`('$idUser', '$idAd');";
        return $this->resultQuestion($query);
    }

    function checkCaptcha(&$data) {
        // first is id user
        $query = "CALL `p_checkCaptcha`('1', '$data[ad]', '$data[idCaptcha]');";
        return $this->resultQuestion($query);
    }
}