<?php
/**
 * Created by PhpStorm.
 * User: RedHat
 * Date: 02.05.2017
 * Time: 20:38
 */

$data = $this->get('website');
$data['captcha'] = $this->get('captcha')[0];

echo <<< captcha

<div style="margin: 0px auto; background-color: #555; min-height: 30%; min-width: 20%; position: absolute; top: 40%;left: 40%;vertical-align: middle;">
    <p id="sec" style="margin: 0 auto; font-size: 25px; text-align: center; vertical-align: middle;"></p>
    
    <div id="captcha" style="display: none;">
        <p>captcha: find correct captcha: 
            <img src="../public/$data[captcha].png" style="height: 50px; width: 50px;" />
        </p>
        <img src="../public/1.png" style="height: 50px; width: 50px;" onClick="checkCaptcha('1', '$data[ID]');" />
        <img src="../public/2.png" style="height: 50px; width: 50px;" onClick="checkCaptcha('2', '$data[ID]');" />
        <img src="../public/3.png" style="height: 50px; width: 50px;" onClick="checkCaptcha('3', '$data[ID]');" />
        <img src="../public/4.png" style="height: 50px; width: 50px;" onClick="checkCaptcha('4', '$data[ID]');" />
    </div>
    
    <div id="result" style="display: none;">
        <p> You find good captcha, now you can continue surf </p>
        <a href="."> next surf </a>
    </div> 
</div>
<iframe src="$data[URL]" onload="this.width=screen.width;this.height=screen.height-(screen.height*25/100);" style="width:100%;border:none;overflow:auto;margin:0px;padding:0px;"></iframe>
captcha;


?>

<script type="text/javascript">

    function checkCaptcha(value, ad) {

        var http    = new XMLHttpRequest();
        var url     = "index.php";
        var params  = "idCaptcha=" + value + "&ad=" + ad;
        http.open("POST", url, true);
        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http.onreadystatechange = function() {
            if(http.readyState == 4 && http.status == 200) {
                if(http.responseText == "1") {
                    document.getElementById('captcha').style.display="none";
                    document.getElementById('result').style.display="block";
                }
            }
        };
        http.send(params);
    }


    var time = 15;
    function showCaptcha(div, time) {
        setTimeout(function(){ div.style.display="block"; }, time * 1e3);
    }
    showCaptcha(document.getElementById('captcha'), time);

    function counter(count, sec){
        count.innerHTML = sec;
        if(sec <= -1) count.innerHTML = "";
        if(sec >= 0) setTimeout(function () { counter(count, --sec); }, 1e3);
    }

    counter(document.getElementById('sec'), time);


</script>
