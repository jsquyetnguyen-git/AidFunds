package common;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import model.GoogleAcc;

public class GetGoogleAcc {
	static final String GOOGLE_CLIENT_ID = "774473712465-1iaa9njkci33sfnh56j0k57q73gjqc0u.apps.googleusercontent.com";
	static final String GOOGLE_CLIENT_SECRET = "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";
	static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/Donate/GoogleLoginController";
	static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	static final String GOOGLE_GRANT_TYPE = "authorization_code";
	
	public String getToken(final String code) throws ClientProtocolException, IOException {
		String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
						.add("client_secret", GOOGLE_CLIENT_SECRET)
						.add("redirect_uri",GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

	    JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
	    String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
	    return accessToken;
	}

	public GoogleAcc getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();
		GoogleAcc googleAcc = new Gson().fromJson(response, GoogleAcc.class);
		return googleAcc;
	}
}
