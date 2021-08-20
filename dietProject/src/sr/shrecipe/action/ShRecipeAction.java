package sr.shrecipe.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _comm.javabean.RecipeInfo;
import sr.shrecipe.db.ShRecipeDAO;

public class ShRecipeAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward =new ActionForward();
		RecipeInfo recipeInfo= new RecipeInfo();
		ShRecipeDAO sdao= new ShRecipeDAO();
		
		 sdao.getShareReciped();
		
		
		
		
		
		
		forward.setRedirect(false);		
		forward.setPath("navi/navi_shareRecipe.jsp");
		return forward;
	}
}

