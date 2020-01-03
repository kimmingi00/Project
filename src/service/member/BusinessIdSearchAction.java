package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Action;

public class BusinessIdSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	          RequestDispatcher dispatcher =
	                request.getRequestDispatcher("Contents/Member/b_test.jsp");
	          dispatcher.forward(request, response);
	          
	      
	       
	    
	}

}
