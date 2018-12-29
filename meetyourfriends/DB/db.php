<?php
/**
 * Created by PhpStorm.
 * User: Kriss
 * Date: 29.03.2017
 * Time: 22:49
 */

function getPDO() {
    try {
        require '../config/sql.php';
        $pdo = new PDO('mysql:host='.$host.';dbname='.$dbase, $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    }
    catch(DBException $e) {
        echo 'The connect can not create: ' . $e->getMessage();
    }
}

function resultQuestion($sql){

    $pdo = getPDO();
    $pdo->query('SET NAMES utf8');
    $select = $pdo->query($sql);
    $data = null;
    foreach ($select as $row) {
        $data[] = $row;
    }
    $select->closeCursor();

    return $data;
}

$sql    = "SELECT * FROM `person`";
$result = resultQuestion($sql);

echo "
<br><br>
PERSON
<br><br>
";
print_r($result);


$sql    = "SELECT * FROM `circle`";
$result = resultQuestion($sql);

echo "
<br><br>
circle
<br><br>
";
print_r($result);


$sql    = "SELECT * FROM `friend`";
$result = resultQuestion($sql);

echo "
<br><br>
friend
<br><br>
";
print_r($result);


$sql    = "SELECT * FROM `friendcircle`";
$result = resultQuestion($sql);

echo "
<br><br>
friendcircle
<br><br>
";
print_r($result);


$sql    = "SELECT * FROM `likes`";
$result = resultQuestion($sql);

echo "
<br><br>
likes
<br><br>
";
print_r($result);


$sql    = "SELECT * FROM `login`";
$result = resultQuestion($sql);

echo "
<br><br>
login
<br><br>
";
print_r($result);


$sql    = "SELECT * FROM `timeline`";
$result = resultQuestion($sql);

echo "
<br><br>
timeline
<br><br>
";
print_r($result);


$sql    = "SELECT * FROM `user`";
$result = resultQuestion($sql);

echo "
<br><br>
user
<br><br>
";
print_r($result);