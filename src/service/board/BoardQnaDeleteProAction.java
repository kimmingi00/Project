package service.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.QnaBoardDAO;
import model.board.QnaBoardVO;
import service.Action;

public class BoardQnaDeleteProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("/upload");
		QnaBoardVO delvo = dao.boardSelect(idx);
		int row = dao.boardDelete(idx);
		String fileurl = delvo.getFilename();
		
		if(row==1) {
			File f = new File(path + "\\" + fileurl);	
			if(f.exists()){
				f.delete();
			}
		}
		
		request.setAttribute("row", row);
		request.setAttribute("page", page);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Contents/Board/Q&A/board_qna_delete_pro.jsp");
		dispatcher.forward(request, response);

	}

}
