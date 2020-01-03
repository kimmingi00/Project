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

public class MemberGiveAdminAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao=MemberDAO.getInstance();
		String id=request.getParameter("id");
		List<MemberVO>list=dao.MemberList();
		for(int i=0;i<list.size();i++) {
			if(id.equals(list.get(i).getId())) {
				id=list.get(i).getId();
			}
		}
		MemberVO vo=dao.getMember(id);
		vo.setId(id);
		
		System.out.println(id+"1");
		
		int row=0;
		String str="";
		row=dao.modAdmin(vo);
		request.setAttribute("row", row);
		request.setAttribute("id", vo.getId());
		request.setAttribute("name", vo.getName());
		if(row==1) {
			str="/MemberServlet?command=member_admin_ok";
			
		}else {
			str="/MemberServlet?command=member_list";
		}
		RequestDispatcher rd=
				request.getRequestDispatcher(str);
		rd.forward(request, response);
		
		
		
		
				
	}

}
