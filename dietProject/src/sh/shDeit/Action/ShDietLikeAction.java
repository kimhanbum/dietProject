package sh.shDeit.Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sh.shDeit.db.ShDietDAO;

public class ShDietLikeAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShDietDAO shdietdao = new ShDietDAO();
		String likeCode = request.getParameter("likeCode");
		System.out.println("likeCode : " + likeCode);
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id"); 
		System.out.println("userId : " + userId);
		
		if(userId == null) {
			System.out.println("미로그인상태");
			return null;
		}
		int result = shdietdao.shareDietAddLike(likeCode,userId);

		System.out.println("like ajax json :" + result);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	    return null;	
	}
}

