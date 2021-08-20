package sh.shDeit.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.*;

import com.sun.org.apache.bcel.internal.generic.Select;
import com.sun.xml.internal.ws.client.sei.ValueSetter;

import _comm.javabean.DietInfo;
import _comm.javabean.FoodInfo;


public class ShDietDAO {
	private DataSource ds;
	public ShDietDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:/comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 오픈 실패: " + ex);
			return;
		}
	}
	public int getShareListCount(String search,String nVal) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String select_sql="";
				
		try {
			conn = ds.getConnection();
			if(search == null) {
				//1.검색어와 체크박스 값이 둘다 없는 경우
				if(nVal == null) {
					select_sql = "select count(*) from diet_info";
					System.out.println("1. " + select_sql);
				}
				//2.검색어는 없지만 체크박스 값이 있는 경우 
				else {
					select_sql = "select count(*) from diet_info "
					           + " where " +nVal+" = GREATEST(diet_total_fat,diet_total_protein,diet_total_carb)";
					System.out.println("2. " + select_sql);
				}
				pstmt = conn.prepareStatement(select_sql);
			}
			else {
				//3.검색어는 있지만 체크박스 값이 없는 경우
				if(nVal == null) {
					select_sql = "select count(*) from diet_info where diet_name like ? ";
					System.out.println("3. " + select_sql);
				}
				//4.검색어도 있고 체크박스 값도 있는 경우 
				else {
					select_sql = "select count(*) from diet_info "
							   + " where diet_name like ? and "
					           + nVal +" = GREATEST(diet_total_fat,diet_total_protein,diet_total_carb)";
					System.out.println("4. " + select_sql);
				}
				pstmt = conn.prepareStatement(select_sql);
				pstmt.setString(1, "%"+search+"%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getShareListCount()실패 : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return x;
	}
	public List<DietInfo> getShareDietList(int page,int limit,String search,String nVal) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String shDiet_list_sql;
		
		List<DietInfo> list = new ArrayList<DietInfo>();

		int startrow = (page -1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		try {

			conn = ds.getConnection();
			if(search == null) {
				//1.검색어와 체크박스 값이 둘다 없는 경우
				if(nVal == null) {
					shDiet_list_sql = "SELECT * "
			           				+" FROM "
			           				+"     (SELECT ROWNUM RNUM,DIET_CODE,DIET_NAME,"
			           				+"      DIET_SHARE,DIET_TOTAL_CARB,DIET_RECOMM,DIET_FORM,"
			           				+"      DIET_TOTAL_FAT,DIET_TOTAL_PROTEIN,"
			           				+"      DIET_TOTAL_CAL  FROM "
			           				+"                      (SELECT * FROM DIET_INFO "
			           				+"						 ORDER BY DIET_RECOMM DESC) "
			           				+"     ) "
			           				+" WHERE RNUM>=? AND RNUM<=?";
					System.out.println("1. " + shDiet_list_sql);
				}
				//2.검색어는 없지만 체크박스 값이 있는 경우 
				else {
					shDiet_list_sql = "SELECT * "
			           				+" FROM "
			           				+"     (SELECT ROWNUM RNUM,DIET_CODE,DIET_NAME,"
			           				+"      DIET_SHARE,DIET_TOTAL_CARB,DIET_RECOMM,DIET_FORM,"
			           				+"      DIET_TOTAL_FAT,DIET_TOTAL_PROTEIN,"
			           				+"      DIET_TOTAL_CAL  FROM "
			           				+"                      (SELECT * FROM DIET_INFO "
			           				+"						 WHERE "+ nVal+" = GREATEST(diet_total_fat,diet_total_protein,diet_total_carb)"   
			           				+"                       ORDER BY DIET_RECOMM DESC) "
			           				+"     ) "
			           				+" WHERE RNUM>=? AND RNUM<=?";
					System.out.println("2. " + shDiet_list_sql);
				}
				
				pstmt = conn.prepareStatement(shDiet_list_sql);
				pstmt.setInt(1,startrow);
				pstmt.setInt(2,endrow);
			}
			else {
				//3.검색어는 있지만 체크박스 값이 없는 경우
				if(nVal == null) {
					shDiet_list_sql = "SELECT * "
			           				+" FROM "
			           				+"     (SELECT ROWNUM RNUM,DIET_CODE,DIET_NAME,"
			           				+"      DIET_SHARE,DIET_TOTAL_CARB,DIET_RECOMM,DIET_FORM,"
			           				+"      DIET_TOTAL_FAT,DIET_TOTAL_PROTEIN,"
			           				+"      DIET_TOTAL_CAL  FROM "
			           				+"                      (SELECT * FROM DIET_INFO "
			           				+"                       WHERE 	DIET_NAME LIKE ? "
			           				+"						 ORDER BY DIET_RECOMM DESC) "
			           				+"     ) "
			           				+" WHERE RNUM>=? AND RNUM<=?";
					System.out.println("3. " + shDiet_list_sql);
				}
				//4.검색어도 있고 체크박스 값도 있는 경우 
				else {
					shDiet_list_sql = "SELECT * "
			           				+" FROM "
			           				+"     (SELECT ROWNUM RNUM,DIET_CODE,DIET_NAME,"
			           				+"      DIET_SHARE,DIET_TOTAL_CARB,DIET_RECOMM,DIET_FORM,"
			           				+"      DIET_TOTAL_FAT,DIET_TOTAL_PROTEIN,"
			           				+"      DIET_TOTAL_CAL  FROM "
			           				+"                      (SELECT * FROM DIET_INFO "
			           				+"                       WHERE 	DIET_NAME LIKE ? "
			           				+"						 AND "+ nVal+" = GREATEST(diet_total_fat,diet_total_protein,diet_total_carb)"   
			           				+"						 ORDER BY DIET_RECOMM DESC) "
			           				+"     ) "
			           				+" WHERE RNUM>=? AND RNUM<=?";
					System.out.println("4. " + shDiet_list_sql);
				}
				
				pstmt = conn.prepareStatement(shDiet_list_sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2,startrow);
				pstmt.setInt(3,endrow);
			
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DietInfo d = new DietInfo();
				d.setDiet_code(rs.getString("diet_code"));
				d.setDiet_name(rs.getString("diet_name"));
				if(rs.getInt("diet_share")==1)
					d.setDiet_share(true);
				else
					d.setDiet_share(false);
				d.setDiet_recomm(rs.getInt("diet_recomm"));
				d.setDiet_total_carb(rs.getInt("diet_total_carb"));
				d.setDiet_total_fat(rs.getInt("diet_total_fat"));
				d.setDiet_total_protein(rs.getInt("diet_total_protein"));
				d.setDiet_total_cal(rs.getInt("diet_total_cal"));
				d.setDiet_form(rs.getString("diet_form"));
				list.add(d);
			}
			
			//현재 공유 식단 정보에서 출력할 이미지를 구성 식자재중 첫번쨰 식자재의 이미지를 사용
			
			pstmt.close(); String
			img_sql="select food_img_name from food_info where food_code = ?"; pstmt =
			conn.prepareStatement(img_sql);	 
			for(DietInfo data:list) {
				String food_code=data.getDiet_form().split(",")[0];
				System.out.println("food_code : " + food_code);
				pstmt.setInt(1,Integer.parseInt(food_code)); rs = pstmt.executeQuery();
				if(rs.next()) { data.setDiet_img_name(rs.getString(1)); }
				 
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("getShareDietList() 실패  : " + e);
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
		return list;
	}
	public int shareDietAddLike(String liksCode,String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result=0;
		ResultSet rs =null;
		try {
			String find_sql = "select count(*) from like_info where id =? and like_code = ?";
			System.out.println(find_sql);
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(find_sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, liksCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getInt(1) == 0) {
					System.out.println("좋아요를 누른 식단이 아닙니다.");
					pstmt.close();
					String max_sql = "(select nvl(max(like_num),0)+1 from like_info)";
					String insert_sql = " INSERT INTO LIKE_INFO"
						       		  + " VALUES("+max_sql+",?,?)";
					System.out.println(insert_sql);
					pstmt = conn.prepareStatement(insert_sql);
					pstmt.setString(1, userId);
					pstmt.setString(2, liksCode);
					int numline = pstmt.executeUpdate();
					System.out.println("num : " + numline);
					if(numline == 1) {
						System.out.println("insert success");
						pstmt.close();
						String sql = "UPDATE DIET_INFO "
							       + "SET DIET_RECOMM = DIET_RECOMM + 1 "
								   + "WHERE DIET_CODE = ? ";
						System.out.println(sql);
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, liksCode);
						result = pstmt.executeUpdate();
						if(result == 1) {
							conn.commit();
							System.out.println("update success");
						}else {
							conn.rollback();
						}
					}
				}
			}
		}catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("shareDietAddLike() 실패  :" + ex);
			if(conn != null) {
				try {
					conn.rollback();
				}catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
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
					conn.setAutoCommit(true);
					conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	public int addDietList(String addDietCode,String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result=0;
		ResultSet rs =null;
		try {
			String find_sql = "select count(*) from cart_info where id =? and cart_code = ?";
			System.out.println(find_sql);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(find_sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, addDietCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getInt(1) == 0) {
					System.out.println("이전에 담은 식단이 아닙니다.");
					pstmt.close();
					String max_sql = "(select nvl(max(cart_num),0)+1 from cart_info)";
					String insert_sql = " INSERT INTO CART_INFO"
						       		  + " VALUES("+max_sql+",?,?)";
					System.out.println(insert_sql);
					pstmt = conn.prepareStatement(insert_sql);
					pstmt.setString(1, userId);
					pstmt.setString(2, addDietCode);
					result = pstmt.executeUpdate();
					if(result == 1)
						System.out.println("insert success");
				}
			}
		}catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("addDietList() 실패  :" + ex);
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
		return result;
	}
}
