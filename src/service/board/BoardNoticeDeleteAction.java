package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Action;

public class BoardNoticeDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));

		
		request.setAttribute("idx",idx);

		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Board/Notice/board_notice_delete.jsp");
		rd.forward(request, response);

	}

}
