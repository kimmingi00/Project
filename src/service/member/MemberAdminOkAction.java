package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import service.Action;

public class MemberAdminOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		MemberDAO dao=MemberDAO.getInstance();	
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		
		RequestDispatcher rd=
				request.getRequestDispatcher("/Contents/Member/Member_adminOk.jsp");
			rd.forward(request, response);
			
	}

}
