package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConn {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context init = new InitialContext();
			Context env = (Context) init.lookup("java:/comp/env");
			
			DataSource ds = (DataSource)env.lookup("jdbc/myoracle");
			
			conn = ds.getConnection();
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// select문을 썼을 경우
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// select 사용 x
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

