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
			System.out.println("�Ĵ� ���� ����");
			ActionForward forward =new ActionForward();
			request.setAttribute("message","�Ĵ��� ���� ���� ���߽��ϴ�..");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("�Ĵ� ���� ����");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('�Ĵ��� ���� �Ǿ����ϴ�.');");
		out.println("location.href='dietpage.dt';");
		out.println("</script>");
		out.close();
		return null;
	}
}

