<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-05
 * Time: 01:26
 */
include_once "controller.php";

class SearchController extends Controller{

    public function searchUser($search){

        $this->model        = $this->loadModel('search');
        $result['search']   = $this->model->searchUser($search);
        return $result;
    }
}