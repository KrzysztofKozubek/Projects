<?php
session_start();
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2017-03-04
 * Time: 21:12
 */

$ip = "http://".$_SERVER ["SERVER_NAME"];

include_once ('../../class/JSON.php');

$data = array('id' => '' , 'message' => '', 'idMessage'=> '');
JSON::takeJSON($data);
JSON::takePOST($data);

header("Access-Control-Allow-Origin: http://localhost:8000");
header('Access-Control-Allow-Credentials: true');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

if(!empty($_COOKIE['id'])){

    set_time_limit(0);
    ob_implicit_flush();

    $address = '127.0.0.1';
    $port = 3000;

    if (($sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)) === false) {
        echo "socket_create() failed: reason: " . socket_strerror(socket_last_error()) . "\n";
    }
    if (socket_bind($sock, $address, $port) === false) {
        echo "socket_bind() failed: reason: " . socket_strerror(socket_last_error($sock)) . "\n";
    }
    if (socket_listen($sock, 5) === false) {
        echo "socket_listen() failed: reason: " . socket_strerror(socket_last_error($sock)) . "\n";
    }
    do {
        if (($msgsock = socket_accept($sock)) === false) {
            echo "socket_accept() failed: reason: " . socket_strerror(socket_last_error($sock)) . "\n";
            break;
        }
        $msg = "Welcome ";
        socket_write($msgsock, $msg, strlen($msg));
        do {

            if (false === ($buf = socket_read($msgsock, 9999, PHP_NORMAL_READ))) {
                echo "socket_read() failed: reason: " . socket_strerror(socket_last_error($msgsock)) . "\n";
                break 2;
            }
            if ($buf == 'quit') {
                break;
            }
            if ($buf == 'shutdown') {
                socket_close($msgsock);
                break 2;
            }
            $talkback = "PHP: You said '$buf'.\n";
            socket_write($msgsock, $talkback, strlen($talkback));



            if(!isset($_SESSION['socket']) || isset($_SESSION['result'])) {
                $_SESSION['socket'] = true;
                $_SESSION['result'] = true;
            }

            while ($_SESSION['socket'] == true || $_SESSION['result'] == true) {
                // create socket
                $_SESSION['socket'] = false;
                $_SESSION['result'] = false;

                $socket = socket_create(AF_INET, SOCK_STREAM, 0)    or $cSocket = true;
                $result = socket_connect($socket, $host, $port)     or $bResult = true;
            }

            $result = socket_read($_SESSION['socket'], 3000) or die("Could not read server response\n");
            JSON::takeDataJSON($data, $result);
            echo $data;

            if($data['message'] != '' && $data['id'] != ''){
                include "controller/chat.php";

                $friend = new ChatController();
                $result = $friend->addMessage($_COOKIE['id'], $data['id'], $data['message']);

                echo JSON::getJSON($result);
            }

            if($data['idMessage'] != '' && $data['id'] != ''){
                include "controller/chat.php";

                $friend = new ChatController();
                $result = $friend->getMessage($_COOKIE['id'], $data['id'], $data['idMessage']);

                echo JSON::getJSON($result);
            }

            foreach($data as $key => $value)
                $data[$key] = "";
        } while (true);
    } while (true);
}

?>