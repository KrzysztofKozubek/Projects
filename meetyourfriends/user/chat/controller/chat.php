<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-03
 * Time: 23:59
 */
include_once "controller.php";

class ChatController extends Controller{

    public function addMessage($idUser, $idFriend, $message){

        $this->model = $this->loadModel('chat');
        $this->model->addMessage($idUser, $idFriend, $message);

        return 1;
    }

    public function getMessage($idUser, $idFriend, $idMessage){

        $this->model = $this->loadModel('chat');
        $result['message'] = $this->model->getMessage($idUser, $idFriend, $idMessage);

        return $result;
    }
}
