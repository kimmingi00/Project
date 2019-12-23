package service.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Action;

public class MsgSendAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Message/Message_send.jsp");
		rd.forward(request, response);

	}

}
