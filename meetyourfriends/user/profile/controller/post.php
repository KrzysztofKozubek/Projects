<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-05
 * Time: 01:26
 */
include_once "controller.php";

class PostController extends Controller{

    public function addPost($id, $description, $policy){

        $this->model        = $this->loadModel('post');
        $result['addPost']  = $this->model->addPost($id, $description, $policy);
        return $result;
    }

    public function removePost($idPost){

        $this->model            = $this->loadModel('post');
        $result['removePost']   = $this->model->removePost($idPost);
        return $result;
    }

    public function editPost($idPost, $idUser, $description, $policy, $datePost){

        $this->model            = $this->loadModel('post');
        $result['editPost']     = $this->model->editPost($idPost, $idUser, $description, $policy, $datePost);
        return $result;
    }

    public function likePost($idPost){

        $this->model            = $this->loadModel('post');
        $result['likePost']     = $this->model->likePost($idPost);

        if(!isset($result['likePost']))
            $result['likePost'][0] = $result['likePost']['likePost'] = 0;
        return $result;
    }
}