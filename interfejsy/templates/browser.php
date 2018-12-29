<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-01
 * Time: 22:26
 */
$ip = 'http://' . $_SERVER ["SERVER_NAME"];
?>

<div class="container" xmlns="http://www.w3.org/1999/html">
    <?php if(isset($_GET['comment'])) echo "
    <div class=\"alert alert-info text-center\">
        <strong>
            <span class=\"glyphicon glyphicon-send\"></span>
            " . $_GET['comment'] . "</strong>
    </div>"; ?>

    <div class="row">

        <div class="jumbotron text-center form-inline">
            <form class="form-inline" method="get" action="?">

                <input name="site" value="0" type="hidden"/>

                <div class="form-group form-inline">
                    <span class="btn-lg">Phrase</span>
                    <?php if(isset($_GET['search'])) $search = $_GET['search']; else $search = ""; ?>
                    <label class="sr-only" for="phrase">Phrase</label>
                    <input type="text" name="search" class="form-control" id="phrase" placeholder="Search" value="<?php echo $search; ?>">

                    <button type="submit" class="btn btn-default">Search</button>
                </div>

                <div class="form-inline">
                    <!--Genres-->
                    <div class="form-group">
                        <span>Genres</span>
                        <label class="sr-only" for="grade">Genres</label>
                        <select name="genre" class="form-control selectpicker show-menu-arrow show-tick" id="grade" placeholder="Gatunek" data-size="7">
                            <option data-content="<span class='label label-default'>All</span>">All</option>
                            <?php
                            if(isset($_GET['genre']))
                                $genre = $_GET['genre'];
                            else
                                $genre = "";
                            foreach($this->get('genres') as $row){
                                $g = $row['genre'];
                                if($genre == $g) {
                                    echo "<option selected=\"selected\" data-content=\"<span class='label label-success'>$g</span>\">$g</option>";
                                }
                                else{
                                    echo "<option data-content=\"<span class='label label-success'>$g</span>\">$g</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <!--Mark-->
                    <div class="form-group">
                        <span>Mark</span>
                        <label class="sr-only" for="mark">Mark</label>
                        <select name="mark" class="form-control selectpicker show-menu-arrow show-tick" id="mark" placeholder="Mark">
                            <option data-content="<span class='label label-default'>All</span>">All</option>
                            <?php
                            if(isset($_GET['mark']))
                                $mark = $_GET['mark'];
                            else
                                $mark = "";
                            for($i = 9; $i > 0; $i--){
                                if($mark == $i){
                                    echo "<option selected=\"selected\" data-content=\"<span class='label label-warning'>$i+</span>\">$i</option>";
                                }else{
                                    echo "<option data-content=\"<span class='label label-warning'>$i+</span>\">$i</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <!--Sort-->
                    <div class="form-group">
                        <span>Sort</span>
                        <?php
                            if(isset($_GET['sort']))
                                $sort = $_GET['sort'];
                            else
                                $sort = "";
                        ?>
                        <label class="sr-only" for="sort">Sort</label>
                        <select name="sort" class="form-control selectpicker show-menu-arrow show-tick" id="sort" placeholder="Sort">
                            <option data-content="<span class='label label-default'>All</span>">All</option>
                            <optgroup label="Time" data-max-options="2">
                                <option <?php if($sort=="Najnowsze") echo "selected=\"selected\""; ?> data-content="<span class='label label-danger'>Time Latest</span>">Najnowsze</option>
                                <option <?php if($sort=="Najstarsze") echo "selected=\"selected\""; ?> data-content="<span class='label label-danger'>Time Oldest</span>">Najstarsze</option>
                            </optgroup>
                            <optgroup label="Mark" data-max-options="2">
                                <option <?php if($sort=="Oceny Max") echo "selected=\"selected\""; ?> data-content="<span class='label label-danger'>Mark best</span>">Oceny Max</option>
                                <option <?php if($sort=="Oceny Min") echo "selected=\"selected\""; ?> data-content="<span class='label label-danger'>Mark worst</span>">Oceny Min</option>
                            </optgroup>
                            <optgroup label="Alphabetic" data-max-options="2">
                                <option <?php if($sort=="A - Z") echo "selected=\"selected\""; ?> data-content="<span class='label label-danger'>Alphabetic A - Z</span>">A - Z</option>
                                <option <?php if($sort=="Z - A") echo "selected=\"selected\""; ?> data-content="<span class='label label-danger'>Alphabetic Z - A</span>">Z - A</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
            </form>
            <a href="/search" <span> Go to advantages search </span> </a>
        </div>

        <div class="row text-center">

            <?php
            if($this->get('movies')){
                foreach($this->get('movies') as $movie){
                    ?>
                    <div class="col-lg-2">
                        <a href="<?php echo $ip; ?>/?id=<?php echo $movie['id']; ?>" class="thumbnail">
                            <div style="background-image:url(<?php echo $movie['poster']; ?>);" class="image"></div>
                            <h4 class="text-center"><?php echo $movie['title']; ?></h4>
                        </a>
                    </div><!--/col-lg-2-->
                    <?php
                }
            }
            ?>
        </div><!--/row-->

        <div class="row text-center">
        <nav>
            <ul class="pagination">
<!--                <li>-->
<!--                    <a href="#" aria-label="Previous">-->
<!--                        <span aria-hidden="true">&laquo;</span>-->
<!--                    </a>-->
<!--                </li>-->

                <?php

                $min = 0;
                $max = 100;
                $number = floor($this->get('site'));

                if(isset($_GET['site'])){
                    $i = $_GET['site'] - 5;
                    $site = $_GET['site'];
                }
                else{
                    $i = 0;
                    $site = 1;
                }
                if($i < 0) $i = 0;
                $j = $i + 10;
                $next = $site + 1;
                $prev = $site - 1;
                if($site >= $min + 1) echo "<li><a href=\"$ip/?site=$prev&search=$search&genre=$genre&mark=$mark&sort=$sort\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>";
                for(; $i <= $number && $i <= $j && $i >= $min && $i <= $max; $i++){
                    if($i != $site)
                        echo"<li><a href=\"$ip/?site=$i&search=$search&genre=$genre&mark=$mark&sort=$sort\">".($i + 1)."</a></li>";
                }
                if($site < $number) echo "<li><a href=\"$ip/?site=$next&search=$search&genre=$genre&mark=$mark&sort=$sort\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>";
                ?>
<!--                <li>-->
<!--                    <a href="#" aria-label="Next">-->
<!--                        <span aria-hidden="true">&raquo;</span>-->
<!--                    </a>-->
<!--                </li>-->
            </ul>
        </nav>
            </div>

    </div><!--/row-->