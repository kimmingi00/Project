package model.reserv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;

public class ProductDAO {
	private static ProductDAO instance = new ProductDAO();
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	public List<ProductVO> MyTourList(String b_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProductVO> mlist = new ArrayList<ProductVO>();
		
		String query = "select * from product where b_id = ? order by p_regdate desc";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setB_id(rs.getString("b_id"));
				vo.setP_idx(rs.getInt("p_idx"));
				vo.setP_title(rs.getString("p_title"));
				vo.setP_contents(rs.getString("p_contents"));
				vo.setP_indate(rs.getString("p_indate"));
				vo.setP_outdate(rs.getString("p_outdate"));
				vo.setP_in(rs.getString("p_in"));
				vo.setP_out(rs.getString("p_out"));
				vo.setP_reservpeople(rs.getInt("p_reservpeople"));
				vo.setP_maxpeople(rs.getInt("p_maxpeople"));
				vo.setP_price(rs.getInt("p_price"));
				vo.setTheme(rs.getString("theme"));
				vo.setP_filename(rs.getString("p_filename"));
				vo.setP_readcnt(rs.getInt("p_readcnt"));
				vo.setP_regdate(rs.getString("p_regdate"));
				vo.setP_picture(rs.getString("p_picture"));
				vo.setP_customer(rs.getString("p_customer"));
				
				mlist.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		
		
		
		
		return mlist;
		
	}
	
	public int productUpload(ProductVO pvo) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		
		int row=0;

		String query="insert into product(p_idx, b_id, p_title, p_contents, p_indate,"
				+ " p_outdate, p_in, p_out, p_reservpeople, p_maxpeople, p_price, theme,"
				+ "p_filename, p_readcnt, p_picture) values("
				+ "seq_p_idx.nextval, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, ?)";
		
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pvo.getB_id());
			pstmt.setString(2, pvo.getP_title());
			pstmt.setString(3, pvo.getP_contents());
			pstmt.setString(4, pvo.getP_indate());
			pstmt.setString(5, pvo.getP_outdate());
			pstmt.setString(6, pvo.getP_in());
			pstmt.setString(7, pvo.getP_out());
			pstmt.setInt(8, pvo.getP_maxpeople());
			pstmt.setInt(9, pvo.getP_price());
			pstmt.setString(10, pvo.getTheme());
			pstmt.setString(11, pvo.getP_filename());
			pstmt.setInt(12, pvo.getP_readcnt());
			pstmt.setString(13, pvo.getP_picture());
			row = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		
		
		
		
		
		return row;
		
	}
	
	public ProductVO ProductView(int p_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVO vo = null;
		
		String query = "select * from product where p_idx = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, p_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ProductVO();
				vo.setB_id(rs.getString("b_id"));
				vo.setP_idx(rs.getInt("p_idx"));
				vo.setP_title(rs.getString("p_title"));
				vo.setP_contents(rs.getString("p_contents"));
				vo.setP_indate(rs.getString("p_indate").substring(0,10));
				vo.setP_outdate(rs.getString("p_outdate").substring(0,10));
				vo.setP_in(rs.getString("p_in"));
				vo.setP_out(rs.getString("p_out"));
				vo.setP_reservpeople(rs.getInt("p_reservpeople"));
				vo.setP_maxpeople(rs.getInt("p_maxpeople"));
				vo.setP_price(rs.getInt("p_price"));
				vo.setTheme(rs.getString("theme"));
				vo.setP_filename(rs.getString("p_filename"));
				vo.setP_readcnt(rs.getInt("p_readcnt"));
				vo.setP_regdate(rs.getString("p_regdate"));
				vo.setP_picture(rs.getString("p_picture"));
				vo.setP_customer(rs.getString("p_customer"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		
		
		
		
		return vo;
		
	}
	
	public int productModify(ProductVO pvo) {
		Connection conn=null;
		PreparedStatement pstmt = null;
	
		
		int row=0;

		String query="update product set p_title = ?, p_contents = ?, p_indate = ?,"
				+ " p_outdate = ?, p_in = ?, p_out = ?, p_maxpeople = ?, p_price = ?,"
				+ "theme = ?, p_filename = ?, p_picture = ? where p_idx = ?";
		
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pvo.getP_title());
			pstmt.setString(2, pvo.getP_contents());
			pstmt.setString(3, pvo.getP_indate());
			pstmt.setString(4, pvo.getP_outdate());
			pstmt.setString(5, pvo.getP_in());
			pstmt.setString(6, pvo.getP_out());
			pstmt.setInt(7, pvo.getP_maxpeople());
			pstmt.setInt(8, pvo.getP_price());
			pstmt.setString(9, pvo.getTheme());
			pstmt.setString(10, pvo.getP_filename());
			pstmt.setString(11, pvo.getP_picture());
			pstmt.setInt(12, pvo.getP_idx());
			row = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		
		
		
		
		
		return row;
		
	}
	
	public int plusReadcnt(int p_idx) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		int row = 0;
		
		String query = "update product set p_readcnt = p_readcnt + 1 where p_idx = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, p_idx);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return row;
	}
	
	
	public int productDelete(int p_idx) {
		Connection conn=null;
		PreparedStatement pstmt = null;
	
		
		int row=0;

		String query="delete from product where p_idx = ?";
		
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, p_idx);
			row = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		
		
		
		
		
		return row;
		
	}
	
	public List<ProductVO> ProductWholeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProductVO> mlist = new ArrayList<ProductVO>();
		
		String query = "select * from product order by p_regdate desc";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setB_id(rs.getString("b_id"));
				vo.setP_idx(rs.getInt("p_idx"));
				vo.setP_title(rs.getString("p_title"));
				vo.setP_contents(rs.getString("p_contents"));
				vo.setP_indate(rs.getString("p_indate"));
				vo.setP_outdate(rs.getString("p_outdate"));
				vo.setP_in(rs.getString("p_in"));
				vo.setP_out(rs.getString("p_out"));
				vo.setP_reservpeople(rs.getInt("p_reservpeople"));
				vo.setP_maxpeople(rs.getInt("p_maxpeople"));
				vo.setP_price(rs.getInt("p_price"));
				vo.setTheme(rs.getString("theme"));
				vo.setP_filename(rs.getString("p_filename"));
				vo.setP_readcnt(rs.getInt("p_readcnt"));
				vo.setP_regdate(rs.getString("p_regdate"));
				vo.setP_picture(rs.getString("p_picture"));
				vo.setP_customer(rs.getString("p_customer"));
				
				mlist.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		
		
		
		
		return mlist;
		
	}
	
	public int reservProduct(int p_idx, String p_customer, int reserv_cnt) {
		int row=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		
		String query="update product set p_reservpeople = p_reservpeople + ?,"
				+ "p_customer = p_customer + ? where p_idx = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reserv_cnt);
			pstmt.setString(2, p_customer);
			pstmt.setInt(3, p_idx);
			row = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		
		
		return row;
		
	}
}
