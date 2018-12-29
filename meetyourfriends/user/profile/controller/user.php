<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-05
 * Time: 01:26
 */
include_once "controller.php";

class UserController extends Controller{

    public function getProfile($idUser, $idShow){

        $this->model        = $this->loadModel('user');

        $result['profile']  = $this->model->showProfile($idUser);
        $result['logs']     = $this->model->getLogs($idUser);
        $result['friends']  = $this->model->getFriends($idUser);
        $result['posts']    = $this->model->getPosts($idUser);

        return $result;
    }

    public function getWall($idUser, $idShow){

        $this->model        = $this->loadModel('user');

        $result['profile']  = $this->model->showProfile($idUser);
        $result['logs']     = $this->model->getLogs($idUser);
        $result['friends']  = $this->model->getFriends($idUser);
        $result['posts']    = $this->model->getWall($idUser);

        return $result;
    }

    public function editProfile($id, $name, $surname, $birthData, $password) {

        $this->model        = $this->loadModel('user');

        $this->model->editProfile($id, $name, $surname, $birthData, $password);
        $result['profile']  = $this->model->showProfile($id);

        return $result;
    }
}