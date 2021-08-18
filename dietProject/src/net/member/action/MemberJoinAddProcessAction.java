package net.member.action;

import java.io.IOException;

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
		int goal=Integer.parseInt(request.getParameter("goal"));
		int height=Integer.parseInt(request.getParameter("height"));
		int weight=Integer.parseInt(request.getParameter("weight"));
		int goal_weight=Integer.parseInt(request.getParameter("goal_weight"));
	    int age=Integer.parseInt("age");
	    int rmr=0;
	   String gender=request.getParameter("gender");
	   
	   if(gender.equals("남")) {
		   rmr=(int) Math.round(66.47+ (13.75*weight) + (5*height) -(6.76 * age)); 
	   }
		PersonalInfo p=new PersonalInfo();	
		p.setId(id); p.setGoal(goal); p.setHegiht(height); p.setWeight(weight);
		p.setGoal_weight(goal_weight); p.setRmr(rmr);
		
		MemberDAO dao=new MemberDAO();
		
		
		return null;
	}

}
