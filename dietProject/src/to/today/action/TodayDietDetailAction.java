package to.today.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _comm.javabean.DietInfo;
import _comm.javabean.MealInfo;
import _comm.javabean.TotalInfo;
import net.member.action.ActionForward;
import to.today.db.TodayDAO;

public class TodayDietDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//�ڷ���        �����̸� --����   -- ���� �ڷ��� ����
				TotalInfo totalinfo = new TotalInfo(); //�ش����̺� ���� �޾ƿ����� ��
				DietInfo dietinfo = new DietInfo();
				MealInfo mealinfo = new MealInfo();
				TodayDAO todaydao = new TodayDAO(); //db���� �������� �޼ҵ� ����ؼ� ���� ������(����,���,�����)
				
				
			    Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date(System.currentTimeMillis()));
				String today1 = new SimpleDateFormat("yy/MM/dd").format(cal.getTime()); 
				System.out.println(today1);

				//db ����                                                               ���ڰ�
				totalinfo = todaydao.getTotalInfo("user001", today1);
				
				totalinfo = todaydao.getDietInfo("d1");
				totalinfo = todaydao.getMealInfo("m22");
				
				
				
				
				//��ȯ���� ���� Ÿ�� string���� �޾��ش�
			   String bf = totalinfo.getTotal_bf();
			   String lunch = totalinfo.getTotal_lunch();
			   String dinner = totalinfo.getTotal_dinner();
			   String snack = totalinfo.getTotal_snack();
				
			   
				//d Ȥ�� m ���� �����ϴ��� �Ǵ��Ѵ�.
			    //d �� �����Ұ�� DietInfo ���̺��� ������ �����´�
			    //m ���� ������ ��� MealInfo ���̺��� ������ �����´�
			    // DietInfo ���̺��� ������ ������ ���   DietInfo ��ȯ������ �޾��ش�
			   // MealInfo ���̺��� ������ ������ ���   MealInfo ��ȯ������ �޾��ش�
			   String meal_co = mealinfo.getMeal_code();
			   String diet_co = dietinfo.getDiet_code();
				
			 //totalinfo=null;//error�׽�Ʈ�� ���� �� ����
			    //DAO���� ���� ������ ���� ������ ��� null�� ��ȯ�մϴ�.
				if(totalinfo==null) {
					System.out.println("�󼼺��� ����");
					ActionForward forward = new ActionForward();
					forward.setRedirect(false);
					request.setAttribute("message", "�����͸� ���� ���߽��ϴ�.");
					forward.setPath("error/error.jsp");
					return forward;
				}
				System.out.println("�󼼺��� ����");
			   
			   
			   
			   
				
				//totalinfo ��ü�� request ��ü�� �����մϴ�. 
				//                     ���̵�                  ����������
				request.setAttribute("totalinfo", totalinfo);
				request.setAttribute("diteinfo", dietinfo);
				request.setAttribute("mealinfo", mealinfo);
				
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today �Ĵ����� �̵��ϱ� ���� ��θ� �����մϴ�.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

