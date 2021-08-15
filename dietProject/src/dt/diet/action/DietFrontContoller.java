package dt.diet.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.dt")
public class DietFrontContoller extends javax.servlet.http.HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	           throws ServletException, IOException{
		/* 
		    요청된 전체 URL중에서 포트 번호 다음부터 마지막 문자열까지 반환됩니다.
		    예) http://localhost:8088/jspProject/login.net인 경우
		      "/jspProject/login.net" 반환됩니다.
		*/
		String RequestURI= request.getRequestURI();
		System.out.println("ReqeustURI = " + RequestURI);
		
		//getContextPath() : 컨텍스트 경로가 반환됩니다.
		//contextPath는 "/jspProject"가 반환됩니다.
		String contextPath =request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		//RequestURI에서 컨텍스트 경로 길이 값의 인데스 위치의 문자부터
		//마지막 위치 문자까지 추출합니다.
		//command는 "/login.net" 반환됩니다.
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		
		//초기화
		ActionForward forward =null;
		Action action =null;
		switch(command) {
			case "/dietpage.dt":
				action = new DietPageAction();
				break;
			case "/dietSharePage.dt":
				action = new DietSharePageAction();
				break;
			case "/dietDelete.dt":
				action = new DietDeleteAction();
				break;
			case "/dietDetail.dt":
				action = new DietDetailAction();
				break;
			case "/dietShare.dt":
				action = new DietShareAction();
				break;
			case "/dietReplyAdd.dt":
				action = new DietReplyAddAction();
				break;
			case "/dietReplydelete.dt":
				action = new DietReplyDeleteAction();
				break;
			case "/dietReplyUpdate.dt":
				action = new DietReplyUpdateAction();
				break;
		}
		
		forward = action.execute(request,response);
		if(forward !=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doProcess(request,response);
	}
	
}

