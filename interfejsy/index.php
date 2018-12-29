<?php
session_start();
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-01
 * Time: 14:41
 */

if(isset($_GET['person'])){

    if(isset($_GET['birthdays'])){

        include 'controller/movies.php';
        $ob = new MoviesController();
        $ob->birthdays();
        return 0;
    }

    if(empty($_GET['person'])){

        if(!isset($_GET['site']) || !isset($_GET['search'])){
            $_GET['site']   = 1;
            $_GET['search'] = "";
        }
        include 'controller/movies.php';
        $ob = new MoviesController();
        $ob->persons($_GET['search'], $_GET['site']);
    }else{

        include 'controller/person.php';
        $ob = new PersonController();
        $ob->index($_GET['person']);

    }

}else{

    if(isset($_GET['search'])){

        $search = ($_GET['search']  );

        if(isset($_GET['site']))    $site   = ($_GET['site']) * 20;
        else                        $site   = 0;
        if(isset($_GET['genre']))   $genre  = ($_GET['genre']);
        else                        $genre  = "All";
        if(isset($_GET['mark']))    $mark   = ($_GET['mark']);
        else                        $mark   = "All";
        if(isset($_GET['sort']))    $sort   = ($_GET['sort']);
        else                        $sort   = "All";

        include 'controller/movies.php';

        $ob = new MoviesController();

        $ob->search($search, $genre, $mark, $sort, $site, 20);
    }else{
        if(isset($_POST['idUser']) && isset($_POST['mark'])){
            include 'controller/movie.php';
            $ob = new MovieController();
            $ob->addComment($_POST['idUser'], $_POST['idMovie'], $_POST['mark'], $_POST['comment']);
            //header("Location: ?id=$_POST[idMovie]");
        }else {
            if(isset($_POST['idUser']) && isset($_POST['idMovie'])) {
                include 'controller/movie.php';
                $ob = new MovieController();
                $ob->addMovie($_POST['idUser'], $_POST['idMovie']);
            }
            if (isset($_GET['id'])) {
                $id = $_GET['id'];
                include 'controller/movie.php';
                $ob = new MovieController();
                $ob->movie($id);

            } else {
                if (isset($_GET['comment'])) {
                    include 'controller/movies.php';
                    $ob = new MoviesController();
                    $ob->comment($_GET['comment']);
                }
                include 'controller/movies.php';
                $ob = new MoviesController();
                $ob->index();
            }
        }
    }
}
?>

