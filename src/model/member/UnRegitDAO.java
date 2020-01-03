package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import util.DBConn;

public class UnRegitDAO {
   private static UnRegitDAO instance = new UnRegitDAO();
   public static UnRegitDAO getInstance() {
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
   public int insertUnRegit(UnRegitVO rvo) {
      int row = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      
      String query="insert into unregit_user(ur_email, ur_name, ur_tel, ur_pass) values("
            + "?,?,?,?)";
      
      try {
         conn = getConnection();
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
   
   public int deleteUnRegit(UnRegitVO vo) {
      int row = 0;
      Connection conn = null;
      PreparedStatement pstmt = null;
      
      String query="delete from unregit_user where ur_tel = ?";
      
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, vo.getUr_tel());
         row = pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         DBConn.close(conn, pstmt);
      }
      
      
      return row;
   }
   public List<UnRegitVO> List() {
      Connection conn=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      List <UnRegitVO> list=new ArrayList<UnRegitVO>();
      String query="select * from product where trunc(to_date(sysdate)) - trunc(p_indate) > 14;";
      //String query="select *from unregit_user where regdate >= to_char(add_months(sysdate,-14))";
      try {
         conn=getConnection();
         pstmt=conn.prepareStatement(query);
         rs=pstmt.executeQuery();
         UnRegitVO vo=null;
         while(rs.next()) {
            vo=new UnRegitVO();
            
            
            vo.setUr_email(rs.getString("ur_email"));
            vo.setUr_name(rs.getString("ur_name"));
            vo.setUr_pass(rs.getString("ur_pass"));
            vo.setUr_tel(rs.getString("ur_tel"));
            vo.setRegdate(rs.getString("regdate").substring(0,10));
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
   public UnRegitVO getMember( String ur_tel) {
      Connection conn=null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = "select * from unregit_user where ur_tel=?";
      UnRegitVO vo = null;
      try {
         conn=getConnection();
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, ur_tel);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            vo = new UnRegitVO();
            
            //vo.setlastdate(rs.getString("lastdate"));
            vo.setUr_email(rs.getString("ur_email"));
            vo.setUr_name(rs.getString("ur_name"));
            vo.setUr_pass(rs.getString("ur_pass"));
            vo.setRegdate(rs.getString("regdate"));
            //vo.setReserv_num(rs.getString("reserv_num"));
            vo.setUr_tel(rs.getString("ur_tel"));
            
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
}