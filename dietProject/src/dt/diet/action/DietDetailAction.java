package dt.diet.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import _comm.javabean.DietInfo;
import dt.diet.db.DietDAO;

public class DietDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DietDAO dietdao = new DietDAO();
		JsonObject object= null;
		JsonArray jArray =null;
		JsonElement je = null;
		String dcode = request.getParameter("dcode");
		int state =Integer.parseInt(request.getParameter("state"));
		System.out.println("state: " + state + " dcode:" + dcode );
		//1.Ư�� �Ĵ� �󼼺��� ���� ��������(�Ĵ� �� ����)
		object=dietdao.getDetail(dcode);
		
		if(object==null) {
			System.out.println("�Ĵ� ���� �������� ����");
			ActionForward forward =new ActionForward();
			request.setAttribute("message","�Ĵ� �����͸� ���� ���߽��ϴ�.");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		
		System.out.println("�Ĵ� ���� �������� �Ϸ�");
		
		
		//2.�Ĵ��� ���� ���� ������ ã�´�.
		String foods =object.get("diet_form").getAsString();
		System.out.println("foods : " + foods);
		jArray = dietdao.getFoodDetail(foods);
		je = new Gson().toJsonTree(jArray);
		object.add("foodlist", je);
		
		//3.�Ĵ��� ��� ������ ã�´�.
		jArray = dietdao.getCommentList(dcode,state);
		je = new Gson().toJsonTree(jArray);
		object.add("commentlist", je);
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(object.toString());
	    System.out.println(object.toString());
	    return null;	
	}
}

