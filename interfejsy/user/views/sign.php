<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-04
 * Time: 00:01
 */
include 'views/view.php';

class SignView extends View{

    public function showForms(){

        $this->render('head');
        $this->render('../user/templates/sign');
        $this->render('footer');
    }

    public function loginError($email, $error){

        $this->model = $this->loadModel('sign');

        $this->set('email', $email);
        $this->set('error', $error);

        $this->render('head');
        $this->render('../user/templates/signErrorLogin');
        $this->render('footer');
    }

    public function registionError($name, $email, $age, $sex, $error){

        $this->model = $this->loadModel('sign');

        $this->set('name',  $name);
        $this->set('age',   $age);
        $this->set('sex',   $sex);
        $this->set('email', $email);
        $this->set('error', $error);

        $this->render('head');
        $this->render('../user/templates/signErrorRegistion');
        $this->render('footer');
    }


    public function logout($idUser){
        $this->model = $this->loadModel('sign');
        $this->model->logout($idUser);
    }
}