package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.QnaBoardDAO;
import model.board.QnaBoardVO;
import service.Action;

public class BoardQnaReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		QnaBoardVO board = dao.boardSelect(idx);
		
		request.setAttribute("board", board);
		request.setAttribute("page", page);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Board/Q&A/board_qna_reply.jsp");
		rd.forward(request, response);

	}

}

