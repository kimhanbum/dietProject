package dt.diet.db;
import javax.naming.*;
import javax.sql.*;


/*
   DAO Ŭ����(Data Access Object)
   -������ ���̽��� �����Ͽ� ���ڵ��� �߰� ,����,���� �۾��� �̷����� Ŭ�����Դϴ�.
 */
public class DietDAO {
	private DataSource ds;
	public DietDAO() {
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
}