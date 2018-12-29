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

    public function getName($id){
        $query = "SELECT `name` FROM `user` WHERE `user`.`id` = $id;";
        $result = $this->resultQuestion($query);
        return $result[0]['name'];
    }

    public function login($email, $password){
        $ip = "127.0.0.1";
        $query = "CALL `p_login`('$email', '$password');";
        $result = $this->resultQuestion($query);

        $result['id']   = $result[0]['IDUser'];
        $result['name'] = $this->getName($result['id']);

        return $result;
    }

    public function registion($name, $email, $age, $sex, $password){

        $query = "CALL `p_registration`('$name', '$email', '$age', '$sex', '$password');";
        $result = $this->resultQuestion($query);

        return $result[0]['result'];
    }

    public function logout($idUser){

        if($_SESSION['id'] == $idUser)
            session_destroy();
    }

}