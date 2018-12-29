<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-01
 * Time: 14:45
 */

include 'controller/controller.php';

class SearchController extends Controller{

    public function index(){
        $this->movies();
        echo "index";
    }

    public function comment($comment){
        $this->view=$this->loadView('movies');
        $this->view->comment($comment);
        echo "movies";
    }
}