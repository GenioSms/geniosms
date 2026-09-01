#!/usr/bin/perl
#
# ipn.pl
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
# 2 Save code as ipn.pl
#
# 3 Put script into your site
# 
# 4 Create ipn
# 
# 5 insert url into ipn and save
#
# https://yourdomain.com/ipn.pl 
#
# 6 chmod 755 ipn.pl
#
# http ipn param return example
#
# status=RESULT_OK&status_code=-1&id_smsout=ID&request_code=RC&pin=PIN&custom=CUSTOM&ipn_type=DELIVERY&to=TO&from=FROM0&msg=MESSAGE
#
#########################################################
#!/usr/bin/perl
#print "User-Agent: Perl-IPN-VerificationScript\n";
#print "Access-Control-Allow-Origin:*\n";
use CGI;
$q=new CGI;
$status=$q->param("status");
$status_code=$q->param("status_code");
$id_smsout=$q->param("id_smsout");
$request_code=$q->param("request_code");
$pin=$q->param("pin");
$custom=$q->param("custom");
$ipn_type=$q->param("ipn_type");
$to=$q->param("to");
$from=$q->param("from");
$msg=$q->param("msg");

$path=$ENV{'CONTEXT_DOCUMENT_ROOT'}."/ipn/ipn_query_received.log";

$all="status=$status status_code=$status_code id_smsout=$id_smsout request_code=$request_code pin=$pin custom=$custom ipn_type=$ipn_type to=$to from=$from msg=$msg\n";

open (ADV, ">>$path");
print ADV "$all\n";
close (ADV);

print "Content-type:text/html\n\n";

print "$all";
