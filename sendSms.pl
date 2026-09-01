#!/usr/bin/perl
#
# sendSms.pl
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
# 2 Save code as sendSms.pl
#
# 3 Put script into your site
# 
# 4 Call script url
#
# https://yourdomain.com/sendSms.pl?to=NUMBER&custom=CUSTOM&msg=MESSAGE 
#
# Note: CUSTOM is your personal parameter
#########################################################
$api_key="<api_key>";
#get api key from geniosms.net
print "Content-type: text/html\n\n";
use LWP;
use CGI;
$q=new CGI;
$to="";
$msg="";
$to=$q->param("to");
$msg=$q->param("msg");
if (($to ne "") && ($msg ne ""))
    {
      getResponse();
    }
sub getResponse{
use LWP::UserAgent;
$html="";
@codice=();
$cod="";
$url="https://geniosms.net/tools/api.pl?to=$to&msg=$msg&api=$api_key";
$agent = new LWP::UserAgent;
$agent->timeout(20);
$agent->agent('GenioSmsBot/1.0 (+http://api.geniosms.net)');
$request = new HTTP::Request('GET', $url);
$request->content_encoding("UTF-8");
$response=$agent->request($request);
@codice=$response->content;
$html="@codice";
print $html;
}
