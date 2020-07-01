package com.rate.model;

import java.sql.*;

public class RateJDBCDAO implements RateJDBCDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101";
	String passwd = "123456";
	
	private static final String INSERT_STMT ="INSERT INTO RATE(RATENO,RMNO,RATINGMBRNO,RATEDMBRNO,DETAIL,SCORE) VALUES ('SS'||LPAD(TO_CHAR(RATE_SEQ.NEXTVAL),5,'0'),?,?,?,?,?)";

	@Override
	public void insert(RateVO rateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, rateVO.getRmno());
			pstmt.setString(2, rateVO.getRatingmbrno());
			pstmt.setString(3, rateVO.getRatedmbrno());
			pstmt.setString(4, rateVO.getDetail());
			pstmt.setInt(5, rateVO.getScore());
			
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
		RateJDBCDAO dao = new RateJDBCDAO();
		RateVO rateVO1 = new RateVO();
		rateVO1.setRmno("SR00004");
		rateVO1.setRatingmbrno("BM00005");
		rateVO1.setRatedmbrno("BM00004");
		rateVO1.setDetail("�ӯ���666");
		rateVO1.setScore(5);
		
		
		dao.insert(rateVO1);
		
	}
	
	
}
