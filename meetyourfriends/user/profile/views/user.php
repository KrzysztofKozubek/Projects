<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-05
 * Time: 01:26
 */
include_once 'views/view.php';

class UserView extends View{

    public function showProfile($idUser){
        $this->model = $this->loadModel('user');
        $this->set('profile', $this->model->showProfile($idUser));
        $this->render('../user/templates/user');
    }
}