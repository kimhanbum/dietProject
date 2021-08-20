package cf.config.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _comm.javabean.DietInfo;
import cf.config.db.ConfigDAO;

public class CfDietProcessAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DietInfo dInfo = new DietInfo();
		ConfigDAO cDao = new ConfigDAO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id"); 
		System.out.println("userId : " + userId);
		if(userId == null) {
			System.out.println("미로그인상태");
			return null;
		}
		System.out.println("=================================");
		System.out.println(userId);
		System.out.println(request.getParameter("diet_name"));
		System.out.println(request.getParameter("diet_form"));
		System.out.println(request.getParameter("total_tan"));
		System.out.println(request.getParameter("total_ji"));
		System.out.println(request.getParameter("total_dan"));
		System.out.println(request.getParameter("total_cal"));
		System.out.println("=================================");
		
		dInfo.setId(userId);
		dInfo.setDiet_name(request.getParameter("diet_name"));
		dInfo.setDiet_form(request.getParameter("diet_form"));
		dInfo.setDiet_total_carb(Integer.parseInt(request.getParameter("total_tan")));
		dInfo.setDiet_total_fat(Integer.parseInt(request.getParameter("total_ji")));
		dInfo.setDiet_total_protein(Integer.parseInt(request.getParameter("total_dan")));
		dInfo.setDiet_total_cal(Integer.parseInt(request.getParameter("total_cal")));
		
		int result = cDao.CreateDiet(dInfo);
		System.out.println("result :" + result);
		if(result==0) {
			System.out.println("식단 생성에 실패했습니다.");
			ActionForward forward =new ActionForward();
			request.setAttribute("message","식단 생성에 실패했습니다.");
		    forward.setRedirect(false);
		    forward.setPath("error/error.jsp");
			return forward;
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	    return null;	
	}
}

