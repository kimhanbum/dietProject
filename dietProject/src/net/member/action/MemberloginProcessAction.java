package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberloginProcessAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		MemberDAO dao = new MemberDAO();
		int result = dao.isId(id, pass);
		System.out.println("결과는 " + result);
		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);

			String IDStore = request.getParameter("remember");
			System.out.println("아이디 체크 값 :" + IDStore);
			Cookie cookie = new Cookie("id", id);
			if (IDStore != null && IDStore.contentEquals("store")) {
				cookie.setMaxAge(2*60);
				response.addCookie(cookie);

			} else {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			forward.setRedirect(true);
			forward.setPath("main.net");

			return forward;

		} else {
			String message = "비밀번호가 일치 하지 않습니다.";
			if (result == -1) {
				message = "일치하는 아이디가 없습니다.";
			}
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "')");
			out.println("location.href='login.net'");
			out.println("</script>");
			out.close();

			return null;

		}

	}
}
