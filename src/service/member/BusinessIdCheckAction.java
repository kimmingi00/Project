package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.BusinessDAO;
import service.Action;

public class BusinessIdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusinessDAO dao=BusinessDAO.getInstance();
		
		String b_id = request.getParameter("b_id");
		
		String temp = dao.userSearch(b_id);
		
		int row=0;
		
		if(!temp.equals("")) {
			row=1;
		}
		
		request.setAttribute("b_id", b_id);
		request.setAttribute("row", row);
		
		RequestDispatcher rd = request.getRequestDispatcher("Contents/Member/Member_id_check2.jsp");
		rd.forward(request, response);
		
	}
	}


