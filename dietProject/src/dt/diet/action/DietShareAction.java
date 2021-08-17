package dt.diet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import dt.diet.db.DietDAO;

public class DietShareAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DietDAO dietdao = new DietDAO();
		String dietCode = request.getParameter("dcode");
		int  dietShare =  Integer.parseInt(request.getParameter("share"));
		System.out.println("dietCode : " + dietCode);
		System.out.println("dietShare : " + dietShare);
		
		boolean result = dietdao.dietShare(dietCode,dietShare);
		if(result==false) {
			System.out.println("식단 공유 설정 실패");
			ActionForward forward =new ActionForward();
			request.setAttribute("message","식단 공유에 실패하였습니다.");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("ajax json");
		//위의 request로 담았던 것을 JsonObejct에 담습니다.
		JsonObject object = new JsonObject();
		object.addProperty("result", result);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append(object.toString());
		System.out.println(object.toString());
		return null;
	}
}

