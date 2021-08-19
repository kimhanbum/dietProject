package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _comm.javabean.PersonalInfo;
import net.member.db.MemberDAO;

public class MemberJoinAddProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String id= request.getParameter("id");
		 System.out.println("id:" + id);
		int goal=Integer.parseInt(request.getParameter("goal"));
		System.out.println("goal:" + goal);
		int height=Integer.parseInt(request.getParameter("height"));
		System.out.println("height:" + height);
		int weight=Integer.parseInt(request.getParameter("weight"));
		 System.out.println("weight:" + weight);
		int goal_weight=Integer.parseInt(request.getParameter("goal_weight"));
		System.out.println("goal_weight:" + goal_weight);
		int age=Integer.parseInt(request.getParameter("age"));
		 System.out.println("age:" + age);
		int rmr=0;
	    String gender=request.getParameter("gender");
	    System.out.println("gender:" + gender);
	    
	    
	   
	    
	   
	    
	   if(gender.equals("남")) {
		   rmr=(int) Math.round(66.47+ (13.75*weight) + (5*height) -(6.76 * age)); 
	   }
	   if(gender.equals("여")) {
		   rmr=(int) Math.round(66.51+ (9.56*weight) + (1.85*height) -(4.68 * age)); 
	   }
		
	   System.out.println("rmr:" + rmr);
	   
	   PersonalInfo p=new PersonalInfo();	
		p.setId(id); p.setGoal(goal); p.setHeight(height); p.setWeight(weight);
		p.setGoal_weight(goal_weight); p.setRmr(rmr);
		
		MemberDAO dao=new MemberDAO();
		
		int result= dao.insertAdd(p);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		out.println("<script>");
		
		if(result==1) {
			out.println("alert('가입을 축하합니다.');");
			out.println("location.href='main.net';");
					
		}else {
			out.println("alert('가입과정에서 에러가 발생했습니다.');");
			out.println("history.back();");
		}
		   
		out.println("</script>");
		out.close();
		return null;
	}

}
