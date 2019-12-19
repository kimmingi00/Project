package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import service.Action;

public class BusinessIdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao=MemberDAO.getInstance();
		
		String id = request.getParameter("id");
		
		String temp = dao.userSearch(id);
		
		int row=0;
		
		if(!temp.equals("")) {
			row=1;
		}
		
		request.setAttribute("id", id);
		request.setAttribute("row", row);
		
		RequestDispatcher rd = request.getRequestDispatcher("Contents/Member/Member_id_check.jsp");
		rd.forward(request, response);
		
	}
	}


