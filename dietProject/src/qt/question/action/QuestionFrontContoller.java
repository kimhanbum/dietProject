package qt.question.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.qt")
public class QuestionFrontContoller extends javax.servlet.http.HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	           throws ServletException, IOException{
		/* 
		    ��û�� ��ü URL�߿��� ��Ʈ ��ȣ �������� ������ ���ڿ����� ��ȯ�˴ϴ�.
		    ��) http://localhost:8088/jspProject/login.net�� ���
		      "/jspProject/login.net" ��ȯ�˴ϴ�.
		*/
		String RequestURI= request.getRequestURI();
		System.out.println("ReqeustURI = " + RequestURI);
		
		//getContextPath() : ���ؽ�Ʈ ��ΰ� ��ȯ�˴ϴ�.
		//contextPath�� "/jspProject"�� ��ȯ�˴ϴ�.
		String contextPath =request.getContextPath();
		System.out.println("contextPath = " + contextPath);
		
		//RequestURI���� ���ؽ�Ʈ ��� ���� ���� �ε��� ��ġ�� ���ں���
		//������ ��ġ ���ڱ��� �����մϴ�.
		//command�� "/login.net" ��ȯ�˴ϴ�.
		String command = RequestURI.substring(contextPath.length());
		System.out.println("command = " + command);
		
		//�ʱ�ȭ
		ActionForward forward =null;
		Action action =null;
		switch(command) {
			case "/questionMain.qt":
				action = new QuestionAction();
				break;
			case "/questionDelete.qt":
				action = new QuestionDeleteAction();
				break;
			case "/questionDetail.qt":
				action = new QuestionDetailAction();
				break;
			case "/questionReply.qt":
				action = new QuestionReplyAction();
				break;
			case "/questionReplyProcess.qt":
				action = new QuestionReplyProcessAction();
				break;
			case "/questionWrite.qt":
				action = new QuestionWriteAction();
				break;
			case "/questionWriteProcess.qt":
				action = new QuestionWriteProcessAction();
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

