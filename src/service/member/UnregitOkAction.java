package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.UnRegitDAO;
import service.Action;

public class UnregitOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UnRegitDAO dao=UnRegitDAO.getInstance();
		
		RequestDispatcher rd=
				request.getRequestDispatcher("Contents/Member/Admin_delete_ok2.jsp");
		rd.forward(request, response);
		
	}

}
