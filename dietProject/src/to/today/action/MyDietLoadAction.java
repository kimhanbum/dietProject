package to.today.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class MyDietLoadAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JsonArray array = new JsonArray();
		JsonObject object = new JsonObject();
		System.out.println(request.getParameter("curentMonth"));
		
		object.addProperty("title", "morning");
		object.addProperty("start", "2021-08-12");
		object.addProperty("end", "2021-08-12");
		array.add(object);
		
		object = new JsonObject();
		object.addProperty("title", "evening");
		object.addProperty("start", "2021-08-14");
		object.addProperty("end", "2021-08-14");
		array.add(object);
		
		object = new JsonObject();
		object.addProperty("title", "night");
		object.addProperty("start", "2021-08-15");
		object.addProperty("end", "2021-08-15");
		array.add(object);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(array);
	    System.out.println(array);
	    return null;	

	}
}

