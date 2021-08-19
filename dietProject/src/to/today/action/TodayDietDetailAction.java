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
		
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today 식단으로 이동하기 위해 경로를 설정합니다.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

