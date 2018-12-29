<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-03
 * Time: 23:59
 */
include_once "controller.php";

class FriendController extends Controller{

    public function removeFriend($idUser, $idFriend){

        $this->model = $this->loadModel('friend');
        $this->model->removeFriend($idUser, $idFriend);
    }

    public function addFriend($idUser, $idFriend){

        $this->model = $this->loadModel('friend');
        $this->model->addFriend($idUser, $idFriend);
    }
}
