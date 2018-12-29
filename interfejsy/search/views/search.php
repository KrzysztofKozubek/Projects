<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-01
 * Time: 14:54
 */

include 'view.php';

class SearchView extends View{

    public function index(){

        $art=$this->loadModel('movies', '../models/');

        $this->set('genres', $art->getGenres());

        $this->render('head');

        $this->render('search');

        $this->render('footer');
    }
    public function search($search, $actor, $yearSince, $yearTo, $mark, $genre, $sort){

        $art=$this->loadModel('search');

        $this->set('movies', $art->getSearchMovies($search, $actor, $yearSince, $yearTo, $genre, $mark, $sort));

        $this->set('genres', $art->getGenres());

        $this->render('head');

        $this->render('search');

        $this->render('footer');

    }
}