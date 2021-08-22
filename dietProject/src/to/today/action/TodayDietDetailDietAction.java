package to.today.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import _comm.javabean.DietInfo;
import to.today.db.TodayDAO;

public class TodayDietDetailDietAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TodayDAO tDao = new TodayDAO();
		List<DietInfo> dList = null;
		dList = tDao.getAllDietList();
		
		JsonObject object = new JsonObject();
		
		JsonElement je = new Gson().toJsonTree(dList);
		System.out.println("dList = " + je.toString());
		object.add("allDietlList",je);
		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append(object.toString());
		System.out.println(object.toString());
		return null;
	}
}

