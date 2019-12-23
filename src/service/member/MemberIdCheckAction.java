package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.BusinessDAO;
import model.member.MemberDAO;
import service.Action;

public class MemberIdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Member/Member_id_check.jsp");
		rd.forward(request, response);
		
	}
	}


