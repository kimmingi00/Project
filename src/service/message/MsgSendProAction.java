package service.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;
import service.Action;

public class MsgSendProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String send_id = request.getParameter("send_id");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String receive_id = request.getParameter("receive_id");
		
		String id = "";
		String b_id = "";
		int receive_user = Integer.parseInt(request.getParameter("receive_user"));
		
		if(receive_user==1) {
			id = receive_id;
			b_id = "not";
		}else {
			b_id = receive_id;
			id = "not";
		}
		
		MessageVO mvo = new MessageVO();
		
		mvo.setB_id(b_id); mvo.setContents(contents); mvo.setId(id);
		mvo.setReceive_id(receive_id); mvo.setSend_id(send_id);
		mvo.setTitle(title); 
		
		MessageDAO dao = MessageDAO.getInstance();
		
		int row = dao.msgSend(mvo);
		
		request.setAttribute("row", row);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Message/send_ok.jsp");
		rd.forward(request, response);
		
				

	}

}
