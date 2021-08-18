package to.today.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TodayMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // 포워딩 방식으로 주소가 바뀌지 않아요
		forward.setPath("mypage/mypage_main.jsp");
		return forward;
		//My페이지 메인화면
		
	}

}
