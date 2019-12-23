package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import KISA.SHA256;
import model.member.BusinessDAO;
import model.member.BusinessVO;
import service.Action;
import sun.misc.BASE64Encoder;

public class BusinessLoginProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusinessDAO dao=BusinessDAO.getInstance();
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("b_id");
		String pass=request.getParameter("b_pass");
		SHA256 s = new SHA256(pass.getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		pass=Base64Encoder.encode(s.GetHashCode());
		int row=dao.BusinessLogin(id, pass);	
		request.setAttribute("row", row);

		if(row==1) { 
			BusinessVO user = dao.getBusiness(id);
			
			HttpSession session = request.getSession(); 
			session.setAttribute("b_user", user);
			session.setMaxInactiveInterval(1800); 
			request.setAttribute("id", id);
		
		RequestDispatcher rd = request.getRequestDispatcher("/IndexServlet?command=index");
		rd.forward(request, response);
		}
		else  {
			
			RequestDispatcher rd = request.getRequestDispatcher("/MemberServlet?command=member_login");
			rd.forward(request, response);
	}
	}
}
