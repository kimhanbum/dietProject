package to.today.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import _comm.javabean.DietInfo;
import _comm.javabean.MealInfo;
import _comm.javabean.TotalInfo;
import to.today.db.TodayDAO;

public class TodayDietDetailMealAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TodayDAO tDao =new TodayDAO();
		List<MealInfo> mList = null;
		
		mList = tDao.getAllMealList();
		
		//위의 request로 담았던 것을 JsonObejct에 담습니다.
		JsonObject object = new JsonObject();
		
		JsonElement je = new Gson().toJsonTree(mList);
		System.out.println("mList = " + je.toString());
		object.add("allMealList",je);
		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append(object.toString());
		System.out.println(object.toString());
		return null;
	}
}

