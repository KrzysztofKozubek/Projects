<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-02
 * Time: 12:21
 */
$ip = 'http://' . $_SERVER ["SERVER_NAME"];

$person      = $this->get('person');
$beActor     = $this->get('beActor');
$beCreator   = $this->get('beCreator');
$awards      = $this->get('awards');

$person     = $person[0];
?>


<div class="container">

    <div class="row">

        <div class="jumbotron form-inline">

            <h3 class="title"><?php echo $person['name']; ?></h3>


            <div class="row">

                <div class="information well">
                    <div class="col-lg-2">
                        <div style="background-image:url(<?php echo $person['photo']; ?>);" class="poster lazy"></div>
                    </div>
                    <div class="gratePremier ">
                        <p class="label-success">Full name: <?php echo $person['name']; ?></p>
                        <p class="label-danger">Date born: <?php echo $person['dateOfBirth']; ?></p>
                    </div>
                </div><!--/.col-xs-6.col-lg-4-->

            </div><!--/row-->

            <div class="bs-example">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#sectionA">Movies in which played</a></li>
                    <li><a data-toggle="tab" href="#sectionB">Movies that created</a></li>
                    <li><a data-toggle="tab" href="#sectionC">Awords</a></li>
                </ul>
                <div class="tab-content">
                    <div id="sectionA" class="tab-pane fade in active">
                        <?php
                        if(!empty($beActor)) {
                            ?>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Poster</th>
                                    <th>Title movie</th>
                                    <th>Character in the movie</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach ($beActor as $actor) {
                                    $actor['releaseDate'] = substr($actor['releaseDate'], 0, 4);
                                    echo "<tr>
                                        <td><a href='$ip/?id=$actor[id]'><img src='$actor[poster]' class='min-poster lazy'/></a></td>
                                        <td><a href='$ip/?id=$actor[id]'>$actor[title] ($actor[releaseDate])</a><BR/>$actor[genre]</td>
                                        <td>$actor[participation]</td>
                                        </tr>";
                                }
                                ?>
                                </tbody>
                            </table>
                            <?php
                        }else{
                            echo "<div class=\"alert alert-warning\"><strong><span class=\"glyphicon glyphicon-send\"></span> No movie where actor played.</strong></div>";
                        }
                        ?>
                    </div>
                    <div id="sectionB" class="tab-pane fade">
                        <?php
                        if(!empty($beCreator)){
                            ?>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Poster</th>
                                    <th>Title movie</th>
                                    <th>Create in movie</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach($beCreator as $creator){
                                    echo "<tr>
                                        <td><a href='$ip/?id=$creator[id]'><img src='$creator[poster]' class='min-poster lazy'/></a></td>
                                        <td><a href='$ip/?id=$creator[id]'>$creator[title] ($creator[releaseDate])</a><BR/>$creator[genre]</a></td>
                                        <td>$creator[participation]</td>
                                        </tr>";
                                }
                                ?>
                                </tbody>
                            </table>
                            <?php
                        }else{
                            echo "<div class=\"alert alert-warning\"><strong><span class=\"glyphicon glyphicon-send\"></span> No movie where create in movies.</strong></div>";
                        }
                        ?>
                    </div>
                    <div id="sectionC" class="tab-pane fade">
                        <?php
                        if(!empty($awards)){
                            ?>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Year</th>
                                    <th>Category</th>
                                    <th>Description</th>
                                    <th>Won?</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach($awards as $award){
                                    echo "<tr>
                                        <td>$award[date]</td>
                                        <td>$award[description]</td>";
                                    if(!empty($award['idMovie']))
                                        echo "<td><a href='$ip/?id=$award[idMovie]'>$award[info]</a></td>";
                                    else
                                        echo "<td>$award[info]</td>";
                                        echo "<td>$award[won]</td>
                                        </tr>";
                                }
                                ?>
                                </tbody>
                            </table>
                            <?php
                        }else{
                            echo "<div class=\"alert alert-warning\"><strong><span class=\"glyphicon glyphicon-send\"></span> No awards. </strong></div>";
                        }
                        ?>
                    </div>
                </div>
            </div>



        </div>
    </div><!--/row-->
