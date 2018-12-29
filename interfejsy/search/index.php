<?php
session_start();
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-01
 * Time: 14:41
 */

include ("class/JSON.php");

$data = ['search' => '', 'genre' => '', 'yearSince' => '', 'yearTo' => '', 'actor' => '', 'sort' => ''];

JSON::takeGET($data);
JSON::takePOST($data);

if($data['search'] == '' && $data['genre'] == '' && $data['yearSince'] == '' && $data['yearTo'] == '' && $data['actor'] == '' && $data['sort'] == '') {
    include 'controller/search.php';
    $ob = new SearchController();
    $ob->index();
}else{
    include 'controller/search.php';
    $ob = new SearchController();
    $ob->search($data);
}
?>

