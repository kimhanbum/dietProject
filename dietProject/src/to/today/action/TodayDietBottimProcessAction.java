package to.today.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TodayDietBottimProcessAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		/*
		 * if() { out.println("alert('�� �Ĵ� ������ ����Ǿ����ϴ�.');");
		 * out.println("location.href='dietDetail.to';"); }else {
		 * out.println("alert('�� �Ĵ� ������ ���忡 �����Ͽ����ϴ�.);");
		 * out.println("history.back();"); }out.close();
		 */
		
		
		
		ActionForward forward =new ActionForward();
		forward.setRedirect(false);
		forward.setPath("");
		return forward;
	}
}

