<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 04.05.2017
 * Time: 11:08
 */
include_once ("model.php");

class WalletModel extends Model {

    function getAmountWallet(&$wallet) {

        $query = "CALL `p_getAmountWallet`('$wallet');";
        return $this->resultQuestion($query);
    }

    function payout(&$data) {

        $query = "CALL `p_payout`('$data[wallet]', '$data[amount]');";
        return $this->resultQuestion($query);
    }

}