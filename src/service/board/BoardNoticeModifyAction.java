package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.NoticeBoardDAO;
import model.board.NoticeBoardVO;
import service.Action;

public class BoardNoticeModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
//		int page = Integer.parseInt(request.getParameter("page"));
		                        
		NoticeBoardDAO DAO = NoticeBoardDAO.getInstance();
		NoticeBoardVO board = DAO.boardSelect(idx);
		
		request.setAttribute("board",board);
//		request.setAttribute("page", page);

		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Board/Notice/board_notice_modify.jsp");
		rd.forward(request, response);

	}

}
