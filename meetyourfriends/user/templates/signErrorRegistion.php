<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-03
 * Time: 23:15
 */
$ip = 'http://' . $_SERVER ["SERVER_NAME"];
$name       = $this->name;
$surname    = $this->surname;
$birthdate  = $this->birthdate;
$email      = $this->email;
$error      = $this->error;
echo $name . " " . $surname . " " . $birthdate . " " . $email . " " . $error;
?>

<div class="row">
    <div class="col-md-6">
        <div id="logbox">
            <form id="signup" method="post" action="<?php echo "$ip/user/"; ?>">
                <h1>Zaloguj się</h1>
                <input name="email"     type="email"    placeholder="Email"         required="required"  class="input pass" maxlength="50"/>
                <input name="password"  type="password" placeholder="Wybierz hasło" required="required"  class="input pass" maxlength="15"/>
                <input                  type="submit"   value="Sign in!"                                 class="inputButton"/>
            </form>
        </div>
    </div>

    <div class="col-md-6">
        <div id="logbox">
            <form id="signup" method="post" action="<?php echo "$ip/user/"; ?>">
                <h1>Utwórz nowe konto</h1>
                <input name="name"      type="text"     placeholder="Name"          pattern="^[\w]{3,16}$"  required="required" class="input pass" maxlength="25"       value="<?php echo "$name"; ?>"/>
                <input name="surname"   type="text"     placeholder="Surname"       pattern="^[\w]{3,16}$"  required="required" class="input pass" maxlength="25"       value="<?php echo "$surname"; ?>"/>
                <input name="birthdate" type="date"     placeholder="birth date"                            required="required" class="input pass" max="2016-12-31" min="1920-01-01"    value="<?php echo "$birthdate"; ?>"/>
                <input name="email"     type="email"    placeholder="Email address"                                             class="input pass" maxlength="50"       value="<?php echo "$email"; ?>"/>
                <input name="password"  type="password" placeholder="Password"                              required="required" class="input pass" maxlength="15"/>
                <input type="submit"    value="Create new account!" class="inputButton"/>
            </form>
        </div>
    </div>
    <!--col-md-6-->
</div>