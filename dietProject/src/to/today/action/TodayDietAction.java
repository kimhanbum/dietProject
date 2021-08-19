package to.today.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _comm.javabean.DietInfo;
import _comm.javabean.MealInfo;
import _comm.javabean.TotalInfo;
import to.today.db.TodayDAO;

public class TodayDietAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//자료형        변수이름 --선언   -- 담을 자료형 생성
				TotalInfo totalinfo = new TotalInfo(); //해당테이블 값을 받아오려고 씀
				TodayDAO todaydao = new TodayDAO(); //db값을 가져오는 메소드 사용해서 값을 가져옴(삽입,취소,저장등)
				
				
			    Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date(System.currentTimeMillis()));
				String today1 = new SimpleDateFormat("YY/MM/dd").format(cal.getTime()); 
				System.out.println(today1);

				//db 저장                                                               인자값
				totalinfo = todaydao.getTotalInfo("user001", today1);
				
				System.out.println(totalinfo.getId());
				System.out.println(totalinfo.getTotal_date());
				System.out.println(totalinfo.getTotal_bf());
				System.out.println(totalinfo.getTotal_lunch());
				System.out.println(totalinfo.getTotal_dinner());
				System.out.println(totalinfo.getTotal_snack());
				System.out.println(totalinfo.getTotal_fat());
				System.out.println(totalinfo.getTotal_carb());
				System.out.println(totalinfo.getTotal_cal());
				
				
				//반환형과 같은 타입 string으로 받아준다
			   String bf = totalinfo.getTotal_bf();
			   String lunch = totalinfo.getTotal_lunch();
			   String dinner = totalinfo.getTotal_dinner();
			   String snack = totalinfo.getTotal_snack();
			    
			   MealInfo meal = null;
			   DietInfo diet = null;
			   String id = "";
			   if(bf.contains("M")) {
				   meal = todaydao.getMealInfo(bf);
			   		System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
			   		System.out.println(meal.getMeal_name());
			   }else if(bf.contains("D")){
				   diet = todaydao.getDietInfo(bf);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   System.out.println(diet.getDiet_name());
			   }
			   
			   if(lunch.contains("M")) {
				   meal = todaydao.getMealInfo(lunch);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				   System.out.println(meal.getMeal_name());
			   }else if(lunch.contains("D")){
				   diet = todaydao.getDietInfo(lunch);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   System.out.println(diet.getDiet_name());
			   }
			   
			   if(dinner.contains("M")) {
				   meal = todaydao.getMealInfo(dinner);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				   System.out.println(meal.getMeal_name());
			   }else if(dinner.contains("D")){
				   diet = todaydao.getDietInfo(dinner);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   System.out.println(diet.getDiet_name());
			   }
			   
			   if(snack.contains("M")) {
				   meal = todaydao.getMealInfo(snack);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
				   System.out.println(meal.getMeal_name());
			   }else if(snack.contains("D")){
				   diet = todaydao.getDietInfo(snack);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
				   System.out.println(diet.getDiet_name());
			   }
			   
			   System.out.println("-----dietinfo---------------");
			   System.out.println(diet.getDiet_name());
			   System.out.println(diet.getDiet_form());
			   System.out.println(diet.getDiet_recomm());
			   System.out.println(diet.getDiet_total_carb());
			   System.out.println(diet.getDiet_total_fat());
			   System.out.println(diet.getDiet_total_protein());
			   System.out.println(diet.getDiet_total_cal());
			   
			   System.out.println("-----mealinfo---------------");
			   System.out.println(meal.getMeal_name());
			   System.out.println(meal.getMeal_img_name());
			   System.out.println(meal.getMeal_carb());
			   System.out.println(meal.getMeal_fat());
			   System.out.println(meal.getMeal_protein());
			   System.out.println(meal.getMeal_cal());
			   
			   
			   
			   
			   
			   
			   
//			   String code = diet.getDiet_name();
//			   diet = todaydao.getDietInfo(code);
			   
			   
			   
			   
			   
			   
			   //select 문 기준되는값 code
			   //bf,lunch,dinner,snack 4번 d,m 조회 (if문)
			   //값을 받아와서 request에 저장
			   //아침점심저녁간식 변수 4개 선언
			   
			   //d3,dietinfo    m1,mealinfo 로 받아준다.
//			   MealInfo mealinfo = new MealInfo();

//			   String code = new String();
//			   System.out.println("code =" + code);
//			   mealinfo = todaydao.getMealInfo(code);
//			   System.out.println(mealinfo.);
			   
			   
			   
			   
			   
			   
			   
		/*
		 * DietInfo dietinfo1 = new DietInfo();
		 * 
		 * 
		 * 
		 * 
		 * DietInfo dietinfo2 = new DietInfo(); DietInfo dietinfo3 = new DietInfo();
		 * 
		 */			   
				//d 혹은 m 으로 시작하는지 판단한다.
			    //d 로 식작할경우 DietInfo 테이블에서 정보를 가져온다
			    //m 으로 시작할 경우 MealInfo 테이블에서 정보를 가져온다
			    // DietInfo 테이블에서 정보를 가져올 경우   DietInfo 반환형으로 받아준다
			   // MealInfo 테이블에서 정보를 가져올 경우   MealInfo 반환형으로 받아준다
			
			   
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
		        
		        
		        request.setAttribute("diet", diet);
		        request.setAttribute("meal", meal);
		        
		        
	            
		       
		 				
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today 식단으로 이동하기 위해 경로를 설정합니다.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

