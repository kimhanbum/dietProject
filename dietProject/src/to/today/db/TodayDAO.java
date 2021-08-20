package to.today.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.*;
import javax.sql.*;

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
}



