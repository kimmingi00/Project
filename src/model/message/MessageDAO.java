package model.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;



public class MessageDAO {
	private static MessageDAO instance = new MessageDAO();
	
	private MessageDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static MessageDAO getInstance() {
		return instance;
	}
	
	
	
	public List<MessageVO> myReceiveMsgList(String receive_id) {
		List<MessageVO> mList = new ArrayList<MessageVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from message where receive_id = ? order by regdate desc";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, receive_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MessageVO mvo = new MessageVO();
				mvo.setSend_id(rs.getString("send_id"));
				mvo.setTitle(rs.getString("title"));
				mvo.setContents(rs.getString("contents"));
				mvo.setReceive_id(rs.getString("receive_id"));
				mvo.setReadcnt(rs.getInt("readcnt"));
				mvo.setM_idx(rs.getInt("m_idx"));
				mvo.setRegdate(rs.getString("regdate"));
				
				mList.add(mvo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		
		
		
		return mList;
	}
	
	public List<MessageVO> myReceiveMsgList2(String receive_id) {
		List<MessageVO> mList = new ArrayList<MessageVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from message where receive_id = ? order by regdate desc";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, receive_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MessageVO mvo = new MessageVO();
				mvo.setSend_id(rs.getString("send_id"));
				mvo.setTitle(rs.getString("title"));
				mvo.setContents(rs.getString("contents"));
				mvo.setReceive_id(rs.getString("receive_id"));
				mvo.setReadcnt(rs.getInt("readcnt"));
				mvo.setM_idx(rs.getInt("m_idx"));
				mvo.setRegdate(rs.getString("regdate"));
				
				mList.add(mvo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		
		
		
		return mList;
	}
	
	public List<MessageVO> mySendMsgList(String send_id) {
		List<MessageVO> mList = new ArrayList<MessageVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from message where send_id = ? order by regdate desc";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				MessageVO mvo = new MessageVO();
				mvo.setSend_id(rs.getString("send_id"));
				mvo.setTitle(rs.getString("title"));
				mvo.setContents(rs.getString("contents"));
				mvo.setReceive_id(rs.getString("receive_id"));
				mvo.setReadcnt(rs.getInt("readcnt"));
				mvo.setM_idx(rs.getInt("m_idx"));
				mvo.setRegdate(rs.getString("regdate"));
				mList.add(mvo);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		
		
		
		return mList;
	}
	
	public int msgSend(MessageVO mvo) {
		int row=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		String query = "insert into message(m_idx, send_id, title, "
				+ "contents, receive_id, readcnt) values(seq_m_idx.nextval, "
				+ "?, ?, ?, ?, 0)";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mvo.getSend_id());
			
			pstmt.setString(2, mvo.getTitle());
			pstmt.setString(3, mvo.getContents());
			pstmt.setString(4, mvo.getReceive_id());
			
			row = pstmt.executeUpdate();
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		
		
		
		return row;
	}
	
	public MessageVO msgView(int m_idx) {
		MessageVO mvo = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from message where m_idx = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, m_idx);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				mvo = new MessageVO();
				mvo.setSend_id(rs.getString("send_id"));
				mvo.setTitle(rs.getString("title"));
				mvo.setContents(rs.getString("contents"));
				mvo.setReceive_id(rs.getString("receive_id"));
				mvo.setReadcnt(rs.getInt("readcnt"));
				mvo.setM_idx(rs.getInt("m_idx"));
				mvo.setRegdate(rs.getString("regdate"));
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return mvo;
	}
	
	public int msgDelete(int m_idx) {
		int row=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		String query = "delete from message where m_idx = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, m_idx);
			
			
			row = pstmt.executeUpdate();
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		
		
		
		return row;
		
	}
	
	public int msgReadcnt(int m_idx) {
		int row=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		String query = "update message set readcnt = readcnt + 1 where m_idx = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, m_idx);
			
			row = pstmt.executeUpdate();
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		
		}
		
		
		
		return row;
	}
	
	public int selectId(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		
		String query = "select * from member where id = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			row = pstmt.executeUpdate();
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return row;
	}
	
		public int selectB_id(String b_id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		
		String query = "select * from business where b_id = ?";
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b_id);
			row = pstmt.executeUpdate();
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return row;
	}
	
}
