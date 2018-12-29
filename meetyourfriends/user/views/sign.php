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

        $this->model = $this->loadModel('sign');
        /*
         * Render website
         */
        $this->render('../user/templates/sign');
    }

    public function showFormsErrorLogin($email, $error){

        $this->model = $this->loadModel('sign');
        $this->set('email', $email);
        $this->set('error', $error);

        $this->render('../user/templates/signErrorLogin');
    }

    public function showFormsErrorRegistion($name, $surname, $birthdate, $email, $error){

        $this->model = $this->loadModel('sign');

        $this->set('name',      $name);
        $this->set('surname',   $surname);
        $this->set('birthdate', $birthdate);
        $this->set('email',     $email);
        $this->set('error',     $error);

        $this->render('../user/templates/signErrorRegistion');
    }


    public function logout($idUser){
        $this->model = $this->loadModel('sign');
        $this->model->logout($idUser);
    }
}