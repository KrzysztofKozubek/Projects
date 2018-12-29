<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-01
 * Time: 14:45
 */

include '../controller/controller.php';

class SearchController extends Controller{

    public function index(){
        $this->view=$this->loadView('search');
        $this->view->index();
    }

    public function search(&$data){
        $this->view=$this->loadView('search');

        $search     = $data['search'];
        $actor      = $data['actor'];
        $yearSince  = $data['yearSince'];
        $yearTo     = $data['yearTo'];
        $mark       = $data['mark'];
        $genre      = $data['genre'];
        $sort       = $data['sort'];

        if(!isset($genre[0])) $genre[0] = '';
        if(!isset($genre[1])) $genre[1] = '';

        if(!isset($sort) || empty($sort)) $sort = 0;

        if($yearSince <= 0) $yearSince = 0;
        if($yearTo <= 0) $yearTo = 9999;

        if($mark == "All") { $mark = 0; }

        $this->view->search($search, $actor, $yearSince, $yearTo, $mark, $genre, $sort);
    }
}