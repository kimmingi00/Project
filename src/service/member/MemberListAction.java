package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;
import service.Action;

public class MemberListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDAO dao= MemberDAO.getInstance();
		String id=request.getParameter("id");

		
		
		 List<MemberVO> list=dao.MemberList();
		 
		 request.setAttribute("list", list);
		
		 
		 RequestDispatcher rd=
				 request.getRequestDispatcher("Contents/Member/Member_list.jsp");
		 rd.forward(request, response);
	
		 
		 
		 
				
	}

}
