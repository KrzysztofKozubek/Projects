<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-01
 * Time: 22:26
 */
$ip = 'http://' . $_SERVER ["SERVER_NAME"];
?>

<div class="container">

    <div class="row">

        <div class="jumbotron text-center form-inline">
            <form class="form-inline" method="get" action="?">

                <input name="site" value="0" type="hidden"/>

                <div class="form-inline">
                    <div class="form-group">
                        <span>Phrase Movie</span>
                        <?php if(isset($_GET['search'])) $search = $_GET['search']; else $search = ""; ?>
                        <input type="text" name="search" style="display: block;" class="form-control selectpicker" id="phrase" placeholder="Phrase Movie" value="<?php echo $search; ?>">
                    </div>

                    <div class="form-group">
                        <span>Actor (name or surname)</span>
                        <?php if(isset($_GET['actor'])) $actor = $_GET['actor']; else $actor = ""; ?>
                        <input type="text" name="actor" style="display: block;" class="form-control selectpicker" id="actor" placeholder="Phrase Actor (name or surname)" value="<?php echo $actor; ?>">

                    </div>
                </div>

                <div class="form-inline">
                    <div class="form-group">
                        <span>Since year movie</span>
                        <?php if(isset($_GET['yearSince'])) $yearSince = $_GET['yearSince']; else $yearSince = ""; ?>
                        <input type="number" min="0" name="yearSince" style="display: block;" class="form-control" id="phrase" placeholder="Since year movie" value="<?php echo $yearSince; ?>">
                    </div>

                    <div class="form-group">
                        <span>To year movie</span>
                        <?php if(isset($_GET['yearTo'])) $yearTo = $_GET['yearTo']; else $yearTo = ""; ?>
                        <input type="number" min="0" name="yearTo" style="display: block;" class="form-control" id="actor" placeholder="To year movie" value="<?php echo $yearTo; ?>">
                    </div>
                </div>

                <div class="form-inline">
                    <!--Genres-->
                    <div class="form-group">
                        <span>Genres</span>
                        <label class="sr-only" for="grade">Genres</label>
                        <select name="genre[]" multiple="multiple" class="form-control selectpicker show-menu-arrow show-tick" id="grade" placeholder="Gatunek" data-size="7" data-max-options="2">
<!--                            <option data-content="<span class='label label-default'>All</span>">All</option>-->
                            <?php
                            if(isset($_GET['genre']))
                                $genre = $_GET['genre'];
                            else
                                $genre = "";
                            foreach($this->get('genres') as $row){
                                $g = $row['genre'];
                                if(@$genre[0] == $g || @$genre[1] == $g) {
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
                        <?php
                            if(isset($_GET['sort']))
                                $sort = $_GET['sort'];
                            else
                                $sort = "";
                        ?>
                        <span>Length movie (min)</span>
                        <input type="number" name="sort" style="display: block;" class="form-control selectpicker" id="sort" placeholder="Length movie (min)" value="<?php echo $sort; ?>">
                    </div>
                </div>
                <div class="form-inline">
                    <div class="form-group">
                        <button type="submit" style="margin-top: 10px;" class="btn btn-block"> Search </button>
                    </div>
                </div>
            </form>
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
            } else {
            echo "<div class=\"alert alert-warning text-center\"><strong><span class=\"glyphicon glyphicon-send\"></span> Cannot find any movie </strong></div>
";
        }
            ?>
        </div><!--/row-->

    </div><!--/row-->