package cf.config.action;

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

public class CfDietAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ConfigDAO foodDao = new ConfigDAO();
		List<FoodInfo> foodList = new ArrayList<FoodInfo>();
		
		String updateState=null;
		DietInfo updateDiet = null;
		List<FoodInfo> updateFoodList = new ArrayList<FoodInfo>();
		int updateSize=0;
		
		int page = 1;   
		int limit = 8;
		String search = null;  
		String[] list =null;
		String checkType=null;
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
		
		if(request.getParameterValues("food_type") !=null) {
			list =request.getParameterValues("food_type");
			checkType ="food_type";
		}
		if(request.getParameterValues("nutrient_type") !=null) {
			list =request.getParameterValues("nutrient_type");
			checkType = "nutrient_type";
		}
		
		//세션에서 id를 가져옵니다.
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id"); 
		System.out.println("sessionid: " + userId);

		
		int listcount = foodDao.getfoodListCount(search,checkType,list);
		
		foodList = foodDao.getfoodList(page,limit,search,checkType,list);
		
		
		if(request.getParameter("updateDiet")!=null) {
			updateState = request.getParameter("updateDiet");
			String dcode = request.getParameter("dcode");
			updateDiet = foodDao.getDetailDiet(dcode);
			updateFoodList = foodDao.getUpdateFoodList(updateDiet.getDiet_form());
			updateSize=updateFoodList.size();
		}
		
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
			request.setAttribute("foodList", foodList);
			request.setAttribute("limit",limit);
			request.setAttribute("id",userId);
			request.setAttribute("checkType",checkType);
			request.setAttribute("checkList",list);
			request.setAttribute("searchText",search);
			
			request.setAttribute("updateState",updateState);
			request.setAttribute("updateDiet",updateDiet);
			request.setAttribute("updateFoodList",updateFoodList);
			request.setAttribute("updateSize",updateSize);
			/*
			 * for(FoodInfo f:foodList) { System.out.println("code : " + f.getFood_code());
			 * System.out.println("name : " + f.getFood_name());
			 * System.out.println("imgname : " + f.getFood_img_name());
			 * System.out.println("carb : " + f.getFood_carb()); System.out.println("fat : "
			 * + f.getFood_fat()); System.out.println("protein : " + f.getFood_protein());
			 * System.out.println("cal : " + f.getFood_cal() + "\n\n"); }
			 */		
			ActionForward forward =new ActionForward();
			forward.setRedirect(false);
			forward.setPath("navi/navi_compDiet.jsp");
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
			object.addProperty("checkType", checkType);
			object.addProperty("searchText", search);
			
			JsonElement je = new Gson().toJsonTree(foodList);
			System.out.println("foodList = " + je.toString());
			object.add("foodList",je);
			
			je = new Gson().toJsonTree(list);
			System.out.println("list = " + je.toString());
			object.add("list",je);
			
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append(object.toString());
			System.out.println(object.toString());
			return null;
		}
	}
}

