package cf.config.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import cf.config.db.ConfigDAO;


public class CfDietAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ConfigDAO configdao = new ConfigDAO();
		JsonObject object= null;
		
		int foodCode = Integer.parseInt(request.getParameter("foodCode"));
		System.out.println("foodCode: " + foodCode);
		
		//식자재 1개의 정보를 가져옵니다.
		object=configdao.getFoodInfo(foodCode);
		
		if(object==null) {
			System.out.println("음식정보 가져오기 실패");
			ActionForward forward =new ActionForward();
			request.setAttribute("message","음식정보 가져오기 실패하였습니다.");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(object.toString());
	    System.out.println(object.toString());
	    return null;	
	}
}

