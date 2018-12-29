<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-03
 * Time: 23:15
 */
$ip = 'http://' . $_SERVER ["SERVER_NAME"];
$name       = $this->name;
$age        = $this->age;
$email      = $this->email;
$error      = $this->error;
?>

<div class="alert alert-danger text-center"><strong><span class="glyphicon glyphicon-send"></span> Failed to create account. Reason: <?php echo $error; ?> Try again :)</strong></div>
<div class="row">
    <div class="col-md-6">
        <div id="logbox">
            <form id="signup" method="post" action="<?php echo "$ip/user/"; ?>">
                <h1>Zaloguj się</h1>
                <input name="email" type="email" placeholder="wpisz email" autofocus="autofocus" class="input pass" maxlength="50"/>
                <input name="password" type="password" placeholder="wpisz hasło" required="required" class="input pass" maxlength="15"/>
                <input type="submit" value="Zaloguj mnie!" class="inputButton"/>
            </form>
        </div>
    </div>

    <div class="col-md-6">
        <div id="logbox">
            <form id="signup" method="post" action="<?php echo "$ip/user/"; ?>">
                <h1>Utwórz nowe konto</h1>
                <input name="name" value="<?php echo "$name"; ?>" type="text" placeholder="Wybierz nazwę konta" pattern="^[\w]{3,16}$" required="required" class="input pass" maxlength="15"/>
                <input name="password" type="password" placeholder="Wybierz hasło" required="required" class="input pass" maxlength="15"/>
                <input name="email" value="<?php echo "$email"; ?>" type="email" placeholder="Email adres" class="input pass" maxlength="50"/>
                <input name="age" value="<?php echo "$age"; ?>" type="number" placeholder="Podaj wiek" class="input pass" max="120"/>
                <div class="radio">
                    <label>
                        <input type="radio" name="sex" id="0" value="0" checked>
                        Jestem meżczyzną
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="sex" id="1" value="1">
                        Jestem kobietą
                    </label>
                </div>
                <input type="submit" value="Utwórz nowe konto!" class="inputButton"/>
            </form>
        </div>
    </div>
    <!--col-md-6-->
</div>