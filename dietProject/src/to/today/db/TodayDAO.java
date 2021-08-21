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


	
	public Commondiet getDietInfo(String code) {
		Commondiet comdiet = null;
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
				comdiet.setName(rs.getString("DIET_NAME"));
				comdiet.setForm(rs.getString("DIET_FORM"));
			    comdiet.setCarb(rs.getInt("DIET_TOTAL_CARB"));
			    comdiet.setFat(rs.getInt("DIET_TOTAL_FAT"));
			    comdiet.setPro(rs.getInt("DIET_TOTAL_PROTEIN"));
			    comdiet.setCal(rs.getInt("DIET_TOTAL_CAL"));
			    
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
		} 
		return comdiet;
	}

	
	

	public Commondiet getMealInfo(String code) {
        Commondiet comdiet = null;
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
				comdiet.setName(rs.getString("MEAL_NAME"));
			    comdiet.setCarb(rs.getInt("MEAL_CARB"));
			    comdiet.setFat(rs.getInt("MEAL_FAT"));
			    comdiet.setPro(rs.getInt("MEAL_PROTEIN"));
			    comdiet.setCal(rs.getInt("MEAL_CAL"));
			    comdiet.setImgname(rs.getString("MEAL_IMG_NAME"));
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
		} return comdiet;
	}
}



