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
        $this->view = $this->loadView('sign');
        $this->view->showForms();
    }

    public function showFormsErrorLogin($email, $error){
        $arr = array ('email'=>$email, 'error'=>$error);
        echo JSON::getJSON($arr);
    }

    public function showFormsErrorRegistion($name, $surname, $birthdate, $email, $error){
        $arr = array ('name'=>$name, 'surname'=>$surname, 'birthdate'=>$birthdate, 'email'=>$email, 'error'=>$error);
        echo JSON::getJSON($arr);
    }

    /**
     * @param $email
     * @param $password
     */
    public function signIn($email, $password){
        $ip = "http://".$_SERVER ["SERVER_NAME"];

        $this->model    = $this->loadModel('sign');
        $result         = $this->model->signIn($email, $password);

        if($result > 0){
            setcookie('id', $result, time()+60*60*24*30);
            $arr = array ('success'=>1,'id'=>$_COOKIE['id'],'error'=>0);
            echo JSON::getJSON($arr);
//            header("Location: $ip/user/");
        }else{
            $arr = array ('success'=>0,'error'=>1);
            echo JSON::getJSON($arr);
//            header("Location: $ip/user?email=$email&error=$result");
        }
    }

    /**
     * @param $name
     * @param $surname
     * @param $birthdate
     * @param $email
     * @param $password
     */
    public function register($name, $surname, $birthdate, $email, $password){

        $this->model    = $this->loadModel('sign');
        $result         = $this->model->register($name, $surname, $birthdate, $email, $password);

        if($result === 0) {
            $arr = array ('success'=>1,'error'=>0);
            echo JSON::getJSON($arr);
        }else{
            $arr = array ('success'=>0,'error'=>$result);
            echo JSON::getJSON($arr);
            //header("Location: $ip/user/?name=$name&surname=$surname&birthdate=$age&email=$email&error=$result");
        }
    }

    /**
     * @param $idUser
     * return json {logout => correct}
     */
    public function logout($idUser){
        $this->view = $this->loadModel('sign');
        $this->view->logout($idUser);
    }
}
