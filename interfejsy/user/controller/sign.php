<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-03
 * Time: 23:59
 */
include_once "controller.php";

class SignController extends Controller{

    public function showForms(){
        $view = $this->loadView('sign');
        $view->showForms();
    }

    public function loginError($email, $error){
        $this->view = $this->loadView('sign');
        $this->view->loginError($email, $error);
    }

    public function registionError($name, $email, $age, $sex, $error){
        $this->view = $this->loadView('sign');
        $this->view->registionError($name, $email, $age, $sex, $error);
    }


    public function login($email, $password, $flag = 0){
        $ip = "http://".$_SERVER ["SERVER_NAME"];

        if($flag == 0)
        $this->model    = $this->loadModel('sign');
        $result         = $this->model->login($email, $password);

        if($result['id'] == 0) $error = "Error! Incorrect email or password or both.";
        else {
            $_SESSION['id']     = $result['id'];
            $_SESSION['name']   = $result['name'];
            header("Location: $ip/user/");
        }
        echo $error;
        header("Location: $ip/user?email=$email&error=$error");
    }

    public function registion($name, $email, $age, $sex, $password){
        $ip = "http://".$_SERVER ["SERVER_NAME"];

        $this->model    = $this->loadModel('sign');
        $result         = $this->model->registion($name, $email, $age, $sex, $password);

        if($result == 0) {
            $this->login($email, $password, 1);
            header("Location: $ip/user");
        }elseif($result == 1){
            $error = "Email is used!";
        }elseif ($result == 2){
            $error = "Name is used!";
        }else{
            $error = "Email and name is used!";
        }
        header("Location: $ip/user/?name=$name&email=$email&age=$age&sex=$sex&error=$error");
    }

    public function logout($idUser){
        $this->view = $this->loadView('sign');
        $this->view->logout($idUser);
        $ip = "http://".$_SERVER ["SERVER_NAME"];
        header("Location: $ip/user/");
    }
}