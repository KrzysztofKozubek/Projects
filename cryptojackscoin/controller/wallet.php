<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 04.05.2017
 * Time: 11:02
 */

include_once ("controller.php");

class WalletController extends Controller {

    function JSONWalletUser(&$data) {

        include_once ("../class/JSON.php");
        include_once ("../models/wallet.php");

        $wallet = new WalletModel();
        $data = array_merge($wallet->getAmountWallet($data['wallet']), $data);
        unset($data[0]);
        echo JSON::getJSON($data);
    }

    function payout(&$data) {

        include_once ("../class/JSON.php");
        include_once ("../models/wallet.php");

        $wallet = new WalletModel();
        $result = $wallet->payout($data);
        if($result['result'] != 1) {
            $result = array("correct" => "0", "error" => "You have not enough cj");
        }else {
            $result = array("correct" => "1", "error" => "");
        }
        echo JSON::getJSON($result);
    }
}