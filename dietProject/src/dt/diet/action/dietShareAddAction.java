package dt.diet.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _comm.javabean.DietInfo;
import dt.diet.db.DietDAO;


public class dietShareAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DietDAO dietdao = new DietDAO();
		List<DietInfo> diList = new ArrayList<DietInfo>();

		int page = 1;   
		int limit = 4;
		String search = null;  
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("page : " + page);
		System.out.println("limit" + limit);
		if(request.getParameter("search") !=null) {
			search =request.getParameter("search");
		}
		System.out.println("search : " + search);
		
		//세션에서 id를 가져옵니다.
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id"); 
		
		System.out.println("sessionid: " + userId);

		//내가 작성한 식단 리스트 갯수와 정보를 가져옴.
		int listcount = dietdao.getShareDietAddListCount(userId,search);
		diList = dietdao.getShareDietAddList(page,limit,userId,search);
		
		int maxpage=(listcount + limit-1)/limit;
		System.out.println("maxPage : " + maxpage);
		

		int startpage = ((page-1)/10) * 10+1;
		System.out.println("startpage"+ startpage);
		
		int endpage = startpage + 10 -1;
		System.out.println("endPage" + endpage);
		

		if(endpage > maxpage)
			endpage = maxpage;
		
		request.setAttribute("page",page); 
		request.setAttribute("maxpage",maxpage);
		

		request.setAttribute("startpage",startpage);
		

		request.setAttribute("endpage",endpage);
		
		request.setAttribute("listcount",listcount);
		request.setAttribute("diList", diList);
		request.setAttribute("limit",limit);
		request.setAttribute("id",userId);
		ActionForward forward =new ActionForward();
	    forward.setRedirect(false);
	    forward.setPath("mypage/mypage_ShareDietAddPage.jsp");
		return forward;
	}
}

