package service.board;

import java.io.File;
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

public class BoardQnaModifyProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("/upload");
		String idx =request.getParameter("idx");
		String encType = "UTF-8";
		int sizeLimit = 2*1024*1024; 
		
		MultipartRequest multi = new MultipartRequest(request, path,sizeLimit,encType,new DefaultFileRenamePolicy());
			String id = multi.getParameter("id");
			String title = multi.getParameter("title");
			String contents = multi.getParameter("contents");
			
			String filename = multi.getFilesystemName("filename");
			String filename2 = multi.getParameter("filename2");
			
			
			String file="";
			if(filename == null) {
				file=filename2;
			}else if(filename != null){
				
				file=filename;
			}
			
			
		QnaBoardVO vo = new QnaBoardVO();
		vo.setQ_idx(Integer.parseInt(idx));
		vo.setId(id);
		vo.setQ_title(title);
		vo.setQ_contents(contents);
	
		
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		
		QnaBoardVO delvo = dao.boardSelect(Integer.parseInt(idx));
		
	    String fileurl = delvo.getFilename();
	    
	    if(filename==null) {
	         vo.setFilename(file);
	      }else {
	         vo.setFilename(filename);
	         File f = new File(path + "\\" + fileurl);      
	         if(f.exists()){
	            f.delete();
	         }
	      }
		int row = dao.boardEdit(vo);
		int page = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("page", page);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("BoardServlet?command=board_qna");
		rd.forward(request, response);

	}

}
