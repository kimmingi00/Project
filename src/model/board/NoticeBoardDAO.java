package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class NoticeBoardDAO {
	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
		
		private NoticeBoardDAO() {}
		private static NoticeBoardDAO instance = new NoticeBoardDAO();
		public static NoticeBoardDAO getInstance() {
			return instance;
		}
		
		public Connection getConnection() throws Exception {
			Connection conn = null;
			Context init = new InitialContext();
			Context env = (Context)init.lookup("java:/comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			return conn;
		}
		

		public int boardCount() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int row = 0;
			String query = "select count(*) as cnt from notice";
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						row=rs.getInt("cnt");
					}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e){}
			}
			return row;
		}
		

		public List<NoticeBoardVO> boardList() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<NoticeBoardVO> list = new ArrayList<NoticeBoardVO>();
			String query = "select * from notice order by idx desc";
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					NoticeBoardVO vo = null;
					while(rs.next()) {
						vo = new NoticeBoardVO();
						vo.setIdx(rs.getInt("idx"));
						vo.setId(rs.getString("id"));
						vo.setTitle(rs.getString("title"));
						vo.setContents(rs.getString("contents"));
						vo.setFilename(rs.getString("filename"));
						vo.setRegdate(rs.getString("regdate"));
						list.add(vo);
						
					}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e){}
			}
			return list;
		}
		

		public List<NoticeBoardVO> boardList(int pagestart , int endpage) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<NoticeBoardVO> list = new ArrayList<NoticeBoardVO>();
			String query = "select X.* from (select rownum as rnum, A.* from(" +
			"select * from notice order by idx desc) A " +
					" where rownum <= ?) X where X.rnum >= ?";
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, endpage);
					pstmt.setInt(2,pagestart);
					rs = pstmt.executeQuery();
					NoticeBoardVO vo = null;
					while(rs.next()) {
						vo = new NoticeBoardVO();
						vo.setIdx(rs.getInt("idx"));
						vo.setId(rs.getString("id"));
						vo.setTitle(rs.getString("title"));
						vo.setContents(rs.getString("contents"));
						vo.setFilename(rs.getString("filename"));
						vo.setRegdate(rs.getString("regdate"));
						list.add(vo);
						
					}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e){}
			}
			return list;
		}
		
	
				public int boardCount(String s_query) {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					int row = 0;
				
					String query = "select count(*) as cnt from notice where " + s_query;
					try {
							conn = getConnection();
							pstmt = conn.prepareStatement(query);
							rs = pstmt.executeQuery();
							while(rs.next()) {
								row=rs.getInt("cnt"); 

							}
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try {
							if(rs != null) rs.close();
							if(pstmt != null) pstmt.close();
							if(conn != null) conn.close();
						}catch(Exception e){}
					}
					return row;
				}
				
		
				public List<NoticeBoardVO> boardList(String s_query,int pagestart , int endpage) {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					List<NoticeBoardVO> list = new ArrayList<NoticeBoardVO>();
					String query = "select X.* from (select rownum as rnum, A.* from(" +
					"select * from notice order by idx desc) A where " + s_query +
					" and rownum <= ? ) X where "+ s_query + " and X.rnum >= ?";
					try {
							conn = getConnection();
							pstmt = conn.prepareStatement(query);
							pstmt.setInt(1, endpage);
							pstmt.setInt(2,pagestart);
							rs = pstmt.executeQuery();
							NoticeBoardVO vo = null;
							while(rs.next()) {
								vo = new NoticeBoardVO();
								vo.setIdx(rs.getInt("idx"));
								vo.setId(rs.getString("id"));
								vo.setTitle(rs.getString("title"));
								vo.setContents(rs.getString("contents"));
								vo.setFilename(rs.getString("filename"));
								vo.setRegdate(rs.getString("regdate"));
								
								list.add(vo);
								
							}
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try {
							if(rs != null) rs.close();
							if(pstmt != null) pstmt.close();
							if(conn != null) conn.close();
						}catch(Exception e){}
					}
					return list;
				}
			
			
			
		
			public int boardCount(String search,String key) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				int row = 0;
				String query = "select count(*) as cnt from notice where " + search + " like '%"+key+"%'";
				try {
						conn = getConnection();
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							row=rs.getInt("cnt"); 
						}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}catch(Exception e){}
				}
				return row;
			}
			
			
			
			
			
			public List<NoticeBoardVO> boardList(String search,String key) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<NoticeBoardVO> list = new ArrayList<NoticeBoardVO>();
				String query = "select * from notice where "+ search + " like '%"+key+"%'"+"order by idx desc";
				try {
						conn = getConnection();
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						NoticeBoardVO vo = null;
						while(rs.next()) {
							vo = new NoticeBoardVO();
							vo.setIdx(rs.getInt("idx"));
							vo.setId(rs.getString("id"));
							vo.setTitle(rs.getString("title"));
							vo.setContents(rs.getString("contents"));
							vo.setFilename(rs.getString("filename"));
							vo.setRegdate(rs.getString("regdate"));
							
							list.add(vo);
							
						}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}catch(Exception e){}
				}
				return list;
			}
			
			
		public int boardInsert(NoticeBoardVO vo){
				String query="insert into notice(idx,id,title,contents,filename) values(board_notice_seq.nextval,?,?,?,?)";
				
				int row=0;
				try {
					conn=getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, vo.getId());
					pstmt.setString(2, vo.getTitle());
					pstmt.setString(3, vo.getContents());
					pstmt.setString(4, vo.getFilename());
		
					row = pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(rs!= null) rs.close();
						if(rs!= null) pstmt.close();
						if(rs!= null) conn.close();
					}catch(Exception e) {}
				}
				//return
				return row;
				}
		
		
		
		public NoticeBoardVO boardSelect(int idx){
			String query="select * from notice where idx=?";
		
			NoticeBoardVO vo = new NoticeBoardVO();
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(query);

				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					vo = new NoticeBoardVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setId(rs.getString("id"));
					vo.setTitle(rs.getString("title"));
					vo.setContents(rs.getString("contents"));
					vo.setFilename(rs.getString("filename"));
					vo.setRegdate(rs.getString("regdate"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!= null) rs.close();
					if(rs!= null) pstmt.close();
					if(rs!= null) conn.close();
				}catch(Exception e) {}
			}
			//return
			return vo;
			}
		
		
		
		
		public int boardEdit(NoticeBoardVO vo){
			String query="update notice set title=?,contents=?,filename=?,regdate=sysdate where idx = ?";
			
			int row=0;
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getContents());
				pstmt.setString(3, vo.getFilename());
				pstmt.setInt(4, vo.getIdx());
				
				row = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!= null) rs.close();
					if(rs!= null) pstmt.close();
					if(rs!= null) conn.close();
				}catch(Exception e) {}
			}
			//return
			return row;
			}
		
	
				public int boardDelete(int idx){
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					int row=0;
					String query = "delete from notice where idx=?";
					try {
							conn = getConnection();
							pstmt = conn.prepareStatement(query);
							pstmt.setInt(1, idx);
							row = pstmt.executeUpdate();
						
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						try {
							if(rs != null) rs.close();
							if(pstmt != null) pstmt.close();
							if(conn != null) conn.close();
						}catch(Exception e){}
					}
					return row;
				}
				
}
