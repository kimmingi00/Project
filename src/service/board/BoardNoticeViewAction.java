package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.NoticeBoardDAO;
import model.board.NoticeBoardVO;
import service.Action;

public class BoardNoticeViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String id = request.getParameter("id");
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		NoticeBoardVO board = dao.boardSelect(idx);
		
		request.setAttribute("id", id);
		request.setAttribute("board", board);
		
		RequestDispatcher d = request.getRequestDispatcher("/Contents/Board/Notice/board_notice_view.jsp");
				d.forward(request, response);

	}
}
