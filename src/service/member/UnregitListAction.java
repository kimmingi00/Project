package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.UnRegitDAO;
import model.member.UnRegitVO;
import service.Action;

public class UnregitListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UnRegitDAO dao= UnRegitDAO.getInstance();
		String ur_tel=request.getParameter("ur_tel");

		
		
		 List<UnRegitVO> list=dao.List();
		 
		 request.setAttribute("list", list);
		 request.setAttribute("ur_tel", ur_tel);
		
		 
		 RequestDispatcher rd=
				 request.getRequestDispatcher("Contents/Member/unregit_list.jsp");
		 rd.forward(request, response);
	
		 
		 
		 
				
	}

}
