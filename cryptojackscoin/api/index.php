<?php
session_start();

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 16:39
 */

class ApiRegistration {

    /**
     * Routing registration.
     * It will catch value from key (GET | POST) and launch correct method.
     *
     * routing:
     * GET: wallet = string
     *      => return JSON { walletAddress, amountCoins }
     *
     * POST: wallet = string, amount = double
     *      => payout on wallet user, return JSON { correct, error }
     *
     */
    function routing() {

        //what value will be catch routing GET | POST
        $catchValueGET  = array("wallet" => "");
        $catchValuePOST = array("wallet" => "", "amount" => "");

        include_once ("../class/CatchData.php");
        $POSTValue  = CatchData::catchPOST($catchValuePOST);
        $GETValue   = CatchData::catchGET($catchValueGET);

        if (isset($GETValue['wallet']) && $GETValue['wallet'] != "") {

            // return JSON { walletAddress, amountCoins }
            $this->JSONWalletUser($GETValue);

        }elseif (isset($POSTValue['wallet']) && $POSTValue['amount'] != "" && isset($POSTValue['wallet']) && $POSTValue['amount'] != "") {

            // payout on wallet user, return JSON { correct, error }
            $this->payout($POSTValue);

        }
        // do nothing
    }

    /*
     * function to routing
     */

    function JSONWalletUser(&$data) {

        include_once ("../controller/wallet.php");
        $wallet = new WalletController();
        $wallet->JSONWalletUser($data);
    }

    function payout(&$data) {

        include_once ("../controller/wallet.php");
        $wallet = new WalletController();
        $wallet->payout($data);
    }
}

$routing = new ApiRegistration();
$routing->routing();

?>