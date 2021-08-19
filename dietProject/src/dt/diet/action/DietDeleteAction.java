package dt.diet.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dt.diet.db.DietDAO;

public class DietDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean result = false;
		DietDAO dietdao = new DietDAO();
		
		String dcode = request.getParameter("dcode");
		System.out.println("dcode:" + dcode);
		result = dietdao.DietDelete(dcode);
		if(result==false) {
			System.out.println("식단 삭제 실패");
			ActionForward forward =new ActionForward();
			request.setAttribute("message","식단 삭제에 실패했습니다.");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("식단 삭제 완료");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('해당 식단의 삭제가 완료 되었습니다.')");
		out.println("location.href='dietpage.dt';");
		out.println("</script>");
		out.close();
		return null;
	}
}

