<?php
/*
#
# sendSms.php
# GenioSms
# Api
# Code
#
########################## README ######################
# 
# call this on your browser OR Ajax script
#
# param to (phone number)
# param msg (sms message)
# param custom (your data param custom)
#
# 1 Copy all code
#
# 2 Save code as sendSms.php
#
# 3 Put script into your site
# 
# 4 Call script url
#
# https://yourdomain.com/sendSms.php?to=NUMBER&custom=CUSTOM&msg=MESSAGE 
#
# Note: CUSTOM is your personal parameter
#########################################################
*/
$to=$_GET["to"];
$msg=$_GET["msg"];
$api_key="<API_KEY>";
//get api key from geniosms.net

function sendSms($to, $msg, $api_key) {
  $url="https://geniosms.net/tools/api.pl?to="+$to+"&msg="+$msg+"&api="+$api_key;
  $ch = curl_init();
  $timeout = 15;
  curl_setopt($ch, CURLOPT_URL, $url);
  curl_setopt($ch, CURLOPT_USERAGENT, "GenioSmsBot/1.0 (+http://api.geniosms.net)");
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,false);
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,false);
  curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
  curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
  $data = curl_exec($ch);
  curl_close($ch);
  return $data;
}
$result = sendSms($to, $msg, $api_key);
echo $result;
?>  
