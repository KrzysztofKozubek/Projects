<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-05
 * Time: 01:26
 */
$ip = 'http://' . $_SERVER ["SERVER_NAME"];

$user       = $this->get('user');
$comments   = $this->get('comments');
$lists   = $this->get('list');
$friends    = $this->get('friends');
$isFriend   = $this->get('isFriend');
$isFriend   = $isFriend[0]['idFriend'];

?>

<div class="container">
    <?php if(isset($_GET['movie'])) echo "
    <div class=\"alert alert-info text-center\">
        <strong>
            <span class=\"glyphicon glyphicon-send\"></span>
            Movie was removed from your list</strong>
    </div>"; ?>
    <div class="row">

        <div class="jumbotron form-inline">

            <h3 class="title"><?php echo $user['name']; ?></h3>


            <div class="row">

                <div class="information well">
                    <div class="gratePremier ">
                        <p class="label-success">Name: <?php echo $user['name']; ?></p>
                        <p class="label-danger">Email: <?php echo $user['email']; ?></p>
                        <p class="label-warning">Age: <?php echo $user['age']; ?></p>
                        <?php
                        if(isset($_GET['id']))
                            if(empty($isFriend))
                                echo "<p class=\"label-info\">Add follow: <a href=\"$ip/user/?id=$_GET[id]&add\">Add</a></p>";
                            else
                                echo "<p class=\"label-info\">Remove follow: <a href=\"$ip/user/?id=$_GET[id]&remove\">Remove</a></p>";

                        ?>
                    </div>
                </div><!--/.col-xs-6.col-lg-4-->

            </div><!--/row-->


            <div class="bs-example">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#sectionA">Comment</a></li>
                    <li><a data-toggle="tab" href="#sectionB">Follows</a></li>
                    <li><a data-toggle="tab" href="#sectionC">List</a></li>
                </ul>
                <div class="tab-content">

                    <div id="sectionA" class="tab-pane fade in active">
                        <?php
                        if(!empty($comments)) {
                            ?>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Poster</th>
                                    <th>Movie</th>
                                    <th>Mark</th>
                                    <th>Comment</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach ($comments as $list) {
                                    $list['releaseDate'] = substr($list['releaseDate'], 0, 4);
                                    echo "<tr>
                                        <td><a href='$ip/?id=$list[id]'> <img src='$list[poster]' class='min-poster'/></a></a></td>
                                        <td><a href='$ip/?id=$list[id]'> $list[title]($list[releaseDate])</a><BR/>$list[genre]</a></td>
                                        <td>$list[mark]</td>
                                        <td>$list[description]</td>
                                        </tr>";
                                }
                                ?>
                                </tbody>
                            </table>
                            <?php
                        }else{
                            echo "<div class=\"alert alert-warning\"><strong><span class=\"glyphicon glyphicon-send\"></span> No comments movie</strong></div>";
                        }
                        ?>
                    </div>
                    <div id="sectionB" class="tab-pane fade">
                        <?php
                        if(!empty($friends)){
                            ?>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Age</th>
                                    <th>Email</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach($friends as $friend){
                                    echo "<tr>
                                        <td><a href='$ip/user/?id=$friend[id]'>$friend[name]</a></td>
                                        <td>$friend[age]</td>
                                        <td>$friend[email]</td>
                                        </tr>";
                                }
                                ?>
                                </tbody>
                            </table>
                            <?php
                        }else{
                            echo "<div class=\"alert alert-warning\"><strong><span class=\"glyphicon glyphicon-send\"></span> No follows</strong></div>";
                        }
                        //                        ?>
                    </div>
                    <div id="sectionC" class="tab-pane fade">
                        <?php
                        if(!empty($lists)) {
                            ?>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Poster</th>
                                    <th>Movie</th>
                                    <?php
                                    if(!isset($_GET['id'])) { echo "<th></th>"; }
                                    ?>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach ($lists as $list) {
                                    $list['releaseDate'] = substr($list['releaseDate'], 0, 4);
                                    echo "<tr>
                                        <td><a href='$ip/?id=$list[id]'> <img src='$list[poster]' class='min-poster'/></a></a></td>
                                        <td><a href='$ip/?id=$list[id]'> $list[title]($list[releaseDate])</a><BR/>$list[genre]</a></td>";
                                    if(!isset($_GET['id']))
                                        echo "
                                        <td><form method='POST'><input type='hidden' name='remove' value='1' />
                                        <input type='hidden' name='idUser' value='$_SESSION[id]' />
                                        <input type='hidden' name='idMovie' value='$list[id]'/>
                                        <button type='submit' value='remove movie'> <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span> </button></form> </td>";
                                    echo "</tr>";
                                }
                                ?>
                                </tbody>
                            </table>
                            <?php
                        }else{
                            echo "<div class=\"alert alert-warning\"><strong><span class=\"glyphicon glyphicon-send\"></span> No movie in list </strong></div>";
                        }
                        ?>
                    </div>
                </div>
            </div>



        </div>
    </div><!--/row-->
