package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QnaBoardDAO {
	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
		
		private QnaBoardDAO() {}
		private static QnaBoardDAO instance = new QnaBoardDAO();
		public static QnaBoardDAO getInstance() {
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
			String query = "select count(*) as cnt from qna";
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
		
		
		
	
		public List<QnaBoardVO> boardList() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<QnaBoardVO> list = new ArrayList<QnaBoardVO>();
			String query = "select * from qna order by q_idx desc";
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					QnaBoardVO vo = null;
					while(rs.next()) {
						vo = new QnaBoardVO();
						vo.setQ_idx(rs.getInt("q_idx"));
						vo.setId(rs.getString("id"));
						vo.setQ_contents(rs.getString("q_contents"));
						vo.setQ_title(rs.getString("q_title"));
						vo.setFilename(rs.getString("filename"));
						vo.setQ_regdate(rs.getString("q_regdate"));
						vo.setQ_readcnt(rs.getInt("q_readcnt"));
						vo.setQ_re_ref(rs.getInt("q_re_ref"));
						vo.setQ_re_lev(rs.getInt("q_re_lev"));
						vo.setQ_re_seq(rs.getInt("q_re_seq"));
				
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
		
		//TEST
		public List<QnaBoardVO> boardTest(int pagestart , int endpage) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<QnaBoardVO> list = new ArrayList<QnaBoardVO>();
			String query = "select X.* from (select rownum as rnum, A.* from(" +
			"select * from qna order by q_idx desc) A " +
					" where rownum <= ?) X where X.rnum >= ? and q_re_ref = 0";
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, endpage);
					pstmt.setInt(2,pagestart);
					rs = pstmt.executeQuery();
					QnaBoardVO vo = null;
					while(rs.next()) {
						vo = new QnaBoardVO();
						
						vo.setQ_idx(rs.getInt("q_idx"));						
						vo.setId(rs.getString("id"));
						vo.setQ_contents(rs.getString("q_contents"));
						vo.setQ_title(rs.getString("q_title"));
						vo.setFilename(rs.getString("filename"));
						vo.setQ_regdate(rs.getString("q_regdate"));
						vo.setQ_readcnt(rs.getInt("q_readcnt"));
						vo.setQ_re_ref(rs.getInt("q_re_ref"));
						vo.setQ_re_lev(rs.getInt("q_re_lev"));
						vo.setQ_re_seq(rs.getInt("q_re_seq"));
					
						list.add(vo);
						
						List<QnaBoardVO> testList = refTest(vo.getQ_idx());
						
						for (QnaBoardVO vo0 : testList) {
							list.add(vo0);
						}
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
		
		public List<QnaBoardVO> refTest(int parentNo) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<QnaBoardVO> list = new ArrayList<QnaBoardVO>();
			String query = "select * from qna where q_re_ref = " + parentNo;
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					QnaBoardVO vo = null;
					while(rs.next()) {
						vo = new QnaBoardVO();
						
						vo.setQ_idx(rs.getInt("q_idx"));
						vo.setId(rs.getString("id"));
						vo.setQ_contents(rs.getString("q_contents"));
						vo.setQ_title(rs.getString("q_title"));
						vo.setFilename(rs.getString("filename"));
						vo.setQ_regdate(rs.getString("q_regdate"));
						vo.setQ_readcnt(rs.getInt("q_readcnt"));
						vo.setQ_re_ref(rs.getInt("q_re_ref"));
						vo.setQ_re_lev(rs.getInt("q_re_lev"));
						vo.setQ_re_seq(rs.getInt("q_re_seq"));
					
						list.add(vo);
						
						List<QnaBoardVO> testList = refTest(vo.getQ_idx());
						
						for (QnaBoardVO vo0 : testList) {
							list.add(vo0);
						}
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
		
		
		
		public List<QnaBoardVO> boardList(int pagestart , int endpage) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<QnaBoardVO> list = new ArrayList<QnaBoardVO>();
			String query = "select X.* from (select rownum as rnum, A.* from(" +
			"select * from qna order by q_idx desc) A " +
					" where rownum <= ?) X where X.rnum >= ?";
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, endpage);
					pstmt.setInt(2,pagestart);
					rs = pstmt.executeQuery();
					QnaBoardVO vo = null;
					while(rs.next()) {
						vo = new QnaBoardVO();
						
						vo.setQ_idx(rs.getInt("q_idx"));
						/*
						PreparedStatement pstmt2 = null;
						ResultSet rs2 = null;
						String str = "select * from qna where q_re_ref = " + vo.getQ_idx();
						pstmt2 = conn.prepareStatement(str);
						rs2 = pstmt.executeQuery();
						QnaBoardVO vo2 = null;
						while(rs2.next()) {
							vo2 = new QnaBoardVO();
							
						}
						*/
						
						vo.setId(rs.getString("id"));
						vo.setQ_contents(rs.getString("q_contents"));
						vo.setQ_title(rs.getString("q_title"));
						vo.setFilename(rs.getString("filename"));
						vo.setQ_regdate(rs.getString("q_regdate"));
						vo.setQ_readcnt(rs.getInt("q_readcnt"));
						vo.setQ_re_ref(rs.getInt("q_re_ref"));
						vo.setQ_re_lev(rs.getInt("q_re_lev"));
						vo.setQ_re_seq(rs.getInt("q_re_seq"));
					
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
		
			public List<QnaBoardVO> boardList(String s_query,int pagestart,int endpage) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<QnaBoardVO> list = new ArrayList<QnaBoardVO>();
				String query = "select X.* from (select rownum as rnum, A.* from(" +
				"select * from qna order by q_idx desc) A where " + s_query +
				" and rownum <= ? ) X where "+ s_query + " and X.rnum >= ?";
				try {
						conn = getConnection();
						pstmt = conn.prepareStatement(query);
						pstmt.setInt(1, endpage);
						pstmt.setInt(2,pagestart);
						rs = pstmt.executeQuery();
						QnaBoardVO vo = null;
						while(rs.next()) {
							vo = new QnaBoardVO();
							vo.setQ_idx(rs.getInt("q_idx"));
							vo.setId(rs.getString("id"));
							vo.setQ_contents(rs.getString("q_contents"));
							vo.setQ_title(rs.getString("q_title"));
							vo.setFilename(rs.getString("filename"));
							vo.setQ_regdate(rs.getString("q_regdate"));
							vo.setQ_readcnt(rs.getInt("q_readcnt"));
							vo.setQ_re_ref(rs.getInt("q_re_ref"));
							vo.setQ_re_lev(rs.getInt("q_re_lev"));
							vo.setQ_re_seq(rs.getInt("q_re_seq"));
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
			String query = "select count(*) as cnt from qna where " + search + " like '%"+key+"%'";
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
		
			public int boardCount(String s_query) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				int row = 0;
				String query = "select count(*) as cnt from qna where " + s_query;
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
		
		
			public List<QnaBoardVO> boardList(String search,String key) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<QnaBoardVO> list = new ArrayList<QnaBoardVO>();
				String query = "select * from qna where "+ search + " like '%"+key+"%'"+"order by q_re_ref desc, q_re_seq asc";
				try {
						conn = getConnection();
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						QnaBoardVO vo = null;
						while(rs.next()) {
							vo = new QnaBoardVO();
							
							vo.setQ_idx(rs.getInt("q_idx"));
							vo.setId(rs.getString("id"));
							vo.setQ_contents(rs.getString("q_contents"));
							vo.setQ_title(rs.getString("q_title"));
							vo.setFilename(rs.getString("filename"));
							vo.setQ_regdate(rs.getString("q_regdate"));
							vo.setQ_readcnt(rs.getInt("q_readcnt"));
							vo.setQ_re_ref(rs.getInt("q_re_ref"));
							vo.setQ_re_lev(rs.getInt("q_re_lev"));
							vo.setQ_re_seq(rs.getInt("q_re_seq"));
							
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
		
			public int boardInsert(QnaBoardVO vo){
				String query="insert into qna(q_idx,id,q_contents,q_title,filename,q_readcnt,q_re_ref,q_re_lev,q_re_seq) values(qna_seq.nextval,?,?,?,?,?,?,?,?)";
				int row=0;

				try {
					conn=getConnection();
					int num = vo.getQ_idx();
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, vo.getId());
					pstmt.setString(2, vo.getQ_contents());
					pstmt.setString(3, vo.getQ_title());
					pstmt.setString(4, vo.getFilename());
					pstmt.setInt(5, vo.getQ_readcnt());
					 if(vo.getQ_re_seq()==0) //     
			                pstmt.setInt(6, num);    
			            else
			                pstmt.setInt(6, vo.getQ_re_ref());
			
					pstmt.setInt(7, vo.getQ_re_lev());
					pstmt.setInt(8, vo.getQ_re_seq());
					
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
		
			public QnaBoardVO boardSelect(int idx){
				String query="select * from qna where q_idx=?";
				QnaBoardVO vo = new QnaBoardVO();
				try {
					conn=getConnection();
					pstmt = conn.prepareStatement(query);

					pstmt.setInt(1, idx);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						vo.setQ_idx(rs.getInt("q_idx"));
						vo.setId(rs.getString("id"));
						vo.setQ_contents(rs.getString("q_contents"));
						vo.setQ_title(rs.getString("q_title"));
						vo.setFilename(rs.getString("filename"));
						vo.setQ_regdate(rs.getString("q_regdate"));
						vo.setQ_readcnt(rs.getInt("q_readcnt"));
						vo.setQ_re_ref(rs.getInt("q_re_ref"));
						vo.setQ_re_lev(rs.getInt("q_re_lev"));
						vo.setQ_re_seq(rs.getInt("q_re_seq"));

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
			
			
			
			public void boardReadcnt(int idx){
				String query="update qna set q_readcnt = q_readcnt + 1 where q_idx=?";
				int row=0;
				try {
					conn=getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, idx);
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
				}
			public int boardEdit(QnaBoardVO vo){
				String query="update qna set q_contents=?,q_title=?,filename=?,q_regdate=sysdate where q_idx = ? ";
				int row=0;
				try {
					conn=getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, vo.getQ_contents());
					pstmt.setString(2, vo.getQ_title());
					pstmt.setString(3, vo.getFilename());
	
					pstmt.setInt(4, vo.getQ_idx());
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
						String query = "delete from qna where q_idx=?";
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
					
				    
				    
			
				    
				    
				    public boolean updateReSeq(QnaBoardVO board)
				    {
				        boolean result = false;
				        
				        int ref = board.getQ_re_ref();      
				        int seq = board.getQ_re_seq();     
				        
				        try {    
				            StringBuffer sql = new StringBuffer();
				            
				            conn = getConnection();
				            conn.setAutoCommit(false); 
				            
				            sql.append("update qna set q_re_seq=q_re_seq+1 ");
				            sql.append("where Q_RE_REF = ? and Q_RE_SEQ > ?");
				            
				            pstmt = conn.prepareStatement(sql.toString());
				            pstmt.setInt(1, ref);
				            pstmt.setInt(2, seq);
				            
				            int flag = pstmt.executeUpdate();
				            if(flag > 0){
				                result = true;
				                conn.commit(); 
				            }
				            
				        } catch (Exception e) {
				            try {
				                conn.rollback(); 
				                if(conn!= null) conn.close();
				            } catch (SQLException sqle) {
				            	
				                sqle.printStackTrace();
				            }
				            throw new RuntimeException(e.getMessage());
				        }
				        
				 
				        return result;
				    }
				    


				
				    
				    
				

				    
				  
}
