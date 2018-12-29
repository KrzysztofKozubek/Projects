<?php

echo <<< FORM_REGISTER
<form id="signup" method="post" action="">
    <h1>Create new account</h1>
    <input name="username"  type="text"     placeholder="Username"          pattern="^[\w]{3,15}$"  required="required" class="" minlength="3"  maxlength="15"  value="" />
    <input name="email"     type="email"    placeholder="Email address"                             required="required" class="" minlength="6"  maxlength="256" value="" />
    <input name="password"  type="password" placeholder="Password"                                  required="required" class="" minlength="8"  maxlength="20"  value="" />
    <input name="wallet"    type="text"     placeholder="Address wallet"                            required="required" class="" minlength="27" maxlength="34"  value="" />
    
    <select name="country">
		<option value="1">Poland        </option>
		<option value="2">Deutschland   </option>
		<option value="3">Other         </option>
	</select>
    
    <input type="submit"    value="Create new account!" class=""/>
</form>
FORM_REGISTER;
