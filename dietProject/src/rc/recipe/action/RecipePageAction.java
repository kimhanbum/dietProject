package rc.recipe.action;
 
import java.io.IOException;
import java.io.PrintWriter;
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
		
		forward.setRedirect(false);
		forward.setPath("");
		return forward;
	}
}

