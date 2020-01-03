package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.BusinessDAO;
import service.Action;

public class BusinessIdSearchProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusinessDAO dao=BusinessDAO.getInstance();
		  String b_tel = request.getParameter("tel");
	      String b_name = request.getParameter("name");
	       
	       
	          String b_id = dao.BusinessIdSearch(b_tel, b_name);
	          request.setAttribute("id", b_id);
	          request.setAttribute("tel",b_tel);
//	         
//	          RequestDispatcher dispatcher =
//	                request.getRequestDispatcher("MemberServlet?command=id_search_pro");
//	          dispatcher.forward(request, response);
//	          
	          RequestDispatcher rd = request.getRequestDispatcher("Contents/Member/id_check.jsp?id="+b_id);
	          rd.forward(request, response);
	       
	    
	}
	

}
