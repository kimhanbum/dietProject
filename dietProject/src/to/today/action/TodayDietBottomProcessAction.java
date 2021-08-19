package to.today.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TodayDietBottomProcessAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		/*
		 * if() { out.println("alert('상세 식단 정보가 저장되었습니다.');");
		 * out.println("location.href='dietDetail.to';"); }else {
		 * out.println("alert('상세 식단 정보가 저장에 실패하였습니다.);");
		 * out.println("history.back();"); }out.close();
		 */
		
		
		
		ActionForward forward =new ActionForward();
		forward.setRedirect(false);
		forward.setPath("");
		return forward;
	}
}

