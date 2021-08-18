package dt.diet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dt.diet.db.DietDAO;

public class DietReplyUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DietDAO dietdao = new DietDAO();
		
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));

		System.out.println("content = " + content);
		System.out.println("num = " + num);
		int ok = dietdao.replyUpdate(num,content);
		response.getWriter().print(ok);
		return null;
	}
}

