package sh.shDeit.Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import _comm.javabean.DietInfo;
import _comm.javabean.FoodInfo;
import cf.config.db.ConfigDAO;
import dt.diet.db.DietDAO;
import sh.shDeit.db.ShDietDAO;

public class ShDietAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShDietDAO shdietDao = new ShDietDAO();
		List<DietInfo> dietList = new ArrayList<DietInfo>();
		
		int page = 1;   
		int limit = 8;
		String search = null;  
		String nTypeVal =null;
		String state=null;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("page : " + page);
		System.out.println("limit : " + limit);
		
		if(request.getParameter("search") !=null) {
			search =request.getParameter("search");
		}
		System.out.println("search : " + search);
		
		if(request.getParameter("state") !=null) {
			state = request.getParameter("state");
		}
		if(request.getParameter("nutrient_type") !=null) {
			nTypeVal =request.getParameter("nutrient_type");
			
		}
		System.out.println("n : " + nTypeVal);
		
		//세션에서 id를 가져옵니다.
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id"); 
		System.out.println("sessionid: " + userId);

		int listcount = shdietDao.getShareListCount(search,nTypeVal);
		
		dietList = shdietDao.getShareDietList(page,limit,search,nTypeVal);
		

		int maxpage=(listcount + limit-1)/limit;
		System.out.println("maxPage : " + maxpage);
		

		int startpage = ((page-1)/10) * 10+1;
		System.out.println("startpage : "+ startpage);
		
		int endpage = startpage + 10 -1;
		System.out.println("endPage : " + endpage);
		

		if(endpage > maxpage)
			endpage = maxpage;

		//ajax 상태가 아닌 페이지 처리
		if(state == null) {
			System.out.println("state == null");
			request.setAttribute("page",page); 
			request.setAttribute("maxpage",maxpage);
			request.setAttribute("startpage",startpage);
			request.setAttribute("endpage",endpage);
			request.setAttribute("listcount",listcount);
			request.setAttribute("dietList", dietList);
			request.setAttribute("limit",limit);
			request.setAttribute("id",userId);
			request.setAttribute("nTypeVal",nTypeVal);
			request.setAttribute("searchText",search);
			
			/*
			 * for(DietInfo d:dietList) { System.out.println("code : " + d.getDiet_code());
			 * System.out.println("name : " + d.getDiet_name());
			 * System.out.println("recomm : " + d.getDiet_recomm());
			 * System.out.println("carb : " + d.getDiet_total_carb());
			 * System.out.println("fat : "+ d.getDiet_total_fat());
			 * System.out.println("protein : " + d.getDiet_total_protein());
			 * System.out.println("cal : " + d.getDiet_total_cal() + "\n\n"); }
			 */
			 		
			ActionForward forward =new ActionForward();
			forward.setRedirect(false);
			forward.setPath("navi/navi_shareDiet.jsp");
			return forward;
		}
		else 
		{
			System.out.println("state == ajax");
			
			//위의 request로 담았던 것을 JsonObejct에 담습니다.
			JsonObject object = new JsonObject();
			object.addProperty("page", page);
			object.addProperty("maxpage", maxpage);
			object.addProperty("startpage", startpage);
			object.addProperty("endpage", endpage);
			object.addProperty("listcount", listcount);
			object.addProperty("limit", limit);
			object.addProperty("nTypeVal", nTypeVal);
			object.addProperty("searchText", search);
			
			JsonElement je = new Gson().toJsonTree(dietList);
			System.out.println("dietList = " + je.toString());
			object.add("dietList",je);
			
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append(object.toString());
			System.out.println(object.toString());
			return null;
		}
	}
}

