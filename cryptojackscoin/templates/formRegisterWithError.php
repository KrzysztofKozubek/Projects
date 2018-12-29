<?php

$data['id']         = $this->get('idSponsor');
$data['username']   = $this->get('username');
$data['email']      = $this->get('email');
$data['wallet']     = $this->get('wallet');
$data['country']    = $this->get('country');
$data['error']      = $this->get('error');

echo "<h2> ERROR: $data[error] </h2>";

echo <<< FORM_REGISTER
<form id="signup" method="post" action="../registration/">
    <h1>Create new account</h1>
    <input name="id"        type="hidden"   placeholder="id Sponsor"                                required="required" class="" minlength="1"                  value="$data[id]"       />
    <input name="username"  type="text"     placeholder="Username"          pattern="^[\w]{3,15}$"  required="required" class="" minlength="3"  maxlength="15"  value="$data[username]" />
    <input name="email"     type="email"    placeholder="Email address"                             required="required" class="" minlength="6"  maxlength="256" value="$data[email]"    />
    <input name="password"  type="password" placeholder="Password"                                  required="required" class="" minlength="8"  maxlength="20"  value=""                />
    <input name="wallet"    type="text"     placeholder="Address wallet"                            required="required" class="" minlength="27" maxlength="34"  value="$data[wallet]"   />
    
    <select name="country">
		<option value="1">Polska        </option>
		<option value="2">Deutschland   </option>
		<option value="3">Other         </option>
	</select>
    
    <input type="submit"    value="Create new account!" class=""/>
</form>
FORM_REGISTER;
