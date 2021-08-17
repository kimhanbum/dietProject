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

import _comm.javabean.DietInfo;
import dt.diet.db.DietDAO;

public class DietDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DietDAO dietdao = new DietDAO();
		JsonObject object= null;
		JsonArray jArray =null;
		JsonElement je = null;
		String dcode = request.getParameter("dcode");
		int state =Integer.parseInt(request.getParameter("state"));
		System.out.println("state: " + state + " dcode:" + dcode );
		//1.특정 식단 상세보기 정보 가져오기(식단 상세 정보)
		object=dietdao.getDetail(dcode);
		
		if(object==null) {
			System.out.println("식단 정보 가져오기 실패");
			ActionForward forward =new ActionForward();
			request.setAttribute("message","식단 데이터를 읽지 못했습니다.");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		
		System.out.println("식단 정보 가져오기 완료");
		
		
		//2.식단의 구성 음식 정보를 찾는다.
		String foods =object.get("diet_form").getAsString();
		System.out.println("foods : " + foods);
		jArray = dietdao.getFoodDetail(foods);
		je = new Gson().toJsonTree(jArray);
		object.add("foodlist", je);
		
		//3.식단의 댓글 정보를 찾는다.
		jArray = dietdao.getCommentList(dcode,state);
		je = new Gson().toJsonTree(jArray);
		object.add("commentlist", je);
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(object.toString());
	    System.out.println(object.toString());
	    return null;	
	}
}

