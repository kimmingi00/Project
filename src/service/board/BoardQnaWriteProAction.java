package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.board.QnaBoardDAO;
import model.board.QnaBoardVO;
import service.Action;

public class BoardQnaWriteProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("upload");

		String encType = "UTF-8";
		int sizeLimit = 2*1024*1024; 
		MultipartRequest multi = new MultipartRequest(request, path,sizeLimit,encType,new DefaultFileRenamePolicy());
		
		String id = multi.getParameter("id");
		String title = multi.getParameter("title");
		String contents = multi.getParameter("contents");
		String filename = multi.getFilesystemName("filename");
		int page = Integer.parseInt(request.getParameter("page"));
		
		QnaBoardVO board = new QnaBoardVO();
		board.setId(id);
		board.setQ_title(title);
		board.setQ_contents(contents);
		board.setFilename(filename);
		
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		int row = dao.boardInsert(board);
		request.setAttribute("row", row);
		request.setAttribute("page", page);
		
		RequestDispatcher d = request.getRequestDispatcher("BoardServlet?command=board_qna");
		d.forward(request, response);

	}

}
