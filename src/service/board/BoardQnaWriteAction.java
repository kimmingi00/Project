package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Action;

public class BoardQnaWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("page", page);
		
		RequestDispatcher d = request.getRequestDispatcher("/Contents/Board/Q&A/board_qna_write.jsp");
		d.forward(request, response);


	}

}
