package sr.shrecipe.action;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import _comm.javabean.RecipeInfo;
import sr.shrecipe.db.ShRecipeDAO;

public class ShRecipeAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward =new ActionForward();
		List<RecipeInfo> recipeList= new ArrayList<RecipeInfo>();
		ShRecipeDAO dao= new ShRecipeDAO();
		
		int page=1;
		int limit=8;
		String state=request.getParameter("state");
		
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("limit")!=null){
			limit=Integer.parseInt(request.getParameter("limit"));
		}
		System.out.println("넘어온 page=" + page);
		System.out.println(" 현재 limit=" + limit);
		
		int listCount= dao.getRecipeListCount();
		recipeList= dao.getRecipeList(page,limit);
		System.out.println("listCount=" + listCount);
		int maxPage= (listCount + limit -1)/limit;
		System.out.println("Maxpage=" + maxPage);
		
		int startPage= (page-1)/5*5+1;
		
		int endPage= startPage+5-1;
		
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
	  if(state==null) {
		  System.out.println("state=" + state );
		  request.setAttribute("page",page);
		  request.setAttribute("maxPage", maxPage);
		  request.setAttribute("limte", limit);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  request.setAttribute("recipeList", recipeList);
		  request.setAttribute("listCount", listCount);
		 
		  
		  System.out.println("1");
	
		  forward.setRedirect(false);
		  forward.setPath("navi/navi_shareRecipe.jsp");
		  return forward;
	  }else {
		  
		  System.out.println("state=" + state);
		  JsonObject object= new JsonObject();
		  object.addProperty("page", page);
		  object.addProperty("maxPage", maxPage);
		  object.addProperty("limit", limit);
		  object.addProperty("startPage", startPage);
		  object.addProperty("endPage", endPage);
		  object.addProperty("listCount", listCount);
		   
		  JsonElement je= new Gson().toJsonTree(recipeList);
		  object.add("recipeList", je);
		  
		  response.setContentType("text/html;charset:utf-8");
		  response.getWriter().append(object.toString());
		  System.out.println(object.toString());
		  
		  return null;
		  
	  }
	}
}

