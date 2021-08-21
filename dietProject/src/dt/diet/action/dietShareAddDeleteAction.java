package dt.diet.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dt.diet.db.DietDAO;

public class dietShareAddDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean result = false;
		DietDAO dietdao = new DietDAO();
		
		String dcode = request.getParameter("dcode");
		System.out.println("dcode:" + dcode);
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id"); 
		System.out.println("userId : " + userId);
		
		result = dietdao.DietShareAddDelete(dcode,userId);
		if(result==false) {
			System.out.println("담은 식단 제거 실패");
			ActionForward forward =new ActionForward();
			request.setAttribute("message","담은 식단 제거 실패");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("담은 식단 제거 완료");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('해당 식단의 담기를 취소했습니다.')");
		out.println("location.href='dietShareAddpage.dt';");
		out.println("</script>");
		out.close();
		return null;
	}
}

