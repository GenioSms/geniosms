import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/*
#
# Main.java
# GenioSms
# Api
# Code
#
########################## README ######################
# 
# use java lib to call api url
#
# param to (phone number)
# param msg (sms message)
# param custom (your data param custom)
#
# call method to send
#
# GET method sendSmsGet(TO,MSG);
#
# POST method sendSmsPost(TO,MSG);
#
# 1 Copy all code
#
# 2 Open java ide and paste code in Main.java
#
# 3 Compile code
# 
# 4 Run java
#
#########################################################
*/
//GET API KEY FROM GENIOSMS.NET
public class Main {
private static final String API_KEY = "<API_KEY>";
private static final String USER_AGENT = "GenioSmsBot/1.0 (+http://api.geniosms.net)";	

	private static String GET_URL = "https://geniosms.net/tools/api.pl";

	private static final String POST_URL = "https://geniosms.net/tools/api.pl";	

	public static void main(String[] args) throws IOException{
		/*		
		#TODO Auto-generated method stub
		#sendSmsPost("NUMBER","Test api Genio");
		#System.out.println("POST DONE");
		*/		

		sendSmsGet("NUMBER","Test Genio Api");
		System.out.println("GET DONE");
	}
	
	private static void sendSmsGet(String to, String _msg) throws IOException {
		String msg=_msg.replace(" ", "%20");
		GET_URL = GET_URL + "?to=" + to + "&msg="+msg+"&api="+API_KEY;
		//System.out.println("GET URL " + GET_URL);
		URL obj = new URL(GET_URL);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", USER_AGENT);
		int responseCode = con.getResponseCode();
		System.out.println("GET Response Code :: " + responseCode);
		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			// print result
			System.out.println(response.toString());
		} else {
			System.out.println("GET request did not work.");
		}

	}
	
	private static void sendSmsPost(String to, String msg) throws IOException {
		String POST_PARAMS = "to=" + to + "&msg="+msg+"&api="+API_KEY;
		URL obj = new URL(POST_URL);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);

		// For POST only - START
		con.setDoOutput(true);
		OutputStream os = con.getOutputStream();
		os.write(POST_PARAMS.getBytes());
		os.flush();
		os.close();
		// For POST only - END

		int responseCode = con.getResponseCode();
		System.out.println("POST Response Code :: " + responseCode);

		if (responseCode == HttpURLConnection.HTTP_OK) { //success
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			// print result
			System.out.println(response.toString());
		} else {
			System.out.println("POST request did not work.");
		}
	}

} 
