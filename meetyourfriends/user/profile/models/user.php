<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-05
 * Time: 01:26
 */
include_once 'models/model.php';

class UserModel extends Model{

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

    public function showProfile($idUser){

        $query = "CALL `p_showProfile`('$idUser');";
        $result[0] = $this->resultQuestion($query);
//        print_r($result[0]);
        return $result[0];
    }

    public function getLogs($idUser){

        $query = "CALL `p_getLogs`($idUser);";
        $result[0] = $this->resultQuestion($query);
//        print_r($result[0]);
        return $result[0];
    }

    public function getFriends($idUser){

        $query = "CALL `p_allFriends`($idUser);";
        $result[0] = $this->resultQuestion($query);
//        print_r($result[0]);
        return $result[0];
    }


    public function getWall($idUser){

        $query = "CALL `p_getWall`($idUser);";
        $result[0] = $this->resultQuestion($query);
        return $result[0];
    }


    public function getPosts($idUser){

        $query = "CALL `p_getUserPosts`($idUser);";
        $result[0] = $this->resultQuestion($query);
        return $result[0];
    }

    public function editProfile($id, $name, $surname, $birthData, $password){

        $query = "CALL `p_editProfile`('$id', '$name', '$surname', '$birthData', '$password')";
        $this->executeQuery($query);
    }
}