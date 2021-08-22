package to.today.db;

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

import _comm.javabean.Commondiet;
import _comm.javabean.DietInfo;
import _comm.javabean.MealInfo;
import _comm.javabean.PersonalInfo;
import _comm.javabean.TotalInfo;

/*
   DAO 클래스(Data Access Object)
   -데이터 베이스와 연동하여 레코드의 추가 ,수정,삭제 작업이 이뤄지는 클래스입니다.
 */
public class TodayDAO {
	private DataSource ds;

	public TodayDAO() {
		try {
			// Context.xml에 리소스를 생성해 놓은 (JNDI에 설정해 놓은) jdbc/OracleDB를
			// 참조하여 Connection 객체를 얻어 옵니다.
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:/comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}

	public TotalInfo getTotalInfo(String userid, String date) {
		// 토탈인포클래스 타입의 변수 토탈
		TotalInfo total = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(
					"select * from total_info " + "where id= ?" + "and to_date(total_date, 'YY/MM/DD') = ?");
			pstmt.setString(1, userid);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 변수이름.set(가져올 컬럼) 저장하기
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
		}
		return total;
	} // TotalInfo() 메서드 end

	public Commondiet getDietInfo(String code) {
		Commondiet comdiet = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from diet_info where diet_code=?");
			pstmt.setString(1, code);
			// 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				comdiet = new Commondiet();
				// 변수이름.set(쓸 변수 값) 저장하기
				comdiet.setName(rs.getString("DIET_NAME"));
				comdiet.setForm(rs.getString("DIET_FORM"));
				comdiet.setCarb(rs.getInt("DIET_TOTAL_CARB"));
				comdiet.setFat(rs.getInt("DIET_TOTAL_FAT"));
				comdiet.setPro(rs.getInt("DIET_TOTAL_PROTEIN"));
				comdiet.setCal(rs.getInt("DIET_TOTAL_CAL"));
				comdiet.setMeal(0);
			}
			pstmt.close();
			rs.close();

