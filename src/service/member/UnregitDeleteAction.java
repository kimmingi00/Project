package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.BusinessVO;
import model.member.UnRegitDAO;
import model.member.UnRegitVO;
import service.Action;

public class UnregitDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UnRegitDAO dao=UnRegitDAO.getInstance();
		String ur_tel=request.getParameter("ur_tel");

		String str="";
		int row=0;
		List<UnRegitVO>list=dao.List();
		for(int i=0;i<list.size();i++) {
			if(ur_tel.equals(list.get(i).getUr_tel())) { 
				ur_tel=list.get(i).getUr_tel();
			
			}	
		}
		UnRegitVO vo=dao.getMember(ur_tel);
		vo.setUr_tel(ur_tel);
				
	
		row=dao.deleteUnRegit(vo);
		request.setAttribute("row", row);
		request.setAttribute("ur_tel", vo.getUr_tel());
		request.setAttribute("ur_name", vo.getUr_name());
		if(row==1) {
			str="/MemberServlet?command=member_delete_ok2";
			
		}else {
			str="/MemberServlet?command=member_admin";
		}
		
		
		RequestDispatcher rd=
				request.getRequestDispatcher(str);
		rd.forward(request, response);
		
	}
	

}
