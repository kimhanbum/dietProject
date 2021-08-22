package to.today.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;


public class MyDietAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward =new ActionForward();
		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("id");
		
		if(id==null) {
			
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out= response.getWriter();
		   out.println("<script>");
		   out.println("alert('로그인을 해주세요')");
		   out.println("location.href='login.net'");
		   out.println("</script>");
		   out.close();
		   return null;
		}
		request.setAttribute("id", id);
		
		forward.setRedirect(false);
		forward.setPath("navi/navi_myDiet.jsp");
		return forward;
	}
}

