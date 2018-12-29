<?php
session_start();
/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 05.05.2017
 * Time: 10:36
 */
class ClientSocket {

    function __construct2() {
        //$this->connection("localhost");
    }

    function __construct1($IP) {
        $this->connection($IP);
    }

    function __construct($IP, $service, $protocal) {
        $this->connection($IP, $service, $protocal);
    }

    function connection($message) {

        $host = "127.0.0.1";
        $port = 49999;

        for($i =0;$i < 100000; $i++) {
            if(!isset($_SESSION['id']))
                $_SESSION['id'] = 0;
//            $message = "3NzQoNSUvK1pon5KLJLuV4ULthrZ3VgYhv_2566_" . $_SESSION['id']++;
            $_SESSION['id']++;
            $message = $_SESSION['id'];
            echo $message."<br>";

            $cSocket = true;
            $bResult = true;

            while ($cSocket == true || $bResult == true) {
    // create socket
                $cSocket = false;
                $bResult = false;

                $socket = socket_create(AF_INET, SOCK_STREAM, 0)    or $cSocket = true;
                $result = socket_connect($socket, $host, $port)     or $bResult = true;
            }

    // get server response
    //        $result = socket_read($socket, 1024) or die("Could not read server response\n");
    //        echo "Reply From Server  :" . $result;

    // send string to server
            socket_write($socket, $message, strlen($message)) or die("Could not send data to server\n");
            echo "send Message";

    // close socket
            socket_close($socket);
        }
    }
}

new ClientSocket("localhost", 10, 50000);