package dt.diet.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.*;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import _comm.javabean.DietInfo;
import _comm.javabean.DietReply;


/*
   DAO 클래스(Data Access Object)
   -데이터 베이스와 연동하여 레코드의 추가 ,수정,삭제 작업이 이뤄지는 클래스입니다.
 */
public class DietDAO {
	private DataSource ds;
	public DietDAO() {
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
	public int getListCount(String user,String search) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String select_sql;
		try {
			conn = ds.getConnection();
			if(search == null) {
				select_sql = "select count(*) from diet_info where id=? ";
				pstmt = conn.prepareStatement(select_sql);
				pstmt.setString(1,user);
			}
			else {
				select_sql = "select count(*) from diet_info where id=? and diet_name like ?";
				pstmt = conn.prepareStatement(select_sql);
				pstmt.setString(1,user);
				pstmt.setString(2, "%"+search+"%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount() 에러 :" + e);
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

	public List<DietInfo> getBoardList(int page,int limit,String user,String search) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		
		String board_list_sql;
		

		List<DietInfo> list = new ArrayList<DietInfo>();

		//한페이지당 10개씩 목록인 경우 1페이지 , 2페이지, 2페이지, 4페이지....
		int startrow = (page -1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		try {

			conn = ds.getConnection();
			if(search == null) {
				board_list_sql = "SELECT * "
		           				+"FROM "
		           				+"     (SELECT ROWNUM RNUM,DIET_CODE,DIET_NAME,"
		           				+"      DIET_SHARE,DIET_TOTAL_CARB,"
		           				+"      DIET_TOTAL_FAT,DIET_TOTAL_PROTEIN,"
		           				+"      DIET_TOTAL_CAL  FROM "
		           				+"                      (SELECT * FROM DIET_INFO "
		           				+"						 WHERE ID = ? "
		           				+"                       ORDER BY DIET_DATE ASC) "
		           				+"     ) "
		           				+" WHERE RNUM>=? AND RNUM<=?";
				pstmt = conn.prepareStatement(board_list_sql);
				pstmt.setString(1,user);
				pstmt.setInt(2,startrow);
				pstmt.setInt(3,endrow);
				rs = pstmt.executeQuery();
			}
			else {
				board_list_sql = "SELECT * "
		           				+"FROM "
		           				+"     (SELECT ROWNUM RNUM,DIET_CODE,DIET_NAME,"
		           				+"      DIET_SHARE,DIET_TOTAL_CARB,"
		           				+"      DIET_TOTAL_FAT,DIET_TOTAL_PROTEIN,"
		           				+"      DIET_TOTAL_CAL  FROM "
		           				+"                      (SELECT * FROM DIET_INFO "
		           				+"						 WHERE ID = ? AND DIET_NAME LIKE ? "
		           				+"                       ORDER BY DIET_DATE ASC) "
		           				+"     ) "
		           				+" WHERE RNUM>=? AND RNUM<=?";
				pstmt = conn.prepareStatement(board_list_sql);
				pstmt.setString(1,user);
				pstmt.setString(2, "%"+search+"%");
				pstmt.setInt(3,startrow);
				pstmt.setInt(4,endrow);
				rs = pstmt.executeQuery();
			
			}
			System.out.println(board_list_sql);
			while(rs.next()) {
				DietInfo d = new DietInfo();
				
				//나눠서 쓰면 
				String str = rs.getString("DIET_CODE"); //반환형 있음
				d.setDiet_code(str);
				
				
				d.setDiet_code(rs.getString("DIET_CODE"));
				d.setDiet_name(rs.getString("DIET_NAME"));
				if(rs.getInt("DIET_SHARE") == 1)
					d.setDiet_share(true);
				else 
					d.setDiet_share(false);
				d.setDiet_total_carb(rs.getInt("DIET_TOTAL_CARB"));
				d.setDiet_total_fat(rs.getInt("DIET_TOTAL_FAT"));
				d.setDiet_total_protein(rs.getInt("DIET_TOTAL_PROTEIN"));
				d.setDiet_total_cal(rs.getInt("DIET_TOTAL_CAL"));
				list.add(d);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("getBoardList() 에러: " + e);
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
	public boolean dietShare(String dietCode,int dietShare) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result=false;
		String sql = "UPDATE DIET_INFO "
			       + "SET DIET_SHARE = ? "
				   + "WHERE DIET_CODE = ? ";
		try {
			System.out.println(sql);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dietShare);
			pstmt.setString(2, dietCode);
			if(pstmt.executeUpdate() == 1) {
				System.out.println("update success");
				result = true;
			}
		
		}catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("dietShare() 에러 : " + ex);
		}finally {
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
	public boolean DietDelete(String dcode) {

	    PreparedStatement pstmt = null;
	    Connection conn = null;
	    ResultSet rs =null;
	    String delete_dietInfo_sql = " delete from diet_info "
	    		                    +" where diet_code = ? ";
	    boolean result_check =false;
	    try {
			
	    	conn = ds.getConnection();
			pstmt = conn.prepareStatement(delete_dietInfo_sql);
			pstmt.setString(1,dcode);
			int count = pstmt.executeUpdate();
			if(count == 1) {
				result_check = true;
			}
			
		}catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("DietDelete() 에러 : " + ex);
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
		return result_check;
	}
	public JsonObject getDetail(String dcode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		JsonObject dietdata= null;
		String select_sql ="select * from diet_info where diet_code= ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setString(1,dcode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dietdata= new JsonObject();
				dietdata.addProperty("id", rs.getString("ID"));
				dietdata.addProperty("diet_code", rs.getString("DIET_CODE"));
				dietdata.addProperty("diet_name", rs.getString("DIET_NAME"));
				dietdata.addProperty("diet_form", rs.getString("DIET_FORM"));
				dietdata.addProperty("diet_recomm", rs.getInt("DIET_RECOMM"));
				dietdata.addProperty("diet_total_carb", rs.getInt("DIET_TOTAL_CARB"));
				dietdata.addProperty("diet_total_fat", rs.getInt("DIET_TOTAL_FAT"));
				dietdata.addProperty("diet_total_protein", rs.getInt("DIET_TOTAL_PROTEIN"));
				dietdata.addProperty("diet_total_cal", rs.getInt("DIET_TOTAL_CAL"));
			}
		}catch (Exception ex) {
			System.out.println("getDetail() 에러 : " + ex);
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
		return dietdata;
	}
	public JsonArray getFoodDetail(String foods) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		JsonArray jArray = new JsonArray();
		String select_sql ="select food_name,food_img_name from food_info where food_code = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(select_sql);
			String[] foodArray=foods.split(",");
			for(String food:foodArray) {
				pstmt.setString(1,food);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					JsonObject object =new JsonObject();
					object.addProperty("food_name",rs.getString(1));
					object.addProperty("food_img_name",rs.getString(2));
					jArray.add(object);
				}
			}
		}catch (Exception ex) {
			System.out.println("getFoodDetail() 에러 : " + ex);
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
	public JsonArray getCommentList(String dcode,int state) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sort="asc";
		if(state == 2) {
			sort="desc";
		}
		String sql = "select * "
				  + " from diet_reply "
				  + " where diet_code = ? "
				  + " order by diet_re_date " + sort;
		
		JsonArray array =new JsonArray();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dcode);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JsonObject object =new JsonObject();
				object.addProperty("id",rs.getString(1));
				object.addProperty("diet_code",rs.getString(2));
				object.addProperty("diet_re_num",rs.getInt(3));
				object.addProperty("diet_re_seq",rs.getInt(4));
				object.addProperty("diet_re_content",rs.getString(5));
				object.addProperty("diet_re_date",rs.getString(6));
				array.add(object);
			}
		} catch (Exception e) {
			System.out.println("getCommentList() 에러 :" + e);
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
		return array;
	}	
	public int replyInsert(DietReply dr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			conn = ds.getConnection();
			String max_sql = "(select nvl(max(diet_re_num),0)+1 from diet_reply)";
			String sql = "insert into diet_reply(id,diet_code,diet_re_num,diet_re_seq,diet_re_content) "
					+ "   values(?,?,"+max_sql+",?,?)";
			
			//PreparedStatement 사용
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dr.getId());
			pstmt.setString(2,dr.getDiet_code());
			pstmt.setInt(3,dr.getDiet_re_seq());
			pstmt.setString(4,dr.getDiet_re_content());
			result=pstmt.executeUpdate();
			
