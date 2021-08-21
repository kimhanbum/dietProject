package to.today.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.*;
import javax.sql.*;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import _comm.javabean.Commondiet;
import _comm.javabean.DietInfo;
import _comm.javabean.MealInfo;
import _comm.javabean.TotalInfo;


/*
   DAO 클래스(Data Access Object)
   -데이터 베이스와 연동하여 레코드의 추가 ,수정,삭제 작업이 이뤄지는 클래스입니다.
 */
public class TodayDAO {
	private DataSource ds;
	public TodayDAO() {
		try {
			//Context.xml에 리소스를 생성해 놓은 (JNDI에 설정해 놓은) jdbc/OracleDB를
			//참조하여 Connection 객체를 얻어 옵니다.
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:/comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	
	public TotalInfo getTotalInfo(String userid, String date) {
	//토탈인포클래스 타입의 변수 토탈
		TotalInfo total = null; 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from total_info "
			                           + "where id= ?" 
			                           + "and to_date(total_date, 'YY/MM/DD') = ?");
			pstmt.setString(1, userid);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			    //변수이름.set(가져올 컬럼) 저장하기
				total = new TotalInfo();
			    total.setId(rs.getString("id"));
			    total.setTotal_date(rs.getString("total_date"));
			    total.setTotal_bf(rs.getString("total_bf"));
			    total.setTotal_lunch(rs.getString("total_lunch"));
			    total.setTotal_dinner(rs.getString("total_dinner"));
			    total.setTotal_snack(rs.getString("total_snack"));
			    total.setTotal_water(rs.getInt("total_water"));
			    total.setTotal_weight(rs.getInt("total_weight"));
			    total.setTotal_workout(rs.getString("total_workout"));
			    total.setTotal_carb(rs.getInt("total_carb"));
			    total.setTotal_fat(rs.getInt("total_fat"));
			    total.setTotal_protein(rs.getInt("total_protein"));
			    total.setTotal_cal(rs.getInt("total_cal"));
			}
		} catch (Exception ex) {
			System.out.println("getTotalInfo() 에러: " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		} return total;
	} //TotalInfo() 메서드 end


	
	public DietInfo getDietInfo(String code) {
		Commondiet comdiet = null;
		DietInfo diet = new DietInfo();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from diet_info where diet_code=?");
			pstmt.setString(1, code);
			//실행                
			rs = pstmt.executeQuery();
			if (rs.next()) {  
				comdiet = new Commondiet();
			    //변수이름.set(쓸 변수 값) 저장하기
				comdiet.setName(rs.getString("name"));
				comdiet.setForm(rs.getString("form"));
			    comdiet.setCarb(rs.getInt("carb"));
			    comdiet.setFat(rs.getInt("fat"));
			    comdiet.setPro(rs.getInt("pro"));
			    comdiet.setCal(rs.getInt("cal"));
			    
			    diet.setId(rs.getString("id"));
			    diet.setDiet_code(rs.getString("diet_code"));
			    diet.setDiet_name(rs.getString("diet_name"));
			    diet.setDiet_form(rs.getString("diet_form"));
			    diet.setDiet_recomm(rs.getInt("diet_recomm"));
			    diet.setDiet_total_carb(rs.getInt("diet_total_carb"));
			    diet.setDiet_total_fat(rs.getInt("diet_total_fat"));
			    diet.setDiet_total_protein(rs.getInt("diet_total_protein"));
			    diet.setDiet_total_cal(rs.getInt("diet_total_cal"));
			    diet.setDiet_date(rs.getString("diet_date"));
			    if(rs.getInt("diet_share") == 0) {
			    	diet.setDiet_share(false);
			    }else if(rs.getInt("diet_share") == 1) {
			    	diet.setDiet_share(true);
			    } return diet;
			    
			}
		} catch (Exception ex) {
			System.out.println("getDietlInfo() 에러: " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		} return diet;
		
	}

	
	

	public MealInfo getMealInfo(String code) {
        Commondiet comdiet = null;
        MealInfo meal = new MealInfo();
        Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from meal_info where meal_code=?");
			pstmt.setString(1, code);		
			           //실행                
			rs = pstmt.executeQuery();
			if (rs.next()) { 
				comdiet = new Commondiet();
			    //변수이름.set(쓸 변수 값) 저장하기
				comdiet.setName(rs.getString("name"));
			    comdiet.setCarb(rs.getInt("carb"));
			    comdiet.setFat(rs.getInt("fat"));
			    comdiet.setPro(rs.getInt("pro"));
			    comdiet.setCal(rs.getInt("cal"));
			    comdiet.setImgname(rs.getString("img_name"));
			    
			    meal.setMeal_code(rs.getString("meal_code"));
			    meal.setMeal_name(rs.getString("meal_name"));
			    meal.setMeal_img_name(rs.getString("meal_img_name"));
			    meal.setMeal_carb(rs.getInt("meal_carb"));
			    meal.setMeal_fat(rs.getInt("meal_fat"));
			    meal.setMeal_protein(rs.getInt("meal_protein"));
			    meal.setMeal_cal(rs.getInt("meal_cal"));
			}
		} catch (Exception ex) {
			System.out.println("getMealInfo() 에러: " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		} return meal;
	}
	

	public JsonArray getMonthTotalData(String userId,String yearMonth) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		JsonObject object = null;
		JsonArray jArray = new JsonArray();
		String select_sql =" SELECT TOTAL_BF,TOTAL_LUNCH,TOTAL_DINNER,TOTAL_SNACK, "
				          +" TOTAL_WATER, TO_CHAR(TOTAL_DATE,'YYYY-MM-DD') YEARMONTH "
						  +" FROM TOTAL_INFO "
						  + "WHERE TO_CHAR(TOTAL_DATE,'YYYY/MM') = ? "
						  + "AND ID = ? ";
		
		//"where to_char(hiredate,'YYMM') = '8111'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setString(1,yearMonth);
			pstmt.setString(2,userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("TOTAL_BF") != null) {
					object =new JsonObject();
					object.addProperty("title","1.아침");
					object.addProperty("start",rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "green");
					jArray.add(object);
				}
				if(rs.getString("TOTAL_LUNCH") != null) {
					object =new JsonObject();
					object.addProperty("title","2.점심");
					object.addProperty("start",rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "orange");
					jArray.add(object);
					
				}
				if(rs.getString("TOTAL_DINNER") != null) {
					object =new JsonObject();
					object.addProperty("title","3.저녁");
					object.addProperty("start",rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "yellow");
					jArray.add(object);
				}
				if(rs.getString("TOTAL_SNACK") != null) {
					object =new JsonObject();
					object.addProperty("title","4.간식");
					object.addProperty("start",rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "blue");
					jArray.add(object);
				}
				if(rs.getString("TOTAL_WATER") != null) {
					object =new JsonObject();
					object.addProperty("title","5.물");
					object.addProperty("start",rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "pink");
					jArray.add(object);
				}
			}
		}catch (Exception ex) {
			System.out.println("getFoodDetail() 실패 :  " + ex);
		}finally {
			try {
				if(rs != null) 
					rs.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if(pstmt != null) 
					pstmt.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if(conn != null) 
					conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return jArray;
	}

}



