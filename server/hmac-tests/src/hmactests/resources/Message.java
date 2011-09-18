package hmactests.resources;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.FormParam;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import util.HMAC;

import com.google.appengine.repackaged.org.json.JSONArray;
import com.google.appengine.repackaged.org.json.JSONException;
import com.google.appengine.repackaged.org.json.JSONObject;

@Path("/message")
public class Message {
	@GET
	@Produces("text/plain")
	public String sayHello() {
		return "Hello";
	}
	
	@POST
	@Path("/form")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public Response body(@FormParam("hash") String hash, @FormParam("message") String message) throws JSONException {	
		int success = 0;
		if (HMAC.buildHmacSignature("key", message) .equals(hash)) {
			success = 1;
		}
		String json = new String("{\"success\":\""+success+"\"}");
		return Response.ok(json, MediaType.APPLICATION_JSON).build();
	}
	
	@POST
	@Path("/post")
	@Consumes("application/json")
	@Produces("application/json")
	public Response post(String post, @HeaderParam("hash") String hash) throws JSONException {	
		int success = 0;
		if (HMAC.buildHmacSignature("key", post) .equals(hash)) {
			success = 1;
		}
		String json = new String("{\"success\":\""+success+"\"}");
		return Response.ok(json, MediaType.APPLICATION_JSON).build();
	}
	
	@GET
	@Path("/form")
	@Produces("application/json")
	public Response getForm() throws JSONException {
		String json = new String("{\"success\":\"0\",\"message\":\"must be a post\"}");
		return Response.ok(json, MediaType.APPLICATION_JSON).build();
	}
}
