package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberVO;
import service.Action;

public class MemberViewAction implements Action {

	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDAO dao=MemberDAO.getInstance();
		
		HttpSession session = request.getSession();
		
			MemberVO user = (MemberVO) session.getAttribute("user");
			
			MemberVO vo = dao.getMember(user.getId());

			
			request.setAttribute("vo", vo);    
			
			RequestDispatcher rd=
					request.getRequestDispatcher("Contents/Member/memberView.jsp");
			   rd.forward(request, response);
			
	}

}
