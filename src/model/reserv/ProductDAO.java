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
		
		String query = "select * from product where b_id = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(0, b_id);
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
}
