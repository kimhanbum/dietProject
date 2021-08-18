package dt.diet.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dt.diet.db.DietDAO;

public class DietReplyDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		DietDAO dao= new DietDAO();
		
		int result = dao.replyDelete(num);
		PrintWriter out =response.getWriter();
		out.print(result);
		return null;
	}
}

