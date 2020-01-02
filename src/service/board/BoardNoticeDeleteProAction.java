package service.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.NoticeBoardDAO;
import model.board.NoticeBoardVO;
import service.Action;

public class BoardNoticeDeleteProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("/upload");
		NoticeBoardVO delvo = dao.boardSelect(idx);
		int row = dao.boardDelete(idx);
		String fileurl = delvo.getFilename();
		
		if(row==1) {
			File f = new File(path + "\\" + fileurl);	
			if(f.exists()){
				f.delete();
			
			}
		}
		
		request.setAttribute("row", row);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Contents/Board/Notice/board_notice_delete_pro.jsp");
		dispatcher.forward(request, response);
	}

}
