package service.message;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;
import service.Action;

public class MsgSendListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String send_id = request.getParameter("id");
		
		MessageDAO dao = MessageDAO.getInstance();
		List<MessageVO> mlist = dao.mySendMsgList(send_id);
				
		
		
		request.setAttribute("mlist", mlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Message/My_Send_Message.jsp");
		rd.forward(request, response);
	
	}

}
