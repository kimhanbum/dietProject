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

public class TodayDietDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//자료형        변수이름 --선언   -- 담을 자료형 생성
				TotalInfo totalinfo = new TotalInfo(); //해당테이블 값을 받아오려고 씀
				TodayDAO todaydao = new TodayDAO(); //db값을 가져오는 메소드 사용해서 값을 가져옴(삽입,취소,저장등)
				
				
			    Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date(System.currentTimeMillis()));
				String today1 = new SimpleDateFormat("yy/MM/dd").format(cal.getTime()); 
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
			    
			   MealInfo meal;
			   DietInfo diet;
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
			   
			   
			   

/*			   
			   todaydao.getDietInfo(tablename,code,bf,id);
			   
			   if(lunch.contains("M")) {
				   tablename = "meal_info";
				   code = "meal_code";
			   		System.out.println("문자가 포함되어 있습니다.");
			   }else if(lunch.contains("D")){
				   tablename = "diet_info";
				   code = "diet_code";
				   System.out.println("문자가 포함되어 있지 않습니다.");
			   }
			   String sql2="select * from meal_info inner join total_info\r\n" + 
			   		"on meal_code = total_lunch\r\n" + 
			   		"where total_info.id= 'user002'";
			   
			   if(dinner.contains("M")) {
				   tablename = "meal_info";
				   code = "diet_code";
			   		System.out.println("문자가 포함되어 있습니다.");
			   }else if(dinner.contains("D")){
				   tablename = "diet_info";
				   code = "meal_code";
				   System.out.println("문자가 포함되어 있지 않습니다.");
			   }
			   String sql3="select * from meal_info inner join total_info\r\n" + 
			   		"on meal_code = total_dinner\r\n" + 
			   		"where total_info.id= 'user002'";
			   
			   if(snack.contains("M")) {
				   //d일경우 dietinfo에서 값을 가져온다. 테이블조회 DAO에서 메소드 만들기
				   System.out.println("문자가 포함되어 있습니다.");
			   }else {
				   //m일경우 mealinfo에서 값을 가져온다.DAO에서 메소드 만들기
				   System.out.println("문자가 포함되어 있지 않습니다.");
			   }
			   
*/			   
			   
			   
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
		/*
		 * String meal_co = mealinfo.getMeal_code(); String diet_co1 =
		 * dietinfo1.getDiet_code(); String diet_co2 = dietinfo2.getDiet_code(); String
		 * diet_co3 = dietinfo3.getDiet_code();
		 */				
			 //totalinfo=null;//error테스트를 위한 값 설정
			    //DAO에서 글의 내용을 읽지 못했을 경우 null을 반환합니다.
		/*
		 * if(totalinfo==null) { System.out.println("상세보기 실패"); ActionForward forward =
		 * new ActionForward(); forward.setRedirect(false);
		 * request.setAttribute("message", "데이터를 읽지 못했습니다.");
		 * forward.setPath("error/error.jsp"); return forward; }
		 * System.out.println("상세보기 성공");
		 */		   
			   
			   
			   
				
				//totalinfo 객체를 request 객체에  담는다
				//                     아이디                  실제데이터
		/*
		 * request.setAttribute("totalinfo", totalinfo);
		 * request.setAttribute("dietinfo", dietinfo1); request.setAttribute("dietinfo",
		 * dietinfo2); request.setAttribute("dietinfo", dietinfo3);
		 * request.setAttribute("mealinfo", mealinfo);
		 */				
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today 식단으로 이동하기 위해 경로를 설정합니다.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

