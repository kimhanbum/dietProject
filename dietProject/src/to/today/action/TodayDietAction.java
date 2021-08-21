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
				//
				
				
			    Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date(System.currentTimeMillis()));
				String today1 = new SimpleDateFormat("YY/MM/dd").format(cal.getTime()); 
				System.out.println("today1: " + today1);
				
				if(request.getParameter("today") != null) {  //(today)값이 있는지 체크
					int today = Integer.parseInt(request.getParameter("today"));  //값을 쓰기위해 변수선언
					cal.add(Calendar.MONTH, 0);
					cal.add(Calendar.DATE, today);
				    System.out.println("today= " + today);
				}
				
				//오늘날짜 기준으로 전날,다음날 구하기+1,-1
				//null 조건에 따라 날짜계산 (DietSharePageAction.java32,33참조)
				//같은 Action을 쓰니까
				
			    //세션에서 id를 가져옵니다.
			    HttpSession session = request.getSession();
			    String userId = (String) session.getAttribute("id"); 
			    System.out.println("sessionid: " + userId);
			    
			    
			    //임의 테스트용 날짜 
				String testday = "21/08/21";
			    //                     db 저장                                      인자값
         		TotalInfo totalinfo = todaydao.getTotalInfo(userId, testday);
				
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
			   
			   
			   
			   Commondiet bf_comm=null;
			   Commondiet lunch_comm=null;
			   Commondiet dinner_comm=null;
			   Commondiet snack_comm=null;
			   if(bf.contains("M")) {
				    bf_comm = todaydao.getMealInfo(bf);
			   		System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
			   		//System.out.println(meal_bf.getMeal_name());
			   }else if(bf.contains("D")){
				    bf_comm = todaydao.getDietInfo(bf);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   //System.out.println(diet_bf.getDiet_name());
			   }
			   
				System.out.println("-----bf_comm------");
				System.out.println(bf_comm.getName());
				System.out.println(bf_comm.getForm());
				System.out.println(bf_comm.getCarb());
				System.out.println(bf_comm.getFat());
				System.out.println(bf_comm.getPro());
				System.out.println(bf_comm.getCal());
			   
			   
			   if(lunch.contains("M")) {
				   lunch_comm = todaydao.getMealInfo(lunch);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				   //System.out.println(meal_lunch.getMeal_name());
			   }else if(lunch.contains("D")){
				   lunch_comm = todaydao.getDietInfo(lunch);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   //System.out.println(diet_lunch.getDiet_name());
			   }
			   
				System.out.println("-----lunch_comm------");
				System.out.println(lunch_comm.getName());
				System.out.println(lunch_comm.getForm());
				System.out.println(lunch_comm.getCarb());
				System.out.println(lunch_comm.getFat());
				System.out.println(lunch_comm.getPro());
				System.out.println(lunch_comm.getCal());
			   
			   if(dinner.contains("M")) {
				   dinner_comm = todaydao.getMealInfo(dinner);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				   //System.out.println(meal_dinner.getMeal_name());
			   }else if(dinner.contains("D")){
				   dinner_comm = todaydao.getDietInfo(dinner);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   //System.out.println(diet_dinner.getDiet_name());
			   }
			   
				System.out.println("-----dinner_comm------");
				System.out.println(dinner_comm.getName());
				System.out.println(dinner_comm.getForm());
				System.out.println(dinner_comm.getCarb());
				System.out.println(dinner_comm.getFat());
				System.out.println(dinner_comm.getPro());
				System.out.println(dinner_comm.getCal());
			   
			   if(snack.contains("M")) {
				   snack_comm = todaydao.getMealInfo(snack);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				  // System.out.println(meal_snack.getMeal_name());
			   }else if(snack.contains("D")){
				   snack_comm = todaydao.getDietInfo(snack);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   //System.out.println(diet_snack.getDiet_name());
			   }
				System.out.println("-----snack_comm------");
				System.out.println(snack_comm.getName());
				System.out.println(snack_comm.getForm());
				System.out.println(snack_comm.getCarb());
				System.out.println(snack_comm.getFat());
				System.out.println(snack_comm.getPro());
				System.out.println(snack_comm.getCal());
			   
			   
			   

			
			   
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
		        
		        
		        request.setAttribute("bf",bf_comm);
		        request.setAttribute("lunch",lunch_comm );
		        request.setAttribute("dinner",dinner_comm);
		        request.setAttribute("snack",snack_comm);
		           	
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today 식단으로 이동하기 위해 경로를 설정합니다.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

