package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Action;
import util.EmailConfirm;

public class BusinessEmailCheakAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		EmailConfirm emailconf = new EmailConfirm();
		String authNum = emailconf.connectEmail(email);
		
		request.setAttribute("authNum", authNum);
		request.setAttribute("email", email);
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("Contents/Member/Member_email.jsp");
		dispatcher.forward(request, response);
	}
	}


