package rc.recipe.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.*;
import javax.sql.*;

import com.google.gson.JsonObject;

import _comm.javabean.RecipeInfo;


/*
   DAO Ŭ����(Data Access Object)
   -������ ���̽��� �����Ͽ� ���ڵ��� �߰� ,����,���� �۾��� �̷����� Ŭ�����Դϴ�.
 */
public class RecipeDAO {
	private DataSource ds;
	public RecipeDAO() {
		try {
			//Context.xml�� ���ҽ��� ������ ���� (JNDI�� ������ ����) jdbc/OracleDB��
			//�����Ͽ� Connection ��ü�� ��� �ɴϴ�.
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:/comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB ���� ���� : " + ex);
			return;
		}
	}
	public List<RecipeInfo> getRecipeList(int page, int limit) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		JsonArray array
		
		try {
			con=ds.getConnection()	;
			
			String sql="select * from recipe_info order by recipe_date desc";
			
			pstmt=con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				JsonObject obj= new JsonObject();
				obj.addProperty("recipefile", rs.getString(6));
	            
			}
		}
		
		return null;
	}
}
