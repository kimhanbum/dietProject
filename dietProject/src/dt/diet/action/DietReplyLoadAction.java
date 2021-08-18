package dt.diet.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import dt.diet.db.DietDAO;

public class DietReplyLoadAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DietDAO dao= new DietDAO();
		
		String reply_dietCode = request.getParameter("reply_dietCode");
		System.out.println(reply_dietCode);
		int state =Integer.parseInt(request.getParameter("state"));
		
		JsonObject object = new JsonObject();
		JsonArray jArray = dao.getReplyList(reply_dietCode,state);
		JsonElement je = new Gson().toJsonTree(jArray);
		object.add("commentlist", je);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(object.toString());
	    System.out.println(object.toString());
	    return null;	
	}
}

