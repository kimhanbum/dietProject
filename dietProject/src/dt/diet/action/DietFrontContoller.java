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

