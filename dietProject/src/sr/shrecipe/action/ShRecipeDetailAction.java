package sr.shrecipe.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _comm.javabean.RecipeInfo;
import sr.shrecipe.db.ShRecipeDAO;

public class ShRecipeDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward =new ActionForward();
		int recipeCode= Integer.parseInt(request.getParameter("recipeCode"));
		
		RecipeInfo recipeInfo= new RecipeInfo();
		ShRecipeDAO dao= new ShRecipeDAO();
		
		recipeInfo= dao.getDetailRecipeInfo(recipeCode);
		
		
		if(recipeInfo==null) {
			System.out.println("상세보기 실패");
			 forward.setRedirect(false);
			 request.setAttribute("message", "데이터를 읽지 못했습니다.");
			 forward.setPath("error/error.jsp");
			 return forward;
		}
		System.out.println("상세보기 성공");
		String[] imglist=recipeInfo.getRecipe_file().split(",");
		request.setAttribute("recipeInfo", recipeInfo);
		request.setAttribute("imglist", imglist);
		forward.setRedirect(false);
		forward.setPath("navi/recipeDetailform.jsp");
		return forward;// TODO Auto-generated method stub
		
	}

}
