using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
/*
#
# GenioApi.cs
# GenioSms
# Api
# Code
#
########################## README ######################
# 
# use c# lib to call api url
#
# param to (phone number)
# param msg (sms message)
# param custom (your data param custom)
#
# call method to send
#
# POST method sendSmsPost(TO,MSG);
#
# 1 Copy all code
#
# 2 Open Visual Studio ide and paste code in Program.cs
#
# 3 Compile code
# 
# 4 Run 
#
#########################################################
*/
//GET API KEY FROM GENIOSMS.NET
namespace GenioApi
{
    class Program
    {
      
static String API_KEY = "<API_KEY>";
        static void Main(string[] args)
        {
            WebClient client = new WebClient();
            client.Encoding = System.Text.Encoding.UTF8;
            client.Headers.Add("Content-Type", "application/x-www-form-urlencoded");
            client.Headers.Add("user-agent", "GenioSmsBot/1.0 (+http://api.geniosms.net)");
            String msg = "Test Genio Api";
            String to="NUMBER";
            String param = "to=" + to + "&msg=" + msg +"&api=" + API_KEY;
            String response = client.UploadString("https://geniosms.net/tools/api.pl", "POST", param);
            Console.WriteLine(response);
            Console.ReadLine();
        }

    }
}
