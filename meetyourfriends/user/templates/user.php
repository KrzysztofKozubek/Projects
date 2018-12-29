<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-05
 * Time: 01:26
 */
$ip = 'http://' . $_SERVER ["SERVER_NAME"];

//$user       = $this->get('user');
//$comments   = $this->get('comments');
//$friends    = $this->get('friends');
//$isFriend   = $this->get('isFriend');
//$isFriend   = $isFriend[0]['idFriend'];

?>

<form id="logout" method="post" action="<?php echo "$ip/user/"; ?>">
    <input name="logout" type="hidden" placeholder="logout" maxlength="1"/>
    <input type="submit" value="Login out!" class="inputButton"/>
</form>