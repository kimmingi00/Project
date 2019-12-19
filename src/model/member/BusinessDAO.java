package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class BusinessDAO {
		 private BusinessDAO() {}
		 private static BusinessDAO instance=new BusinessDAO();
		 public static BusinessDAO getInstance() {
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

			public List<BusinessVO> BusinessList() {
				Connection conn=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				List <BusinessVO> list=new ArrayList<BusinessVO>();
				String query="select * from business";
				try {
					conn=getConnection();
					pstmt=conn.prepareStatement(query);
					rs=pstmt.executeQuery();
					BusinessVO vo=null;
					while(rs.next()) {
						vo=new BusinessVO();
						vo.setB_email(rs.getString("b_email"));
						vo.setB_id(rs.getString("b_id"));
						vo.setB_lastdate(rs.getString("b_lastdate").substring(0,10));
						vo.setB_name(rs.getString("b_name"));
						vo.setB_pass(rs.getString("b_pass"));
						vo.setB_rating(rs.getInt("b_rating"));
						vo.setB_regdate(rs.getString("b_regdate").substring(0,10));
						vo.setB_tel(rs.getString(rs.getString("b_tel")));
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
			public int BusinessWrite(BusinessVO vo) {
				Connection conn=null;
				String query = "insert into business(b_id,b_name,b_pass,b_tel,b_email,b_rating)"
						+ "values(?,?,?,?,?,?)";
						
					int row=0;
					
				try {
					  conn=getConnection();
					  pstmt=conn.prepareStatement(query);
					  pstmt.setString(1,vo.getB_id() );
					  pstmt.setString(2, vo.getB_name());
					  pstmt.setString(3, vo.getB_pass());
					  pstmt.setString(4, vo.getB_tel());
					  pstmt.setString(5,vo.getB_email());
					  pstmt.setInt(6, vo.getB_rating());
					  
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
			public String userSearch(String b_id) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String query="select * from business where b_id=?";
				
				String id="";
				
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, b_id);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
					id = rs.getString("b_id");
					
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
					return id;
				
			}
}
