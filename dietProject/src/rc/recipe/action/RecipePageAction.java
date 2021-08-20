package rc.recipe.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _comm.javabean.RecipeInfo;
import rc.recipe.db.RecipeDAO;

public class RecipePageAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward =new ActionForward();
		RecipeDAO recipedao=new RecipeDAO();
		List<RecipeInfo> recipeList= new ArrayList<RecipeInfo>();
		int page=1;
		int limit=8;
		
		if(request.getParameter("page")!=null) {
		 page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount =  recipedao.getListCount();
		
		recipeList= recipedao.getRecipeList(page,limit);
		
		
		
		
		
	     PrintWriter out = response.
		
		forward.setRedirect(false);
		forward.setPath("");
		return forward;
	}
}

