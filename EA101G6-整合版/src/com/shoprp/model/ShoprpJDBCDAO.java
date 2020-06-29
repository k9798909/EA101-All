package com.shoprp.model;

import java.sql.*;

import com.joinrm.model.JoinrmJDBCDAO;
import com.joinrm.model.JoinrmVO;

public class ShoprpJDBCDAO implements ShoprpJDBCDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "FAKE";
	String passwd = "123456";
	
	private static final String INSERT_STMT = "INSERT INTO SHOPRP(MBRNO,RMNO,DETAIL,ATTEND) VALUES (?,?,?,?)";

	@Override
	public void insert(ShoprpVO shoprpVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, shoprpVO.getMbrno());
			pstmt.setString(2, shoprpVO.getRmno());
			pstmt.setString(3, shoprpVO.getDetail());
			pstmt.setInt(4, shoprpVO.getAttend());
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		
		
	}
	
	public static void main(String[] args) {
		ShoprpJDBCDAO dao = new ShoprpJDBCDAO();
		ShoprpVO shoprpVO1 = new ShoprpVO();
		shoprpVO1.setMbrno("BM00001");
		shoprpVO1.setRmno("SR00011");
		shoprpVO1.setDetail("");
		shoprpVO1.setAttend(1);
		
		
		dao.insert(shoprpVO1);
		
	}
	
	

}
