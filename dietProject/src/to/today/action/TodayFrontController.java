package to.today.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.to")
public class TodayFrontController extends javax.servlet.http.HttpServlet{

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
	     
			
			case "/todayDiet.to":
				action = new TodayDietAction();
				break;
			case "/bottomProcess.to":
				action = new TodayDietBottomProcessAction();
				break;
			case "/topProcess.to":
				action = new TodyaDietTopProcessAction();
				break;
			case "/dietDetail.to":
				action = new TodayDietDetailAction();
				break;
			case "/dietmeal.to":
				action = new TodayDietMealAction();
				break;
			case "/dietSelect.to":
				action = new TodayDietSelectAction();
				break;
			case "/myDiet.to":
				action = new MyDietAction();
				break;
			case "/myDietLoad.to":
				action = new MyDietLoadAction();
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

