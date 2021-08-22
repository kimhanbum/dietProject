package to.today.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import to.today.db.TodayDAO;

public class TodayDietBottomProcessAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		TodayDAO tdao = new TodayDAO();
		
		String code = request.getParameter("code");
		System.out.println("code: " + code);
		
		String mealtype = request.getParameter("mealtype");
		System.out.println("mealtype: " + mealtype);
		
		//세션에서 id를 가져옵니다.
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id"); 
		System.out.println("sessionid: " + userId);
		

		int result= tdao.setTotalInfo(userId,code,mealtype);
		System.out.println("result :" + result);
		if(result==0) {
			System.out.println(mealtype+"넣기에 실패했습니다.");
			ActionForward forward =new ActionForward();
			request.setAttribute("message",mealtype+" 넣기에 실패했습니다.");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	    return null;
	}
}

