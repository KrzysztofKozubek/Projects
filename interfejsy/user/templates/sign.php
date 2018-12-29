<?php
/**
 * Created by PhpStorm.
 * User: Krzysztof
 * Date: 2015-12-03
 * Time: 23:15
 */
$ip = 'http://' . $_SERVER ["SERVER_NAME"];
?>

<div class="row">
    <div class="col-md-6">
        <div id="logbox">
            <form id="signup" method="post" action="<?php echo "$ip/user/"; ?>">
                <h1>Sign in</h1>
                <input name="email" type="email" placeholder="Email" autofocus="autofocus" class="input pass" maxlength="50"/>
                <input name="password" type="password" placeholder="Password" required="required" class="input pass" maxlength="15"/>
                <input type="submit" value="Sign in!" class="inputButton"/>
            </form>
        </div>
    </div>

    <div class="col-md-6">
        <div id="logbox">
            <form id="signup" method="post" action="<?php echo "$ip/user/"; ?>">
                <h1>Create account</h1>
                <input name="name" type="text" placeholder="Name account" pattern="^[\w]{3,16}$" required="required" class="input pass" maxlength="15"/>
                <input name="password" type="password" placeholder="Password" required="required" class="input pass" maxlength="15"/>
                <input name="email" type="email" placeholder="Email" class="input pass" maxlength="50"/>
                <input name="age" type="number" placeholder="Age" class="input pass" max="120"/>
                <div class="radio">
                    <label>
                        <input type="radio" name="sex" id="0" value="0" checked>
                        Male
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="sex" id="1" value="1">
                        Female
                    </label>
                </div>
                <input type="submit" value="Create account!" class="inputButton"/>
            </form>
        </div>
    </div>
    <!--col-md-6-->
</div>