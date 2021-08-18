package net.member.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import _comm.javabean.UserInfo;


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
	public int isId(String id, String pass) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		int result=-1;
		
		String sql=" select id, pass from user_info where id=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(2).equals(pass)) {
					result=1;
				}else {
					result=0;
				}
				
			}
			
			
		}catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("로그인 체크 오류: " + ex);
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
	public int insert(UserInfo m) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int result= 0;
		
		String sql= "insert into user_info values(?,?,?,?,?,?,?,?)";
		try {
			
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getJumin());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getTel());
			pstmt.setString(8, m.getAddress());
			
			result=pstmt.executeUpdate();
					
		}
		 catch (java.sql.SQLIntegrityConstraintViolationException e) {
				result = -1;
				System.out.println("멤버 아이디 중복 에러 입니다");

			}catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("로그인 체크 오류: " + ex);
		}finally {
			
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
