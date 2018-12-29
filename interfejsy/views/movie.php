<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-02
 * Time: 11:42
 */

include_once 'views/view.php';

class MovieView extends View{

    public function movie($id){

        $this->model = $this->loadModel('movie');

        $model = $this->model;

        $this->set('movie',     $model->getMovie($id));

        $this->set('actors',    $model->getActorMovie($id));

        $this->set('creators',  $model->getCreatorMovie($id));

        $this->set('comments',  $model->getComments($id));

        $this->set('awards',    $model->getAwards($id));


        if(isset($_SESSION['id']))
        $this->set('list',      $model->getMovieFromList($_SESSION['id'], $id));
        else $this->set('list', 0);

        $this->render('head');

        $this->render('movie');

        $this->render('footer');

    }

    public function addComment($idUser, $idMovie, $mark, $comment){

        $this->model = $this->loadModel('movie');

        $model = $this->model;
        $this->model->addComment($idUser, $idMovie, $mark, $comment);

        $this->set('movie',     $model->getMovie($idMovie));

        $this->set('actors',    $model->getActorMovie($idMovie));

        $this->set('creators',  $model->getCreatorMovie($idMovie));

        $this->set('comments',  $model->getComments($idMovie));

        $this->set('awards',    $model->getAwards($idMovie));

        $this->set('list',      $model->getMovieFromList($idUser, $idMovie));

        $this->render('head');

        $this->render('movieComment');

        $this->render('footer');
    }

    public function addMovie($idUser, $idMovie){

        $this->model = $this->loadModel('movie');

        $model = $this->model;
        $this->model->addMovie($idUser, $idMovie);

        $this->set('movie',     $model->getMovie($idMovie));

        $this->set('actors',    $model->getActorMovie($idMovie));

        $this->set('creators',  $model->getCreatorMovie($idMovie));

        $this->set('comments',  $model->getComments($idMovie));

        $this->set('awards',    $model->getAwards($idMovie));

        $this->set('list',      $model->getMovieFromList($idUser, $idMovie));

        $this->render('head');

        $this->render('movieAddMovie');

        $this->render('footer');
    }
}