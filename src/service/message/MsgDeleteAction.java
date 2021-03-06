package service.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import service.Action;

public class MsgDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String s_idx = request.getParameter("idx");
		String id = request.getParameter("id");
		
		String[] s_idx_array = s_idx.split(",");
		int[] idx_array = new int[s_idx_array.length];
		for(int i=0; i<idx_array.length; i++) {
			idx_array[i]=Integer.parseInt(s_idx_array[i]);
		}
		
		MessageDAO dao = MessageDAO.getInstance();
		
		for(int i=0; i<idx_array.length; i++) {
			dao.msgDelete(idx_array[i]);
		}
		
		request.setAttribute("id", id);
		
		RequestDispatcher rd = request.getRequestDispatcher("/MessageServlet?command=MyMsgList");
		rd.forward(request, response);
		
		
		

	}

}
