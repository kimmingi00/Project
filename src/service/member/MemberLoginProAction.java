package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import KISA.SHA256;
import model.member.MemberDAO;
import model.member.MemberVO;
import service.Action;
import sun.misc.BASE64Encoder;

public class MemberLoginProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao=MemberDAO.getInstance();
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		SHA256 s = new SHA256(pass.getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		pass=Base64Encoder.encode(s.GetHashCode());
		int row=dao.memberLogin(id, pass);	
		//request.setAttribute("row", row);

		if(row==1) { 
			MemberVO user = dao.getMember(id);
			
			HttpSession session = request.getSession(); 
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(1800); 
			request.setAttribute("id", id);
			
			request.setAttribute("admin", user.getAdmin());
			
		
		RequestDispatcher rd = request.getRequestDispatcher("/IndexServlet?command=index&admin="+user.getAdmin());
		rd.forward(request, response);
		}
		else  {
			
			RequestDispatcher rd = request.getRequestDispatcher("/MemberServlet?command=member_login");
			rd.forward(request, response);
	}
	}
}
