package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _comm.javabean.UserInfo;
import net.member.db.MemberDAO;

public class MemberJoinProcessAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

        String jumin1=request.getParameter("jumin1");
        String jumin2=request.getParameter("jumin2");
        String jumin= jumin1 + "-" + jumin2;
		
		Calendar cal= Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		String age1= jumin1.substring(0,2);
		 if(Character.getNumericValue((jumin1.charAt(1)))<=2) {
			 age1= "20" + age1;
		 }else {
			 age1="19"+ age1;
		 }
		 System.out.println("나이는 " + age1);
		 String age=String.valueOf(year - Integer.parseInt(age1)) ;
		 
		 
		
		String id= request.getParameter("id");
		String  pass=request.getParameter("pass");
        String  name=request.getParameter("name");
        
       
        
        String tel1=request.getParameter("tel_1");
        String tel2=request.getParameter("tel_2");
        String tel3=request.getParameter("tel_3");
        String tel=tel1 + "-" + tel2 + "-" + tel3;
        
        
        String gender=request.getParameter("gender");
        
        
        String post=request.getParameter("post1");
        String address=request.getParameter("address");
        String addr= post + "," + address;
        
        String mail=request.getParameter("email");
        String domain=request.getParameter("domain");
        String email= mail + "@" + domain;
        
        UserInfo m= new UserInfo();
        m.setId(id); m.setPass(pass); m.setName(name);  m.setJumin(jumin);
        m.setGender(gender); m.setEmail(email); m.setTel(tel); m.setAddress(addr);
        
        MemberDAO dao=new MemberDAO();
       
       
        
        int result= dao.insert(m);
        
        System.out.println("insert()결과:"+ result);
        
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println("<script>");
        
        if(result==1) {
        out.println("alert('회원 가입을 축하 드립니다. 추가 항목을 작성하시기 바랍니다. ');");
        out.println("location.href='joinAdd.net?id="+id +  "&age=" +  age + "&gender=" + gender +  "'");
        }else {     
        	 
        	out.println("history.back();");
        }
        
        out.println("</script>");
        out.close();
        
        return null;
	}
}

