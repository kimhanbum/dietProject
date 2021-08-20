package to.today.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _comm.javabean.Commondiet;
import _comm.javabean.DietInfo;
import _comm.javabean.MealInfo;
import _comm.javabean.TotalInfo;
import to.today.db.TodayDAO;

public class TodayDietAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//자료형        변수이름 --선언   -- 담을 자료형 생성
				TodayDAO todaydao = new TodayDAO(); //db값을 가져오는 메소드 사용해서 값을 가져옴(삽입,취소,저장등)
				
			    Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date(System.currentTimeMillis()));
				String today1 = new SimpleDateFormat("YY/MM/dd").format(cal.getTime()); 
				System.out.println(today1);
				
				if(request.getParameter("today1") != null) {
					cal.add(Calendar.MONTH, 0);
					cal.add(Calendar.DATE, -1);
				    System.out.println(today1);
				    
				} else if (request.getParameter("today1") != null) {
					cal.add(Calendar.MONTH, 0);
					cal.add(Calendar.DATE, +1);
					
					
					
					
				}
				
				
		
		 				
				//오늘날짜 기준으로 전날,다음날 구하기+1,-1
				//null 조건에 따라 날짜계산 (DietSharePageAction.java32,33참조)
				//같은 Action을 쓰니까
				
				
				
			    //세션에서 id를 가져옵니다.
			    HttpSession session = request.getSession();
			    String userId = (String) session.getAttribute("id"); 
			    System.out.println("sessionid: " + userId);
			       
				//                     db 저장                                      인자값
         		TotalInfo totalinfo = todaydao.getTotalInfo(userId, today1);
				
				System.out.println(totalinfo.getId());
				System.out.println(totalinfo.getTotal_date());
				System.out.println(totalinfo.getTotal_bf());
				System.out.println(totalinfo.getTotal_lunch());
				System.out.println(totalinfo.getTotal_dinner());
				System.out.println(totalinfo.getTotal_snack());
				System.out.println(totalinfo.getTotal_fat());
				System.out.println(totalinfo.getTotal_carb());
				System.out.println(totalinfo.getTotal_cal());
				System.out.println("-----comdiet------");
				Commondiet comdiet= new Commondiet();
				System.out.println(comdiet.getName());
				System.out.println(comdiet.getForm());
				System.out.println(comdiet.getCarb());
				System.out.println(comdiet.getFat());
				System.out.println(comdiet.getPro());
				System.out.println(comdiet.getCal());
				
				
				//반환형과 같은 타입 string으로 받아준다
			   String bf = totalinfo.getTotal_bf();
			   String lunch = totalinfo.getTotal_lunch();
			   String dinner = totalinfo.getTotal_dinner();
			   String snack = totalinfo.getTotal_snack();
			    
			   
//			   List<DietInfo>DietList = new ArrayList<DietInfo>();
//			   List<MealInfo>mealList = new ArrayList<MealInfo>();
			   
//			   DietInfo[] d_array = request.getDietInfo();
//			   if(d_array != null) {
//				   for(int i=0; i<d_array.length; i++) {
//					   if(d_array[i].getDiet_code().equ))
//				   }
//			   }
			   
			   
			   
			   
			   
			   
			   MealInfo meal_bf = null;
			   MealInfo meal_lunch = null;
			   MealInfo meal_dinner = null;
			   MealInfo meal_snack = null;
			   DietInfo diet_bf = null;
			   DietInfo diet_lunch = null;
			   DietInfo diet_dinner = null;
			   DietInfo diet_snack = null;
			   String id = "";
			   if(bf.contains("M")) {
				   meal_bf = todaydao.getMealInfo(bf);
			   		System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
			   		System.out.println(meal_bf.getMeal_name());
			   }else if(bf.contains("D")){
				   diet_bf = todaydao.getDietInfo(bf);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   System.out.println(diet_bf.getDiet_name());
			   }
			   
			   if(lunch.contains("M")) {
				   meal_lunch = todaydao.getMealInfo(lunch);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				   System.out.println(meal_lunch.getMeal_name());
			   }else if(lunch.contains("D")){
				   diet_lunch = todaydao.getDietInfo(lunch);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   System.out.println(diet_lunch.getDiet_name());
			   }
			   
			   if(dinner.contains("M")) {
				   meal_dinner = todaydao.getMealInfo(dinner);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				   System.out.println(meal_dinner.getMeal_name());
			   }else if(dinner.contains("D")){
				   diet_dinner = todaydao.getDietInfo(dinner);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   System.out.println(diet_dinner.getDiet_name());
			   }
			   
			   if(snack.contains("M")) {
				   meal_snack = todaydao.getMealInfo(snack);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				   System.out.println(meal_snack.getMeal_name());
			   }else if(snack.contains("D")){
				   diet_snack = todaydao.getDietInfo(snack);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   System.out.println(diet_snack.getDiet_name());
			   }
			   
			   
			   
			   

			
			   
		        //totalinfo=null;//error테스트를 위한 값 설정
		        //DAO에서 글의 내용을 읽지 못했을 경우 null을 반환합니다.
		        if(totalinfo==null) { System.out.println("상세보기 실패"); ActionForward forward =
		        new ActionForward(); forward.setRedirect(false);
		        request.setAttribute("message", "데이터를 읽지 못했습니다.");
		        forward.setPath("error/error.jsp"); return forward; }
		        System.out.println("상세보기 성공");
		 	
		  
		        //totalinfo 객체를 request 객체에  담는다
		        //                     아이디                  실제데이터
		        request.setAttribute("totalinfo", totalinfo);
		        
		        
		        request.setAttribute("bf", meal_bf==null?diet_bf:meal_bf);
		        request.setAttribute("lunch", meal_lunch==null?diet_lunch:meal_lunch);
		        request.setAttribute("dinner", meal_dinner==null?diet_dinner:meal_dinner);
		        request.setAttribute("snack", meal_snack==null?diet_snack:meal_snack);
		        
		        
	            
		       
		 				
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today 식단으로 이동하기 위해 경로를 설정합니다.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

