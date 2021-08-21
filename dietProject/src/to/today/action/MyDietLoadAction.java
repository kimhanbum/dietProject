package to.today.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import to.today.db.TodayDAO;

public class MyDietLoadAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TodayDAO tdao = new TodayDAO();
		JsonArray array = new JsonArray();
		JsonObject object = new JsonObject();

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		System.out.println("userId : " + userId);

		String yearMonth = request.getParameter("yearMonth");
		System.out.println(yearMonth);
		array = tdao.getMonthTotalData(userId, yearMonth);

		
		/*
		 * object.addProperty("title", "3333");
		 * object.addProperty("start","2021-08-12"); object.addProperty("end",
		 * "2021-08-12"); object.addProperty("color", "green"); array.add(object);
		 */
		 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(array);
		System.out.println(array);
		return null;

	}
}
