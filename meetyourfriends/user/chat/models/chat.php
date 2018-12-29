<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-04
 * Time: 00:02
 */
include_once 'models/model.php';


class ChatModel extends Model{

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

    public function addMessage($idUser, $idFriend, $message){

        $query = "CALL `p_addMessage`('$idUser','$idFriend', '$message');";
        $this->executeQuery($query);
    }

    public function getMessage($idUser, $idFriend, $idMessage){

        $query = "CALL `p_getMessage`('$idUser','$idFriend','$idMessage');";
        $result = $this->resultQuestion($query);

        return $result[0];
    }
}