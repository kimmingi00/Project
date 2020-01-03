package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;









public class MemberDAO {
	 private MemberDAO() {}
	 private static MemberDAO instance=new MemberDAO();
	 public static MemberDAO getInstance() {
		 return instance;
	 }
	 
		public Connection getConnection()throws Exception{
			Connection conn=null;
			Context initContext= new InitialContext();
			Context envContext=(Context)initContext.lookup("java:/comp/env");
			DataSource ds= (DataSource)envContext.lookup("jdbc/myoracle");
			conn=ds.getConnection();
			return conn;
		}
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		public List<MemberVO> MemberList() {
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List <MemberVO> list=new ArrayList<MemberVO>();
			String query="select * from Member";
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement(query);
				rs=pstmt.executeQuery();
				MemberVO vo=null;
				while(rs.next()) {
					vo=new MemberVO();
					vo.setAdmin(rs.getInt("admin"));
					vo.setlastdate(rs.getString("lastdate").substring(0,10));
					vo.setEmail(rs.getString("email"));
					vo.setFavorite(rs.getString("favorite"));
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setPass(rs.getString("pass"));
					vo.setregdate(rs.getString("regdate").substring(0,10));
					vo.setTel(rs.getString("tel"));
					vo.setTheme(rs.getString("theme"));
					list.add(vo);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e) {
				}
			}
			return list;
		}
		public List<MemberVO>adminList(){
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<MemberVO>list=new ArrayList<MemberVO>();
			String query="select * from Member where admin=1";
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement(query);
				rs=pstmt.executeQuery();
				MemberVO vo=null;
				while(rs.next()) {
					vo=new MemberVO();
					
					vo.setlastdate(rs.getString("lastdate").substring(0,10));
					vo.setEmail(rs.getString("email"));
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setregdate(rs.getString("regdate").substring(0,10));
					vo.setTel(rs.getString("tel"));
					list.add(vo);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e) {
				}
			}
			return list;
			
		}
		public List<MemberVO> NewMemberList() {
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List <MemberVO> list=new ArrayList<MemberVO>();
			String query="select * from Member order by regdate desc";
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement(query);
				rs=pstmt.executeQuery();
				MemberVO vo=null;
				while(rs.next()) {
					vo=new MemberVO();
					vo.setAdmin(rs.getInt("admin"));
					vo.setlastdate(rs.getString("lastdate").substring(0,10));
					vo.setEmail(rs.getString("email"));
					vo.setFavorite(rs.getString("favorite"));
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setPass(rs.getString("pass"));
					vo.setregdate(rs.getString("regdate").substring(0,10));
					vo.setTel(rs.getString("tel"));
					vo.setTheme(rs.getString("theme"));
					list.add(vo);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (Exception e) {
				}
			}
			return list;
		}
		public int MemberWrite(MemberVO vo) {
			Connection conn=null;
			String query = "insert into member(id,name,pass,tel,email,favorite,admin,theme)"
					+ "values(?,?,?,?,?,?,0,?)";
					
				int row=0;
				
			try {
				  conn=getConnection();
				  pstmt=conn.prepareStatement(query);
				  pstmt.setString(1,vo.getId() );
				  pstmt.setString(2, vo.getName());
				  pstmt.setString(3, vo.getPass());
				  pstmt.setString(4, vo.getTel());
				  pstmt.setString(5,vo.getEmail());
				  pstmt.setString(6, vo.getFavorite());
				  pstmt.setString(7, vo.getTheme());
				 row=pstmt.executeUpdate();
				 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return row;
		}	
		public int modifytheme(MemberVO vo) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			int row = 0;
			
			System.out.println("dao the: "+vo.getTheme());
			System.out.println("dao fav: "+vo.getFavorite());
			// Query 문 작성
			String query = "update member set theme=?, favorite=?  where id=?";
			try { 
				conn=getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, vo.getTheme());
				pstmt.setString(2, vo.getFavorite());
				pstmt.setString(3, vo.getId());
				System.out.println("update member set theme='"+vo.getTheme()+"', favorite='"+vo.getFavorite()+"'  where id='"+vo.getId()+"'");
				
				row = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
			
					if (pstmt != null)
						pstmt.close();
					if(conn!=null)
						conn.close();
					
				} catch (Exception e) {
					
				} // Finally 끝
			}
			// Return
			return row;
		}
		public String userSearch(String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String query="select * from member where id=?";
			
			String m_id="";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
				m_id = rs.getString("id");
				
				}
				
				
				
				}catch(Exception e) {
					e.printStackTrace();
				}finally {try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}	
					
				
			}
				return m_id;
			
		}
	
		public int memberLogin( String id, String pass) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "select pass from member where id=?";
			int row = 0;
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					String dbpass = rs.getString("pass");
					if(dbpass.equals(pass)) {
						query = "update member set lastdate=sysdate where id=?";
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, id);
						pstmt.executeUpdate();
						row = 1;
					} else {
						row = 0;
					}
				} else {
					row = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally  {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
			
			return row;
		}	
		public MemberVO getMember( String id) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "select * from member where id=?";
			MemberVO vo = null;
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo = new MemberVO();
					vo.setAdmin(rs.getInt("admin"));
					//vo.setlastdate(rs.getString("lastdate"));
					vo.setEmail(rs.getString("email"));
					vo.setFavorite(rs.getString("favorite"));
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setPass(rs.getString("pass"));
					//vo.setregdate(rs.getString("regdate"));
					//vo.setReserv_num(rs.getString("reserv_num"));
					vo.setTel(rs.getString("tel"));
					vo.setTheme(rs.getString("theme"));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally  {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
			
			return vo;
		}	
		public int memIdCheck( String id) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// Query 문 작성
			String query = "select count(*) from member where id=?";
			int row = 0;
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					row = rs.getInt(1);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				} // Finally 끝
			}
			// Return
			return row;
		}
		public int modifyMem( MemberVO vo) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int row = 0;

			// Query 문 작성
			String query = "update member set pass=?, tel=?, email=?, favorite=?,theme=? where id=?";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, vo.getPass());
				pstmt.setString(2, vo.getTel());
				pstmt.setString(3, vo.getEmail());
				pstmt.setString(4, vo.getFavorite());
				pstmt.setString(5, vo.getTheme());
				pstmt.setString(6, vo.getId());
				
				row = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if(conn!=null)
						conn.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				} // Finally 끝
			}
			// Return
			return row;
			
		}
		
		public String memIdSearch(String tel,String name) {
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int row = 0;

			// Query 문 작성
			String query = "select id from member where name=? and tel=?";
			String id = null;
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, name);
				pstmt.setString(2, tel);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					id = rs.getString("id");
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if(conn!=null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				} // Finally 끝
			}
			// Return
			return id;
			
		}
		public MemberVO userSearchEmail(String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String query="select * from member where id=?";
			
			MemberVO vo=null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo=new MemberVO();
					vo.setEmail(rs.getString("email"));
					vo.setId(rs.getString("id"));
					vo.setPass(rs.getString("pass"));
				
				}	
				}catch(Exception e) {
					e.printStackTrace();
				}finally {try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if(conn!=null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
					
			}
				 
		}	
			return vo ;
}
		public int passEdit(MemberVO vo) {
			Connection conn = null;
			PreparedStatement pstmt=null;
			String query="update member set pass=? where id=?";
				
			int row=0;
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,vo.getPass());
				System.out.println(vo.getPass()+" dao1");
				pstmt.setString(2, vo.getId());
				System.out.println(vo.getId()+" dao2");
				row=pstmt.executeUpdate();
				
				
			} catch (Exception e) {
			}finally {
			}
				return row ;
		}
		public int delete(MemberVO vo) {
			Connection conn = null;
			PreparedStatement pstmt=null;
			String query="delete from member where id=?";
				
			int row=0;
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,vo.getId());
				row=pstmt.executeUpdate();
				
				
			} catch (Exception e) {
			}finally {
			}
				return row ;
		}
		public int modAdmin(MemberVO vo) {
			Connection conn = null;
			PreparedStatement pstmt=null;
			String query="update member set admin=1 where id=?";
				
			int row=0;
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,vo.getId());
				row=pstmt.executeUpdate();
				
				
			} catch (Exception e) {
			}finally {
			}
				return row ;
		}
		public int csAdmin(MemberVO vo) {
			Connection conn = null;
			PreparedStatement pstmt=null;
			String query="update member set admin=0 where id=?";
				
			int row=0;
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,vo.getId());
				row=pstmt.executeUpdate();
				
				
			} catch (Exception e) {
			}finally {
			}
				return row ;
		}
	
}