			String img_sql = "select food_img_name from food_info where food_code = ?";
			pstmt = con.prepareStatement(img_sql);
			String food_code = comdiet.getForm().split(",")[0];
			System.out.println("food_code : " + food_code);
			pstmt.setInt(1, Integer.parseInt(food_code));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				comdiet.setImgname(rs.getString(1));
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
			// 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				comdiet = new Commondiet();
				// 변수이름.set(쓸 변수 값) 저장하기
				comdiet.setName(rs.getString("MEAL_NAME"));
				comdiet.setCarb(rs.getInt("MEAL_CARB"));
				comdiet.setFat(rs.getInt("MEAL_FAT"));
				comdiet.setPro(rs.getInt("MEAL_PROTEIN"));
				comdiet.setCal(rs.getInt("MEAL_CAL")); /* meall_cal -> meal_cal로 변경 필요 */
				comdiet.setImgname(rs.getString("MEAL_IMG_NAME"));
				comdiet.setMeal(1);
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
		}
		return comdiet;
	}

	public JsonArray getMonthTotalData(String userId, String yearMonth) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JsonObject object = null;
		JsonArray jArray = new JsonArray();
		String select_sql = " SELECT TOTAL_BF,TOTAL_LUNCH,TOTAL_DINNER,TOTAL_SNACK, "
				+ " TOTAL_WATER, TO_CHAR(TOTAL_DATE,'YYYY-MM-DD') YEARMONTH " + " FROM TOTAL_INFO "
				+ "WHERE TO_CHAR(TOTAL_DATE,'YYYY/MM') = ? " + "AND ID = ? ";

		// "where to_char(hiredate,'YYMM') = '8111'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setString(1, yearMonth);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("TOTAL_BF") != null) {
					object = new JsonObject();
					object.addProperty("title", "1.아침");
					object.addProperty("start", rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "green");
					jArray.add(object);
				}
				if (rs.getString("TOTAL_LUNCH") != null) {
					object = new JsonObject();
					object.addProperty("title", "2.점심");
					object.addProperty("start", rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "orange");
					jArray.add(object);

				}
				if (rs.getString("TOTAL_DINNER") != null) {
					object = new JsonObject();
					object.addProperty("title", "3.저녁");
					object.addProperty("start", rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "yellow");
					jArray.add(object);
				}
				if (rs.getString("TOTAL_SNACK") != null) {
					object = new JsonObject();
					object.addProperty("title", "4.간식");
					object.addProperty("start", rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "blue");
					jArray.add(object);
				}
				if (rs.getString("TOTAL_WATER") != null) {
					object = new JsonObject();
					object.addProperty("title", "5.물");
					object.addProperty("start", rs.getString("YEARMONTH"));
					object.addProperty("end", rs.getString("YEARMONTH"));
					object.addProperty("color", "pink");
					jArray.add(object);
				}
			}
		} catch (Exception ex) {
			System.out.println("getFoodDetail() 실패 :  " + ex);
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
		return jArray;
	}

	public List<MealInfo> getAllMealList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MealInfo> list = new ArrayList<MealInfo>();
		MealInfo m = null;

		/* meall_cal -> meal_cal로 변경 필요 */
		String select_sql = "select meal_code,meal_name,meal_img_name,meal_cal from meal_info";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(select_sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				m = new MealInfo();
				m.setMeal_code(rs.getString(1));
				m.setMeal_name(rs.getString(2));
				m.setMeal_img_name(rs.getString(3));
				m.setMeal_cal(rs.getInt(4));
				list.add(m);
			}
		} catch (Exception ex) {
			System.out.println("getAllMealList() 실패 : " + ex);
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
		return list;
	}

	public List<DietInfo> getAllDietList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String Diet_list_sql;
		List<DietInfo> list = new ArrayList<DietInfo>();

		try {
			conn = ds.getConnection();
			Diet_list_sql = "select diet_code,diet_name,diet_form,diet_total_cal from diet_info";
			pstmt = conn.prepareStatement(Diet_list_sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DietInfo d = new DietInfo();
				d.setDiet_code(rs.getString("diet_code"));
				d.setDiet_name(rs.getString("diet_name"));
				d.setDiet_form(rs.getString("diet_form"));
				d.setDiet_total_cal(rs.getInt("diet_total_cal"));
				list.add(d);
			}

			// 현재 공유 식단 정보에서 출력할 이미지를 구성 식자재중 첫번쨰 식자재의 이미지를 사용
			pstmt.close();
			String img_sql = "select food_img_name from food_info where food_code = ?";
			pstmt = conn.prepareStatement(img_sql);
			for (DietInfo data : list) {
				String food_code = data.getDiet_form().split(",")[0];
				System.out.println("food_code : " + food_code);
				pstmt.setInt(1, Integer.parseInt(food_code));
				rs = pstmt.executeQuery();
				if (rs.next()) {
					data.setDiet_img_name(rs.getString(1));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getAllDietList() 실패  : " + e);
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
		return list;
	}

	public int setTotalInfo(String userId, String code, String mealtype,String resultDate) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Commondiet c = null;
		int result = 0;
		try {
			conn = ds.getConnection();
			if (code.contains("M")) {
				String select_code = "SELECT * FROM MEAL_INFO WHERE MEAL_CODE = ? ";
				System.out.println(select_code);
				pstmt = conn.prepareStatement(select_code);
				pstmt.setString(1, code);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					c = new Commondiet();
					c.setCarb(rs.getInt("meal_carb"));
					c.setFat(rs.getInt("meal_fat"));
					c.setPro(rs.getInt("meal_protein"));
					c.setCal(rs.getInt("meal_cal")); /* meall_cal -> meal_cal로 변경 필요 */
				}
			} else if (code.contains("D")) {
				String select_code = "SELECT * FROM DIET_INFO WHERE DIET_CODE = ? ";
				System.out.println(select_code);
				pstmt = conn.prepareStatement(select_code);
				pstmt.setString(1, code);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					c = new Commondiet();
					c.setCarb(rs.getInt("diet_total_carb"));
					c.setFat(rs.getInt("diet_total_fat"));
					c.setPro(rs.getInt("diet_total_protein"));
					c.setCal(rs.getInt("diet_total_cal"));
				}

			}
			rs.close();
			pstmt.close();

			String checkDate_sql = " SELECT COUNT(*) " + " FROM TOTAL_INFO "
					+ " WHERE to_date(TOTAL_DATE, 'YY/MM/DD') = ? AND ID = ? ";
			pstmt = conn.prepareStatement(checkDate_sql);
			System.out.println(checkDate_sql);
			pstmt.setString(1, resultDate);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 해당 날짜로 등록된 값이 없으면 insert 수행
				if (rs.getInt(1) == 0) {
					rs.close();
					pstmt.close();
					String max_sql = "(select nvl(max(total_num),0)+1 from total_info)";
					String insert_sql = " INSERT INTO " + " TOTAL_INFO(ID," + mealtype
							+ ",TOTAL_CARB,TOTAL_FAT,TOTAL_PROTEIN,TOTAL_CAL,TOTAL_DATE,TOTAL_NUM)"
							+ " VALUES(?,?,?,?,?,?,?," + max_sql + ")";
					System.out.println(insert_sql);
					pstmt = conn.prepareStatement(insert_sql);
					pstmt.setString(1, userId);
					pstmt.setString(2, code);
					pstmt.setInt(3, c.getCarb());
					pstmt.setInt(4, c.getFat());
					pstmt.setInt(5, c.getPro());
					pstmt.setInt(6, c.getCal());
					pstmt.setString(7, resultDate);
					result = pstmt.executeUpdate();
					if (result == 0) {
						System.out.println("데이터 삽입 실패");
					}
				}
				// 이미 해당 날짜로 값이 있으면 update 수행
				else {
					rs.close();
					pstmt.close();

					// update할려는 열(아/점/저/간)이 비어있는지 확인
					String check_sql = " select " + mealtype + " from total_info " + " where " + mealtype
							+ " is not null" + " and to_date(TOTAL_DATE, 'YY/MM/DD') = ? "
							+ " and id = ? ";
					System.out.println(check_sql);
					pstmt = conn.prepareStatement(check_sql);
					pstmt.setString(1, resultDate);
					pstmt.setString(2, userId);
					rs = pstmt.executeQuery();

					// update할 열에 값이 있다면 계산하여 update
					if (rs.next()) {
						String prevCode = rs.getString(1);
						rs.close();
						pstmt.close();
						if (prevCode.contains("M")) {
							String select_sql = "SELECT * FROM MEAL_INFO WHERE MEAL_CODE = ? ";
							System.out.println(select_sql);
							pstmt = conn.prepareStatement(select_sql);
							pstmt.setString(1, prevCode);
							rs = pstmt.executeQuery();
							if (rs.next()) {
								c.setCarb(c.getCarb() - rs.getInt("meal_carb"));
								c.setFat(c.getFat() - rs.getInt("meal_fat"));
								c.setPro(c.getPro() - rs.getInt("meal_protein"));
								c.setCal(c.getCal() - rs.getInt("meal_cal")); /* meall_cal -> meal_cal로 변경 필요 */
							}
						} else if (prevCode.contains("D")) {
							String select_sql = "SELECT * FROM DIET_INFO WHERE DIET_CODE = ? ";
							System.out.println(select_sql);
							pstmt.setString(1, prevCode);
							pstmt = conn.prepareStatement(select_sql);
							rs = pstmt.executeQuery();
							if (rs.next()) {
								c.setCarb(c.getCarb() - rs.getInt("diet_total_carb"));
								c.setFat(c.getFat() - rs.getInt("diet_total_fat"));
								c.setPro(c.getPro() - rs.getInt("diet_total_protein"));
								c.setCal(c.getCal() - rs.getInt("diet_total_cal"));
							}
						}
					}
					// update할 열에 값이 없다면 그냥 업데이트
					rs.close();
					pstmt.close();
					String update_sql = " UPDATE TOTAL_INFO " + " SET " + mealtype
							+ " = ? , TOTAL_CARB = TOTAL_CARB + ? , TOTAL_FAT = TOTAL_FAT + ? ,"
							+ "     TOTAL_PROTEIN = TOTAL_PROTEIN + ? , TOTAL_CAL = TOTAL_CAL + ? "
							+ " WHERE to_date(TOTAL_DATE, 'YY/MM/DD') = ? and ID= ? ";
					System.out.println(update_sql);
					pstmt = conn.prepareStatement(update_sql);
					pstmt.setString(1, code);
					pstmt.setInt(2, c.getCarb());
					pstmt.setInt(3, c.getFat());
					pstmt.setInt(4, c.getPro());
					pstmt.setInt(5, c.getCal());
					pstmt.setString(6, resultDate);
					pstmt.setString(7, userId);
					result = pstmt.executeUpdate();
					if (result == 0) {
						System.out.println("데이터 삽입 실패");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("setTotalInfo() 실패  : " + e);
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
		return result;
	}

	public PersonalInfo selectrmr(String id) {
		PersonalInfo personalinformr = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from personal_info where id=?");
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				personalinformr = new PersonalInfo();
				// 변수이름.set(쓸 변수 값) 저장하기
				personalinformr.setRmr(rs.getInt("RMR"));
				personalinformr.setWeight(rs.getInt("weight"));
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
		}
		return personalinformr;
	}

}
