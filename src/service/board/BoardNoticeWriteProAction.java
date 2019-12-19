package service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.board.NoticeBoardDAO;
import model.board.NoticeBoardVO;
import service.Action;

public class BoardNoticeWriteProAction extends HttpServlet implements Action {

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
		
		NoticeBoardVO board = new NoticeBoardVO();
		board.setId(id);
		board.setTitle(title);
		board.setContents(contents);
		board.setFilename(filename);
		
		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		int row = dao.boardInsert(board);
		request.setAttribute("row", row);
		
		RequestDispatcher d = request.getRequestDispatcher("BoardServlet?command=board_notice");
		d.forward(request, response);
	}

}
