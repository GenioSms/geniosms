<?php
/*
#
# ipn.php
# GenioSms
# Instant process notification
# Code
#
########################## README ######################
# 
# for status_code see link
# https://geniosms.net/?a=site&b=guide&c=api#status_code 
#
# param status              (RESULT_OK, RESULT_ERROR, ipn_type event status)
# param status_code         (SEE status_code NOTE UP)
# param id_smsout           (ID SMS)             
# param request_code        (NOT IMPORTANT FOR YOU)
# param pin                 (DEVICE PIN)
# param custom              (YOUR CUSTOM DATA)
# param ipn_type            (SENT, DELIVERY)
# param from                (MESSAGE SENT FROM)
# param to                  (MESSAGE SENT TO)
# param msg                 (SMS TEXT MESSAGE SENT)
#
# 1 Copy all code
#
# 2 Save code as ipn.php
#
# 3 Put script into your site
# 
# 4 Create ipn
# 
# 5 insert url into ipn and save
#
# https://yourdomain.com/ipn.php 
#
# http ipn param return example
#
# status=RESULT_OK&status_code=-1&id_smsout=ID&request_code=RC&pin=PIN&custom=CUSTOM&ipn_type=DELIVERY&to=TO&from=FROM0&msg=MESSAGE
#
#########################################################

header('Access-Control-Allow-Origin: *');

$status         = $_POST['status'];
$status_code    = $_POST['status_code'];
$id_smsout      = $_POST['id_smsout'];
$request_code   = $_POST['request_code'];
$pin            = $_POST['pin'];
$custom         = $_POST['custom'];
$ipn_type       = $_POST['ipn_type'];
$to             = $_POST['to'];
$from           = $_POST['from'];
$msg            = $_POST['msg'];

/*
foreach($_REQUEST as $key=>$value)
{
  echo "$key=$value";
}*/


$all="status=$status status_code=$status_code id_smsout=$id_smsout request_code=$request_code pin=$pin custom=$custom ipn_type=$ipn_type to=$to from=$from msg=$msg\n";

echo "$all";
$file = 'log.txt';
file_put_contents($file, $all, FILE_APPEND | LOCK_EX);
?>
