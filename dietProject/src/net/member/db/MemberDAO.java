package net.member.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


/*
   DAO Ŭ����(Data Access Object)
   -������ ���̽��� �����Ͽ� ���ڵ��� �߰� ,����,���� �۾��� �̷����� Ŭ�����Դϴ�.
 */
public class MemberDAO {
	private DataSource ds;
	public MemberDAO() {
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
	public String checkId(String id) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		String result="";
		
		String sql= "select id from user_info where id=?";
		
		try {
			con = ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result="y";
				
			}else {
				result="n";
			}
					
		}catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("checkId 오류" + ex);
		}finally {
			if(rs!=null) {
			   try{
				   rs.close();
			   }catch(SQLException e) {
				   e.printStackTrace();
			   }
			}
			if(con!=null) {
				   try{
					   con.close();
				   }catch(SQLException e) {
					   e.printStackTrace();
				   }
				}
			if(pstmt!=null) {
				   try{
					  pstmt.close();
				   }catch(SQLException e) {
					   e.printStackTrace();
				   }
				}
			
		}
		return result;
	}
}
