package to.today.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _comm.javabean.Commondiet;
import _comm.javabean.PersonalInfo;
import _comm.javabean.TotalInfo;
import net.member.db.MemberDAO;
import to.today.db.TodayDAO;

public class TodayDietAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//자료형        변수이름 --선언   -- 담을 자료형 생성
				TodayDAO todaydao = new TodayDAO(); //db값을 가져오는 메소드 사용해서 값을 가져옴(삽입,취소,저장등)
				//
				String today1=null;
			    Calendar cal = Calendar.getInstance();
				// Today 식단의  ◀, ▶버튼 눌렀을 때
				if(request.getParameter("today") != null) {  //(today)값이 있는지 체크
					String currentDate = request.getParameter("currentdate"); //형식 : YYYY-DD-MM
					//현재 페이지의 날짜를 가져와서 calender 타입 cal변수에 세팅
					cal.set(Calendar.YEAR,Integer.parseInt(currentDate.substring(0,4)));
					cal.set(Calendar.MONTH,Integer.parseInt(currentDate.substring(5,7))-1);
					cal.set(Calendar.DATE,Integer.parseInt(currentDate.substring(8)));
					
					int today = Integer.parseInt(request.getParameter("today"));  //값을 쓰기위해 변수선언
					cal.add(Calendar.MONTH, 0);
					cal.add(Calendar.DATE, today);
				    today1 = new SimpleDateFormat("YY/MM/dd").format(cal.getTime()); 
				    System.out.println("클릭후 today 날짜= " + today1);
				// MY 식단의 달력 날짜 눌렀을 떄
				} else if(request.getParameter("searchDate") != null){
					 today1 = request.getParameter("searchDate");
					 
				}
				// 왼쪽 네비바 Today식단 눌렀을 때 
				else {
					cal.setTime(new Date(System.currentTimeMillis()));
					today1 = new SimpleDateFormat("YY/MM/dd").format(cal.getTime()); 
					System.out.println("today1: " + today1);
				}
				
				//조건추가 searchdate로 들어온게 있으면 searchdate로 쓰고
				
			    //세션에서 id를 가져옵니다.
			    HttpSession session = request.getSession();
			    String userId = (String) session.getAttribute("id"); 
			    System.out.println("sessionid: " + userId);
			    
			    
			    //임의 테스트용 날짜 
				String testday = "21/08/22";
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
		
				//반환형과 같은 타입 string으로 받아준다
			   String bf = totalinfo.getTotal_bf();
			   String lunch = totalinfo.getTotal_lunch();
			   String dinner = totalinfo.getTotal_dinner();
			   String snack = totalinfo.getTotal_snack();
			    
			   
			   Commondiet bf_comm=null;
			   Commondiet lunch_comm=null;
			   Commondiet dinner_comm=null;
			   Commondiet snack_comm=null;
			   if(bf.contains("M")) {
				    bf_comm = todaydao.getMealInfo(bf);
			   		System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
			   }else if(bf.contains("D")){
				    bf_comm = todaydao.getDietInfo(bf);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
			   }
			   
				System.out.println("-----bf_comm------");
				System.out.println(bf_comm.getName());
				System.out.println(bf_comm.getForm());
				System.out.println(bf_comm.getCarb());
				System.out.println(bf_comm.getFat());
				System.out.println(bf_comm.getPro());
				System.out.println(bf_comm.getCal());
				System.out.println(bf_comm.getImgname());
			   
			   if(lunch.contains("M")) {
				   lunch_comm = todaydao.getMealInfo(lunch);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
			   }else if(lunch.contains("D")){
				   lunch_comm = todaydao.getDietInfo(lunch);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
			   }
			   
				System.out.println("-----lunch_comm------");
				System.out.println(lunch_comm.getName());
				System.out.println(lunch_comm.getForm());
				System.out.println(lunch_comm.getCarb());
				System.out.println(lunch_comm.getFat());
				System.out.println(lunch_comm.getPro());
				System.out.println(lunch_comm.getCal());
				System.out.println(lunch_comm.getImgname());
			   
			   if(dinner.contains("M")) {
				   dinner_comm = todaydao.getMealInfo(dinner);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
			   }else if(dinner.contains("D")){
				   dinner_comm = todaydao.getDietInfo(dinner);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
			   }
			   
				System.out.println("-----dinner_comm------");
				System.out.println(dinner_comm.getName());
				System.out.println(dinner_comm.getForm());
				System.out.println(dinner_comm.getCarb());
				System.out.println(dinner_comm.getFat());
				System.out.println(dinner_comm.getPro());
				System.out.println(dinner_comm.getCal());
				System.out.println(dinner_comm.getImgname());
			   
			   if(snack.contains("M")) {
				   snack_comm = todaydao.getMealInfo(snack);
				   System.out.println("M이 포함되어 MealInfo에서 정보를 가져왔습니다.");
			   }else if(snack.contains("D")){
				   snack_comm = todaydao.getDietInfo(snack);
				   System.out.println("D가 포함되어 DietInfo에서 정보를 가져왔습니다.");
			   }
				System.out.println("-----snack_comm------");
				System.out.println(snack_comm.getName());
				System.out.println(snack_comm.getForm());
				System.out.println(snack_comm.getCarb());
				System.out.println(snack_comm.getFat());
				System.out.println(snack_comm.getPro());
				System.out.println(snack_comm.getCal());
				System.out.println(snack_comm.getImgname());
			   
		        //totalinfo=null;//error테스트를 위한 값 설정
		        //DAO에서 글의 내용을 읽지 못했을 경우 null을 반환합니다.
		        if(totalinfo==null) { System.out.println("상세보기 실패"); 
		        ActionForward forward = new ActionForward(); forward.setRedirect(false);
		        request.setAttribute("message", "데이터를 읽지 못했습니다.");
		        forward.setPath("error/error.jsp"); return forward; }
		        System.out.println("상세보기 성공");
		  
		        //totalinfo 객체를 request 객체에  담는다
		        //                     아이디                  실제데이터
		        request.setAttribute("totalinfo", totalinfo);
		        
		        
		        // 오른쪽 바 목표 칼로리
		        //세션에서 id값 가져옵니다.
		        String id = (String) session.getAttribute("id"); 
		        System.out.println("sessionid 값: " + id);
		        
		        PersonalInfo personalinfo = todaydao.selectrmr(id);
		        System.out.println("getRmr: " + personalinfo.getRmr());
		        
		        int calcurmr = personalinfo.getRmr();
		        System.out.println("가져온 rmr 정보:" + calcurmr);
		        int calcucarbpro = (int) Math.round((calcurmr) * 0.25 / 4);
		        System.out.println("rmr에서 계산된 carb, pro: " + calcucarbpro);
		        int calcufat = (int) Math.round((calcurmr) * 0.25 / 9);
		        System.out.println("rmr에서 계산된 fat: " + calcufat);
		        
		        int rmrweight = personalinfo.getWeight();
		        int weightwater = (int) Math.round((rmrweight) * 30);
		        System.out.println("무게당 계산된 물 L: " + weightwater +"L");
		        
		        //                    아이디                 실제데이터
		        request.setAttribute("totalrmr", calcurmr);
		        request.setAttribute("calcucarbpro", calcucarbpro);
		        request.setAttribute("calcufat", calcufat);
		        request.setAttribute("calcuwater", weightwater);
		        
		        
		        
		        
		        
		        //                    아이디                 실제데이터
		        request.setAttribute("bf",        bf_comm);
		        request.setAttribute("lunch", lunch_comm );
		        request.setAttribute("dinner",dinner_comm);
		        request.setAttribute("snack",  snack_comm);
		           	
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today 식단으로 이동하기 위해 경로를 설정합니다.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

