package sr.shrecipe.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import _comm.javabean.RecipeInfo;


/*
   DAO Ŭ����(Data Access Object)
   -������ ���̽��� �����Ͽ� ���ڵ��� �߰� ,����,���� �۾��� �̷����� Ŭ�����Դϴ�.
 */
public class ShRecipeDAO {
	private DataSource ds;
	public ShRecipeDAO() {
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
	
	public int getRecipeListCount() {
		Connection con=null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		int x= 0;
		String sql=" select count(*) from recipe_info ";
			try	{
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
				    x=rs.getInt(1);
				
			}
		}catch(Exception ex) {
			System.out.println("getRecipeListCount()에러:" + ex);
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			if(con!=null) {
				try {
					con.close();
				}catch (SQLException e){
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch (SQLException e){
					e.printStackTrace();
				}
			}
			}
			
		}
			return x;
	}

	public List<RecipeInfo> getRecipeList(int page, int limit) {
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		List<RecipeInfo> list= new ArrayList<RecipeInfo>();
		
		int start= (page-1)*limit+1;
		int end = start + limit -1;
		
		String sql= " select recipe_code, recipe_subject, recipe_content, recipe_filefrom "
				  + " (select rownum rnum, recipe_code, recipe_subject, recipe_content, recipe_file  from "
				  + "  (select * from recipe_info "
				  + "  order by recipe_code desc, recipe_date desc)"
				  + "  )"
				  + "  where rnum>=? and rnum<=? ";
		
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
			  RecipeInfo recipeinfo= new RecipeInfo();
			  recipeinfo.setRecipe_code(rs.getString(1));
			  recipeinfo.setRecipe_subject(rs.getString(2));
			  recipeinfo.setRecipe_content(rs.getString(3));
			  recipeinfo.setRecipe_file(rs.getString(4));
			  list.add(recipeinfo);			
			}
		}catch(Exception ex) {
			System.out.println("getRecipeListCount()에러:" + ex);
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			if(con!=null) {
				try {
					con.close();
				}catch (SQLException e){
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch (SQLException e){
					e.printStackTrace();
				}
			}
			}
			
		}
			return list;
	}
}
