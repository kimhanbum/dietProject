package cf.config.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.*;

import com.google.gson.JsonObject;

import _comm.javabean.DietInfo;
import _comm.javabean.FoodInfo;


public class ConfigDAO {
	private DataSource ds;
	public ConfigDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:/comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 :  " + ex);
			return;
		}
	}
	public int getfoodListCount(String search,String type,String[] check) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String select_sql="";
				
		try {
			conn = ds.getConnection();
			if(search == null) {
				//1.검색어와 체크박스 값이 둘다 없는 경우
				if(type == null) {
					select_sql = "select count(*) from food_info";
					System.out.println("1. " + select_sql);
				}
				//2.검색어는 없지만 체크박스 값이 있는 경우 
				else {
					select_sql = "select count(*) from food_info where ";
					for(int i=0;i<check.length;i++) 
					{
						select_sql+=type +" = "+ check[i];
						if((i+1)!=check.length) {
							select_sql+=" or ";
						}
					}
					System.out.println("2. " + select_sql);
				}
				pstmt = conn.prepareStatement(select_sql);
			}
			else {
				//3.검색어는 있지만 체크박스 값이 없는 경우
				if(type == null) {
					select_sql = "select count(*) from food_info where food_name like ? ";
					System.out.println("3. " + select_sql);
				}
				//4.검색어도 있고 체크박스 값도 있는 경우 
				else {
					select_sql = "select count(*) from food_info where food_name like ? and ( ";
					for(int i=0;i<check.length;i++) 
					{
						select_sql+=type +" = "+ check[i];
						if((i+1)!=check.length) {
							select_sql+=" or ";
						}
					}
					select_sql +=" )";
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
			System.out.println("getfoodListCount()실패 : " + e);
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

	public List<FoodInfo> getfoodList(int page,int limit,String search,String type,String[] check) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String food_list_sql;
		
		List<FoodInfo> list = new ArrayList<FoodInfo>();

		int startrow = (page -1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		try {

			conn = ds.getConnection();
			if(search == null) {
				//1.검색어와 체크박스 값이 둘다 없는 경우
				if(type == null) {
					food_list_sql = "SELECT * "
	           				+"FROM "
	           				+"     (SELECT ROWNUM RNUM,FOOD_CODE,FOOD_NAME,"
	           				+"      FOOD_IMG_NAME,FOOD_CARB,"
	           				+"      FOOD_FAT,FOOD_PROTEIN,"
	           				+"      FOOD_CAL FROM "
	           				+"               (SELECT * FROM FOOD_INFO "
	           				+"                ORDER BY FOOD_CODE ASC) "
	           				+"     ) "
	           				+" WHERE RNUM>=? AND RNUM<=?";
					System.out.println("1. " + food_list_sql);
				}
				//2.검색어는 없지만 체크박스 값이 있는 경우 
				else {
					food_list_sql = "SELECT * "
	           				+"FROM "
	           				+"     (SELECT ROWNUM RNUM,FOOD_CODE,FOOD_NAME,"
	           				+"      FOOD_IMG_NAME,FOOD_CARB,"
	           				+"      FOOD_FAT,FOOD_PROTEIN,"
	           				+"      FOOD_CAL FROM "
	           				+"               (SELECT * FROM FOOD_INFO "
							+"                WHERE ";

					for(int i=0;i<check.length;i++) 
					{
						food_list_sql+=type +" = "+ check[i];
						if((i+1)!=check.length) {
							food_list_sql+=" OR ";
						}
					}
					food_list_sql +="         ORDER BY FOOD_CODE ASC) "
	           				+"     ) "
	           				+" WHERE RNUM>=? AND RNUM<=?";
					System.out.println("2. " + food_list_sql);
				}
				
				pstmt = conn.prepareStatement(food_list_sql);
				pstmt.setInt(1,startrow);
				pstmt.setInt(2,endrow);
			}
			else {
				//3.검색어는 있지만 체크박스 값이 없는 경우
				if(type == null) {
					food_list_sql = "SELECT * "
	           				+"FROM "
	           				+"     (SELECT ROWNUM RNUM,FOOD_CODE,FOOD_NAME,"
	           				+"      FOOD_IMG_NAME,FOOD_CARB,"
	           				+"      FOOD_FAT,FOOD_PROTEIN,"
	           				+"      FOOD_CAL FROM "
	           				+"               (SELECT * FROM FOOD_INFO "
	           				+"				  WHERE FOOD_NAME LIKE ? "
	           				+"                ORDER BY FOOD_CODE ASC) "
	           				+"     ) "
	           				+" WHERE RNUM>=? AND RNUM<=?";
					System.out.println("3. " + food_list_sql);
				}
				//4.검색어도 있고 체크박스 값도 있는 경우 
				else {
					food_list_sql = "SELECT * "
	           				+"FROM "
	           				+"     (SELECT ROWNUM RNUM,FOOD_CODE,FOOD_NAME,"
	           				+"      FOOD_IMG_NAME,FOOD_CARB,"
	           				+"      FOOD_FAT,FOOD_PROTEIN,"
	           				+"      FOOD_CAL FROM "
	           				+"               (SELECT * FROM FOOD_INFO "
	           				+"				  WHERE FOOD_NAME LIKE ? AND"
	           				+"                     ( ";
	           				
					for(int i=0;i<check.length;i++) 
					{
						food_list_sql+=type +" = "+ check[i];
						if((i+1)!=check.length) {
							food_list_sql+=" OR ";
						}
						
					}
					food_list_sql+="          ) ";
					food_list_sql+="          ORDER BY FOOD_CODE ASC) "
		       				+"     ) "
		       				+" WHERE RNUM>=? AND RNUM<=?";
					System.out.println("4. " + food_list_sql);
				}
				
				pstmt = conn.prepareStatement(food_list_sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2,startrow);
				pstmt.setInt(3,endrow);
			
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FoodInfo f = new FoodInfo();
				f.setFood_code(rs.getInt("food_code"));
				f.setFood_name(rs.getString("food_name"));
				f.setFood_img_name(rs.getString("food_img_name"));
				f.setFood_carb(rs.getInt("food_carb"));
				f.setFood_fat(rs.getInt("food_fat"));
				f.setFood_protein(rs.getInt("food_protein"));
				f.setFood_cal(rs.getInt("food_cal"));
				list.add(f);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("getfoodList() 실패  : " + e);
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
	public JsonObject getFoodInfo(int fcode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		JsonObject fooddata= null;
		String select_sql ="select * from food_info where food_code= ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setInt(1,fcode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				fooddata= new JsonObject();
				fooddata.addProperty("food_code", rs.getInt("food_code"));
				fooddata.addProperty("food_name", rs.getString("food_name"));
				fooddata.addProperty("food_img_name", rs.getString("food_img_name"));
				fooddata.addProperty("food_carb", rs.getInt("food_carb"));
				fooddata.addProperty("food_fat", rs.getInt("food_fat"));
				fooddata.addProperty("food_protein", rs.getInt("food_protein"));
				fooddata.addProperty("food_cal", rs.getInt("food_cal"));
			}
		}catch (Exception ex) {
			System.out.println("getDetail() 실패 : " + ex);
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
		return fooddata;
	}
	public int CreateDiet(DietInfo dInfo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int result = 0;
		String code =null;
		try {
			conn = ds.getConnection();
			String max_sql = "select nvl(max(diet_code),'D1') as code from diet_info";
			pstmt = conn.prepareStatement(max_sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int max=Integer.parseInt(rs.getString("code").substring(1))+1;
				code="D"+String.valueOf(max);
			}
			pstmt.close();
			
			String sql = " insert into DIET_INFO "
					   + " values(?,?,?,?,0,0,?,?,?,?,sysdate) ";
			
			//PreparedStatement 사용
			pstmt = conn.prepareStatement(sql);
			
			//위치 홀더에 값 세팅 & 쿼리 실행
			pstmt.setString(1,dInfo.getId());
			pstmt.setString(2,code); 
			pstmt.setString(3,dInfo.getDiet_name()); 
			pstmt.setString(4,dInfo.getDiet_form()); 
			pstmt.setInt(5, dInfo.getDiet_total_carb());
			pstmt.setInt(6, dInfo.getDiet_total_fat());
			pstmt.setInt(7, dInfo.getDiet_total_protein());
			pstmt.setInt(8, dInfo.getDiet_total_cal());
			result=pstmt.executeUpdate();

			if(result == 0) {
				System.out.println("데이터 삽입 실패");
			}
		}catch (Exception ex) {
			System.out.println("CreateDiet()에러 : " + ex);
			ex.printStackTrace();
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
