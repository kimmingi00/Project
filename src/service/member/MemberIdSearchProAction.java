package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import service.Action;

public class MemberIdSearchProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao=MemberDAO.getInstance();
		  String tel = request.getParameter("tel");
	      String name = request.getParameter("name");
	       
	       
	          String id = dao.memIdSearch(tel, name);
	          request.setAttribute("id", id);
	          request.setAttribute("tel", tel);
//	         
//	          RequestDispatcher dispatcher =
//	                request.getRequestDispatcher("MemberServlet?command=id_search_pro");
//	          dispatcher.forward(request, response);
//	          
	          RequestDispatcher rd = request.getRequestDispatcher("Contents/Member/id_check.jsp?id="+id);
	          rd.forward(request, response);
	       
	    
	}
	

}
