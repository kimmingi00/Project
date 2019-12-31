package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.QnaBoardDAO;
import model.board.QnaBoardVO;
import service.Action;

public class BoardQnaReplyProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		QnaBoardVO board= new QnaBoardVO();
        
		int idx = Integer.parseInt(request.getParameter("idx"));
		int page = Integer.parseInt(request.getParameter("page"));
        
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String contents = request.getParameter("contents");
        String filename = request.getParameter("filename");
        int ref = Integer.parseInt(request.getParameter("q_re_ref"));
        int lev = Integer.parseInt(request.getParameter("q_re_lev"));
        int seq = Integer.parseInt(request.getParameter("q_re_seq"));
       
		
		
        board.setQ_re_ref(idx);
        board.setQ_re_seq(seq);
        dao.updateReSeq(board);
        board.setQ_idx(idx); 
        board.setId(id);
        board.setQ_title(title);
        board.setQ_contents(contents);
        board.setQ_re_ref(idx);
        board.setQ_re_lev(lev+1);
        board.setQ_re_seq(seq+1);
        board.setFilename(filename);
        
//      board.setQ_parent(idx);
//      dao.boardReEdit(board);
        dao.boardInsert(board);
        
//        dao.rewriteBoard(board);

    	request.setAttribute("page", page);
    	
    	
    	
    	RequestDispatcher rd = request.getRequestDispatcher("BoardServlet?command=board_qna");
		rd.forward(request, response);


	}

}
