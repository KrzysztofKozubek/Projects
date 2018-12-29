<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-04
 * Time: 00:02
 */
include_once 'models/model.php';


class SignModel extends Model{

    public function executeQuery($sql){
        $this->pdo->query($sql);
    }

    public function resultQuestion($sql){
        $this->pdo->query('SET NAMES utf8');
        $select = $this->pdo->query($sql);
        $data = null;
        foreach ($select as $row) {
            $data[] = $row;
        }
        $select->closeCursor();

        return $data;
    }

    public function getIP() {
        $ipaddress = '';
        if (getenv('HTTP_CLIENT_IP'))
            $ipaddress = getenv('HTTP_CLIENT_IP');
        else if(getenv('HTTP_X_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
        else if(getenv('HTTP_X_FORWARDED'))
            $ipaddress = getenv('HTTP_X_FORWARDED');
        else if(getenv('HTTP_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_FORWARDED_FOR');
        else if(getenv('HTTP_FORWARDED'))
            $ipaddress = getenv('HTTP_FORWARDED');
        else if(getenv('REMOTE_ADDR'))
            $ipaddress = getenv('REMOTE_ADDR');
        else
            $ipaddress = 'UNKNOWN';
        return $ipaddress;
    }

    public function signIn($email, $password){
        $ip = $this->getIP();
        $query = "CALL `p_login`('$email', '$password', '$ip');";
        $result = $this->resultQuestion($query);

        if(!isset($result[0]['IDUser']) || $result[0]['IDUser'] == 0) return "Error! Incorrect email or password or both";
        $_COOKIE['id'] = $result[0]['IDUser'];
        return $result[0]['IDUser'];
    }

    public function register($name, $surname, $birthdate, $email, $password){

        $query = "CALL `p_registration`('$name', '$surname', '$birthdate', '$email', '$password');";
        $result = $this->resultQuestion($query);

        switch ($result[0]['result']){
            case 0:
                return 0;
                break;
            case 1:
                return "Email is used ;(";
                break;
        }
    }

    public function logout($idUser){

        if($_COOKIE['id'] == $idUser)  {
               setcookie('id', null);
        }

    }

}