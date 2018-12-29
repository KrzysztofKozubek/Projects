<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-04
 * Time: 00:02
 */
include_once 'models/model.php';


class FriendModel extends Model{

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

    public function removeFriend($idUser, $idFriend){

        $query = "CALL `p_removeFriend`('$idUser','$idFriend');";
        $this->executeQuery($query);
    }

    public function addFriend($idUser, $idFriend){

        $query = "CALL `p_addFriend`('$idUser','$idFriend');";
        $this->executeQuery($query);
    }
}