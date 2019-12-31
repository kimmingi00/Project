package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.QnaBoardDAO;
import model.board.QnaBoardVO;
import service.Action;

public class BoardQnaViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		String id = request.getParameter("id");
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		QnaBoardVO board = dao.boardSelect(idx);
		
		
	
		boolean bool = false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++){
			info = cookies[i];
			if(info.getName().equals("boardCookie"+idx)){
				bool = true; 
			break;
		}
		}
		String newValue=""+System.currentTimeMillis();
		if(!bool){
			info = new Cookie("boardCookie"+idx,newValue);
			info.setMaxAge(24*60*60);
			response.addCookie(info);
			dao.boardReadcnt(idx);
			
		}
		
		board.setQ_contents(board.getQ_contents());
		
		
		
		request.setAttribute("id", id);
		request.setAttribute("page", page);
		request.setAttribute("board", board);
		
		RequestDispatcher d = request.getRequestDispatcher("/Contents/Board/Q&A/board_qna_view.jsp");
				d.forward(request, response);

			
	}
}
