package sr.shrecipe.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import _comm.javabean.RecipeInfo;
import sr.shrecipe.db.ShRecipeDAO;

public class ShRecipeInsertProcessAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward =new ActionForward();
	    ShRecipeDAO dao= new ShRecipeDAO();
	    RecipeInfo recipeInfo= new RecipeInfo();
	    boolean result=false;
	    
	    
	    String realFolder="";
	    String saveFolder="images";
	    int fileSize= 5*1024*1024;
	    ServletContext sc= request.getServletContext();
	    realFolder= sc.getRealPath(saveFolder);
	    System.out.println("realFolder = " + realFolder);
	    
	    
	    
	    try {
	    	 MultipartRequest multi = new MultipartRequest(request,realFolder,
	    			                                        fileSize,"utf-8",
	    			                                        new DefaultFileRenamePolicy());
	    	 
	    	 recipeInfo.setId(multi.getParameter("id"));
	    	 recipeInfo.setRecipe_subject(multi.getParameter("recipe_subject"));
	    	 recipeInfo.setRecipe_content(multi.getParameter("recipe_content"));
	    	 recipeInfo.setRecipe_summary(multi.getParameter("recipe_summary"));
	    	  
	         recipeInfo.setRecipe_file(multi.getParameter("recipefile"));
	    	 System.out.println("이미지 이름:" + multi.getParameter("recipefile") );
	         result=dao.recipeAdd(recipeInfo);
	         
	         if(result==false) {
	        	 System.out.println("레시피 등록 실패입니다");
	        	 forward.setPath("error/error.jsp");
	        	 request.setAttribute("message", "레시피 등록 실패 입니다.");
	             forward.setRedirect(false);
	             return forward;
	         }
	         System.out.println("레시피 등록 완료");
	         response.setContentType("text/html;charset=utf-8");
	         PrintWriter out= response.getWriter();
	         out.println("<script>");
	         out.println("alert('레시피 등록 완료 하였습니다');");
	         out.println("location.href='shareRecipe.sr'");
	         out.println("</script>");
	         out.close();		 
	         
	         return null;
	    	 
	    	
	    }catch(IOException ex) {
			forward.setPath("error/error.jsp");
			request.setAttribute("message","레시피 추가 실패입니다");
			forward.setRedirect(false);
			return forward;
			
		}
	   

		
	}
}

