package service.message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.message.MessageDAO;
import model.message.MessageVO;
import service.Action;

public class MsgSendViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		
		MessageDAO dao = MessageDAO.getInstance();
		
		
		MessageVO mvo = dao.msgView(m_idx);
		
		request.setAttribute("mvo", mvo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Message/msg_view.jsp");
		rd.forward(request, response);

	}

}
