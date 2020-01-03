package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.BusinessDAO;
import service.Action;

public class BusinessListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BusinessDAO dao= BusinessDAO.getInstance();
		 List list=dao.BusinessList();
		 request.setAttribute("list", list);
		 
		 RequestDispatcher rd=
				 request.getRequestDispatcher("Contents/Member/Business_list.jsp");
		 rd.forward(request, response);
	
		 
		 
		 
				
	}

}
