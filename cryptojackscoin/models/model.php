<?php

/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 01.05.2017
 * Time: 14:58
 */

abstract class Model{

    protected $pdo;

    public function  __construct() {
        try {
            require '../config/sql.php';
            $this->pdo=new PDO('mysql:host='.$host.';dbname='.$dbase, $user, $pass);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        catch(DBException $e) {
            echo 'The connect can not create: ' . $e->getMessage();
        }
    }

    public function loadModel($name, $path='models/') {
        $path=$path.$name.'.php';
        $name=$name.'Model';
        try {
            if(is_file($path)) {
                require $path;
                $ob=new $name();
            } else {
                throw new Exception('Can not open model '.$name.' in: '.$path);
            }
        }
        catch(Exception $e) {
            echo $e->getMessage().'<br />
                File: '.$e->getFile().'<br />
                Code line: '.$e->getLine().'<br />
                Trace: '.$e->getTraceAsString();
            exit;
        }
        return $ob;
    }


    public function executeQuery($sql) {
        $this->pdo->query($sql);
    }

    public function resultQuestion($sql) {
        $this->pdo->query('SET NAMES utf8');
        $select = $this->pdo->query($sql);
        $data = null;
        foreach ($select as $row) {
            $data[] = $row;
        }
        $select->closeCursor();

        return $data[0];
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
}