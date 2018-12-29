<?php
session_start();

/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2017-03-08
 * Time: 08:49
 */
$ip = "http://".$_SERVER ["SERVER_NAME"];

/**
 *  link: /user/person/
 *  logic:
 *
 *      sign in:
 *
 *      /user/profile/...
 *      -> show profile & wall
 *
 *      not sign in:
 *
 *      /user/profile/...
 *      -> JSON{error : nie zalogowany}
 *
 */

include_once ('../../class/JSON.php');

$data = array('id'=>'','search'=>'','password'=>'','name'=>'','surname'=>'','birthDate'=>'','post'=>'','description'=>'','policy'=>'','idPost'=>'','datePost'=>'');
JSON::takeJSON($data);
JSON::takePOST($data);

header("Access-Control-Allow-Origin: http://localhost:8000");
header('Access-Control-Allow-Credentials: true');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

if(!empty($_COOKIE['id'])){

    if($data['search'] != ''){
        include "controller/search.php";

        $search = new SearchController();
        $result = $search->searchUser($data['search']);

        echo JSON::getJSON($result);
        return;

    }elseif ($data['name'] != '' && $data['surname'] != '' && $data['birthDate'] != '' && $data['password'] != '') {

        include "controller/user.php";

        $user       = new UserController();
        $profile    = $user->editProfile($_COOKIE['id'], $data['name'], $data['surname'], $data['birthDate'], $data['password']);

        echo JSON::getJSON($profile);
        return;

    }elseif ($data['post'] == 'add' && $data['description'] != '' && $data['policy'] != ''){

        include "controller/post.php";

        $post       = new PostController();
        $result     = $post->addPost($_COOKIE['id'], $data['description'], $data['policy']);

        echo JSON::getJSON($result);
        return;

    }elseif ($data['post'] == 'remove' && $data['idPost'] != ''){

        include "controller/post.php";

        $post       = new PostController();
        $result     = $post->removePost($data['idPost']);

        echo JSON::getJSON($result);
        return;

    }elseif ($data['post'] == 'edit' && $data['idPost'] != '' && $data['description'] != '' && $data['policy'] != '' && $data['datePost'] != ''){

        include "controller/post.php";

        $post       = new PostController();
        $result     = $post->editPost($data['idPost'], $_COOKIE['id'], $data['description'], $data['policy'], $data['datePost']);

        echo JSON::getJSON($result);
        return;

    }elseif ($data['post'] == 'like' && $data['idPost'] != ''){

        include "controller/post.php";

        $post       = new PostController();
        $result     = $post->likePost($data['idPost']);

        echo JSON::getJSON($result);
        return;

    }

    if(isset($_GET['id']) && !empty($_GET['id'])) {

        include "controller/user.php";

        $user = new UserController();
        $profile = $user->getProfile($_GET['id'], $_GET['id']);

        echo JSON::getJSON($profile);
        return;
    }

    if($data['id'] != '') $data['id'] = $_COOKIE['id'];
    include "controller/user.php";

    $user = new UserController();
    $profile = $user->getWall($_COOKIE['id'], $data['id']);

    echo JSON::getJSON($profile);

/*
 * Not sign in:
 */

}else{

    $arr = array('error'=>'nie jesteś zalogowany ;)');
    echo JSON::getJSON($arr);
    return;
}