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

public class MemberDeleteProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDAO dao= MemberDAO.getInstance();
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		
	String checkPW=request.getParameter("checkPW");
	String query="";
	SHA256 s = new SHA256(checkPW.getBytes());
	BASE64Encoder Base64Encoder = new BASE64Encoder();
	 String str="";
	if(user.getPass().equals(Base64Encoder.encode(s.GetHashCode()))){
	
		int row=dao.delete(user);
		 
			str="MemberServlet?command=member_delete_check";
			session.invalidate();
		}
		else{
			str="MemberServlet?command=member_delete";
			
		}
	
		RequestDispatcher rd=
				request.getRequestDispatcher(str);

		rd.forward(request, response);
		
	}

}
