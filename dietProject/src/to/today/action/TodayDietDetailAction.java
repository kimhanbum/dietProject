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
import to.today.db.TodayDAO;

public class TodayDietDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//�ڷ���        �����̸� --����   -- ���� �ڷ��� ����
				TotalInfo totalinfo = new TotalInfo(); //�ش����̺� ���� �޾ƿ����� ��
				TodayDAO todaydao = new TodayDAO(); //db���� �������� �޼ҵ� ����ؼ� ���� ������(����,���,�����)
				
				
			    Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date(System.currentTimeMillis()));
				String today1 = new SimpleDateFormat("yy/MM/dd").format(cal.getTime()); 
				System.out.println(today1);

				//db ����                                                               ���ڰ�
				totalinfo = todaydao.getTotalInfo("user001", today1);
				
				System.out.println(totalinfo.getId());
				System.out.println(totalinfo.getTotal_date());
				System.out.println(totalinfo.getTotal_bf());
				System.out.println(totalinfo.getTotal_lunch());
				System.out.println(totalinfo.getTotal_dinner());
				System.out.println(totalinfo.getTotal_snack());
				System.out.println(totalinfo.getTotal_fat());
				System.out.println(totalinfo.getTotal_carb());
				System.out.println(totalinfo.getTotal_cal());
				
				
				//��ȯ���� ���� Ÿ�� string���� �޾��ش�
			   String bf = totalinfo.getTotal_bf();
			   String lunch = totalinfo.getTotal_lunch();
			   String dinner = totalinfo.getTotal_dinner();
			   String snack = totalinfo.getTotal_snack();
			    
			   MealInfo meal;
			   DietInfo diet;
			   String id = "";
			   if(bf.contains("M")) {
				   meal = todaydao.getMealInfo(bf);
			   		System.out.println("M�� ���ԵǾ� MealInfo���� ������ �����Խ��ϴ�.");
			   		System.out.println(meal.getMeal_name());
			   }else if(bf.contains("D")){
				   diet = todaydao.getDietInfo(bf);
				   System.out.println("D�� ���ԵǾ� DietInfo���� ������ �����Խ��ϴ�.");
				   System.out.println(diet.getDiet_name());
				   
			   }
			   
			   
			   

/*			   
			   todaydao.getDietInfo(tablename,code,bf,id);
			   
			   if(lunch.contains("M")) {
				   tablename = "meal_info";
				   code = "meal_code";
			   		System.out.println("���ڰ� ���ԵǾ� �ֽ��ϴ�.");
			   }else if(lunch.contains("D")){
				   tablename = "diet_info";
				   code = "diet_code";
				   System.out.println("���ڰ� ���ԵǾ� ���� �ʽ��ϴ�.");
			   }
			   String sql2="select * from meal_info inner join total_info\r\n" + 
			   		"on meal_code = total_lunch\r\n" + 
			   		"where total_info.id= 'user002'";
			   
			   if(dinner.contains("M")) {
				   tablename = "meal_info";
				   code = "diet_code";
			   		System.out.println("���ڰ� ���ԵǾ� �ֽ��ϴ�.");
			   }else if(dinner.contains("D")){
				   tablename = "diet_info";
				   code = "meal_code";
				   System.out.println("���ڰ� ���ԵǾ� ���� �ʽ��ϴ�.");
			   }
			   String sql3="select * from meal_info inner join total_info\r\n" + 
			   		"on meal_code = total_dinner\r\n" + 
			   		"where total_info.id= 'user002'";
			   
			   if(snack.contains("M")) {
				   //d�ϰ�� dietinfo���� ���� �����´�. ���̺���ȸ DAO���� �޼ҵ� �����
				   System.out.println("���ڰ� ���ԵǾ� �ֽ��ϴ�.");
			   }else {
				   //m�ϰ�� mealinfo���� ���� �����´�.DAO���� �޼ҵ� �����
				   System.out.println("���ڰ� ���ԵǾ� ���� �ʽ��ϴ�.");
			   }
			   
*/			   
			   
			   
			   //select �� ���صǴ°� code
			   //bf,lunch,dinner,snack 4�� d,m ��ȸ (if��)
			   //���� �޾ƿͼ� request�� ����
			   //��ħ�������ᰣ�� ���� 4�� ����
			   
			   //d3,dietinfo    m1,mealinfo �� �޾��ش�.
//			   MealInfo mealinfo = new MealInfo();

//			   String code = new String();
//			   System.out.println("code =" + code);
//			   mealinfo = todaydao.getMealInfo(code);
//			   System.out.println(mealinfo.);
			   
			   
			   
			   
			   
			   
			   
		/*
		 * DietInfo dietinfo1 = new DietInfo();
		 * 
		 * 
		 * 
		 * 
		 * DietInfo dietinfo2 = new DietInfo(); DietInfo dietinfo3 = new DietInfo();
		 * 
		 */			   
				//d Ȥ�� m ���� �����ϴ��� �Ǵ��Ѵ�.
			    //d �� �����Ұ�� DietInfo ���̺��� ������ �����´�
			    //m ���� ������ ��� MealInfo ���̺��� ������ �����´�
			    // DietInfo ���̺��� ������ ������ ���   DietInfo ��ȯ������ �޾��ش�
			   // MealInfo ���̺��� ������ ������ ���   MealInfo ��ȯ������ �޾��ش�
		/*
		 * String meal_co = mealinfo.getMeal_code(); String diet_co1 =
		 * dietinfo1.getDiet_code(); String diet_co2 = dietinfo2.getDiet_code(); String
		 * diet_co3 = dietinfo3.getDiet_code();
		 */				
			 //totalinfo=null;//error�׽�Ʈ�� ���� �� ����
			    //DAO���� ���� ������ ���� ������ ��� null�� ��ȯ�մϴ�.
		/*
		 * if(totalinfo==null) { System.out.println("�󼼺��� ����"); ActionForward forward =
		 * new ActionForward(); forward.setRedirect(false);
		 * request.setAttribute("message", "�����͸� ���� ���߽��ϴ�.");
		 * forward.setPath("error/error.jsp"); return forward; }
		 * System.out.println("�󼼺��� ����");
		 */		   
			   
			   
			   
				
				//totalinfo ��ü�� request ��ü��  ��´�
				//                     ���̵�                  ����������
		/*
		 * request.setAttribute("totalinfo", totalinfo);
		 * request.setAttribute("dietinfo", dietinfo1); request.setAttribute("dietinfo",
		 * dietinfo2); request.setAttribute("dietinfo", dietinfo3);
		 * request.setAttribute("mealinfo", mealinfo);
		 */				
				ActionForward forward =new ActionForward();
				forward.setRedirect(false);
				// Today �Ĵ����� �̵��ϱ� ���� ��θ� �����մϴ�.
				forward.setPath("mypage/mypage_todayDiet.jsp");
				return forward;
	}
}

