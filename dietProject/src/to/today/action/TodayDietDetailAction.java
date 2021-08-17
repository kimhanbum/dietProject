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
import net.member.action.ActionForward;
import to.today.db.TodayDAO;

public class TodayDietDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//자료형        변수이름 --선언   -- 담을 자료형 생성
				TotalInfo totalinfo = new TotalInfo(); //해당테이블 값을 받아오려고 씀
				DietInfo dietinfo = new DietInfo();
				MealInfo mealinfo = new MealInfo();
				TodayDAO todaydao = new TodayDAO(); //db값을 가져오는 메소드 사용해서 값을 가져옴(삽입,취소,저장등)
				
				
			    Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date(System.currentTimeMillis()));
				String today1 = new SimpleDateFormat("yy/MM/dd").format(cal.getTime()); 
				System.out.println(today1);

				//db 저장                                                               인자값
				totalinfo = todaydao.getTotalInfo("user001", today1);
				
				totalinfo = todaydao.getDietInfo("d1");
				totalinfo = todaydao.getMealInfo("m22");
				
				
				
				
				//반환형과 같은 타입 string으로 받아준다
			   String bf = totalinfo.getTotal_bf();
			   String lunch = totalinfo.getTotal_lunch();
			   String dinner = totalinfo.getTotal_dinner();
			   String snack = totalinfo.getTotal_snack();
				
			   
				//d 혹은 m 으로 시작하는지 판단한다.
			    //d 로 식작할경우 DietInfo 테이블에서 정보를 가져온다
			    //m 으로 시작할 경우 MealInfo 테이블에서 정보를 가져온다
			    // DietInfo 테이블에서 정보를 가져올 경우   DietInfo 반환형으로 받아준다
			   // MealInfo 테이블에서 정보를 가져올 경우   MealInfo 반환형으로 받아준다
			   String meal_co = mealinfo.getMeal_code();
			   String diet_co = dietinfo.getDiet_code();
				
			 //totalinfo=null;//error테스트를 위한 값 설정
			    //DAO에서 글의 내용을 읽지 못했을 경우 null을 반환합니다.
				if(totalinfo==null) {
					System.out.println("상세보기 실패");
					ActionForward forward = new ActionForward();
					forward.setRedirect(false);
					request.setAttribute("message", "데이터를 읽지 못했습니다.");
					forward.setPath("error/error.jsp");
					return forward;
				}
				System.out.println("상세보기 성공");
			   
			   
			   
			   
				
				//totalinfo 객체를 request 객체에 저장합니다. 
				//                     아이디                  실제데이터
				request.setAttribute("totalinfo", totalinfo);
				request.setAttribute("diteinfo", dietinfo);
				request.setAttribute("mealinfo", mealinfo);
				
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today 식단으로 이동하기 위해 경로를 설정합니다.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

