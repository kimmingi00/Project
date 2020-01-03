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

public class MemberBmProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
MemberDAO dao=MemberDAO.getInstance();
		
		HttpSession session = request.getSession();
		
			MemberVO user = (MemberVO) session.getAttribute("user");
			
		String checkPW=request.getParameter("checkPW");
		String query="";
		SHA256 s = new SHA256(checkPW.getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		if(user.getPass().equals(Base64Encoder.encode(s.GetHashCode()))) {
			
			query="MemberServlet?command=member_view";
		}
		else {
			query="MemberServlet?command=member_bm";
		}
		RequestDispatcher rd=
				request.getRequestDispatcher(query);
		rd.forward(request, response);
		
	}
	
}
