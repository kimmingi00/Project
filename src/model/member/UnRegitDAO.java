package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBConn;

public class UnRegitDAO {
	private static UnRegitDAO instance = new UnRegitDAO();
	public static UnRegitDAO getInstance() {
		return instance;
	}
	private UnRegitDAO() {
		
	}
	
	public int insertUnRegit(UnRegitVO rvo) {
		int row = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query="insert into unregit_user(ur_email, ur_name, ur_tel, ur_pass) values("
				+ "?,?,?,?)";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rvo.getUr_email());
			pstmt.setString(2, rvo.getUr_name());
			pstmt.setString(3, rvo.getUr_tel());
			pstmt.setString(4, rvo.getUr_pass());
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		
		return row;
	}
	
	public int deleteUnRegit(UnRegitVO rvo) {
		int row = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String query="delete from unregit_user where ur_email = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rvo.getUr_email());
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		
		
		return row;
	}
}