			if(result == 1)
				System.out.println("댓글 삽입이 완료되었습니다.");
		}catch (Exception ex) {
			System.out.println("replyInsert()에러 : " + ex);
			ex.printStackTrace();
		}finally {
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
	public JsonArray getReplyList(String reply_dietCode,int state) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sort="asc";
		if(state == 2) {
			sort="desc";
		}
		String sql = "select * from diet_reply"
				  + " where diet_code = ? "
				  + " order by diet_re_date " + sort;
		JsonArray array =new JsonArray();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reply_dietCode);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JsonObject object =new JsonObject();
				object.addProperty("id",rs.getString(1));
				object.addProperty("diet_code",rs.getString(2));
				object.addProperty("diet_re_num",rs.getInt(3));
				object.addProperty("diet_re_seq",rs.getInt(4));
				object.addProperty("diet_re_content",rs.getString(5));
				object.addProperty("diet_re_date",rs.getString(6));
				array.add(object);
			}
		} catch (Exception e) {
			System.out.println("getReplyList() 에러 :" + e);
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
		return array;
	}
	public int replyDelete(int num) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    int result=0;
 
	    try {
	    	conn = ds.getConnection();
	    	
		    String sql = "delete diet_reply where diet_re_num = ?";
		    
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			result = pstmt.executeUpdate();
			if(result == 1) {
				System.out.println("데이터 삭제 되었습니다.");
			}
			
		}catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("replyDelete() 에러 : " + ex);
		}finally {
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
	public int replyUpdate(int num,String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result=0;
		try {
			conn = ds.getConnection();
			String sql = "update diet_reply set diet_re_content=? "
					   +" where diet_re_num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, num);
			result = pstmt.executeUpdate();
			if (result == 1) {
				System.out.println("데이터가 수정 되었습니다.");
			}
		} catch (Exception e) {
			System.out.println("replyUpdate 에러 :" + e);
		} finally {
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
		return result;
	}
}
