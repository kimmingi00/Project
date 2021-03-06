package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.BusinessDAO;
import model.member.MemberDAO;
import service.Action;

public class MemberIdCheckProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao=MemberDAO.getInstance();
		BusinessDAO b_dao=BusinessDAO.getInstance();
		String id = request.getParameter("id");
		
		String temp = dao.userSearch(id);
		String temp2 = b_dao.userSearch(id);
		
		int row=1;
		
		if(temp.equals("")) {
			if(temp2.equals("")) {
				row=0;
			}
		}
		
		request.setAttribute("id", id);
		request.setAttribute("row", row);
		
		RequestDispatcher rd = request.getRequestDispatcher("Contents/Member/Member_id_check.jsp");
		rd.forward(request, response);
		
	}
	}


