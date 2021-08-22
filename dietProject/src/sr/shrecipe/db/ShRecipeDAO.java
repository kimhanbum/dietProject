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
		
			try	{
				con=ds.getConnection();
				pstmt=con.prepareStatement("select count(recipe_code) from recipe_info ");
				rs=pstmt.executeQuery();
			    
				if(rs.next()) {
				    x=rs.getInt(1);
				
			}
				System.out.println("결과:" +x );
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
		
		String sql= " select recipe_code, recipe_subject, recipe_content, recipe_file from "
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
			  String[] filenames= rs.getString(4).split(",");
			  String imgname=filenames[0];
			  recipeinfo.setRecipe_file(imgname);
			  list.add(recipeinfo);			
			}
		}catch(Exception ex) {
			System.out.println("getRecipeList()에러:" + ex);
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

	public boolean recipeAdd(RecipeInfo recipeInfo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		int result=0;
		String max_sql= " (select nvl(max(recipe_code),0)+1 from recipe_info)";
		
		String sql=" insert into recipe_info "
				  +" (id,recipe_code,recipe_subject,recipe_content,recipe_summary,recipe_file) "
				  +" values(?," + max_sql + ",?,?,?,?)";
		try {
		    con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, recipeInfo.getId());
			pstmt.setString(2, recipeInfo.getRecipe_subject());
			pstmt.setString(3, recipeInfo.getRecipe_content());
			pstmt.setString(4, recipeInfo.getRecipe_summary());
			pstmt.setString(5, recipeInfo.getRecipe_file());
			result= pstmt.executeUpdate();
			if(result==1) {
				System.out.println("레시피 추가 완료되었습니다");
			   return true;
			}
			
		}catch (Exception ex) {
			System.out.println("레시피 추가()에러:" + ex);
			ex.printStackTrace();
		}finally {
			if(pstmt != null)
				try {
					pstmt.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
				}
			if(con != null)
				try {
					con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}			
		}
		return false;
		
		
	}

	public RecipeInfo getDetailRecipeInfo(int recipeCode) {
		RecipeInfo recipeInfo = new RecipeInfo();
		Connection con =  null;
		PreparedStatement pstmt =  null;
		ResultSet rs=null;
		
		try {
			con=ds.getConnection();
			pstmt =  con.prepareStatement("select * from recipe_info where recipe_code = ?");
			pstmt.setInt(1, recipeCode);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				recipeInfo.setId(rs.getString(1));
				recipeInfo.setRecipe_code(rs.getString(2));
				recipeInfo.setRecipe_subject(rs.getString(3));
				recipeInfo.setRecipe_content(rs.getString(4));
				recipeInfo.setRecipe_summary(rs.getString(5));
				recipeInfo.setRecipe_file(rs.getString(6));			
			}
		
		
	}catch(Exception ex) {
		System.out.println("getRecipeList()에러:" + ex);
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
		return recipeInfo;
  }
}