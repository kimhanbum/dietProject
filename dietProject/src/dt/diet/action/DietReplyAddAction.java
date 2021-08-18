package dt.diet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _comm.javabean.DietReply;
import dt.diet.db.DietDAO;

public class DietReplyAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DietDAO dao = new DietDAO();
		
		DietReply dr = new DietReply();
		dr.setId(request.getParameter("id"));
		dr.setDiet_code(request.getParameter("diet_code"));
		dr.setDiet_re_content(request.getParameter("content"));
		dr.setDiet_re_seq(1);
		System.out.println("content = " + dr.getDiet_re_content());
		int ok = dao.replyInsert(dr);
		response.getWriter().print(ok);
		return null;
	}
}

