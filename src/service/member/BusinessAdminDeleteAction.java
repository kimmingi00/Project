package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.BusinessDAO;
import model.member.BusinessVO;
import model.member.MemberVO;
import service.Action;

public class BusinessAdminDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusinessDAO dao=BusinessDAO.getInstance();
		String b_id=request.getParameter("b_id");

		String str="";
		int row=0;
		List<BusinessVO>list=dao.BusinessList();
		for(int i=0;i<list.size();i++) {
			if(b_id.equals(list.get(i).getB_id())) { 
				b_id=list.get(i).getB_id();
			
			}	
		}
		BusinessVO vo=dao.getBusiness(b_id);
		vo.setB_id(b_id);
				
	
		row=dao.delete(vo);
		request.setAttribute("row", row);
		request.setAttribute("id", vo.getB_id());
		request.setAttribute("name", vo.getB_name());
		if(row==1) {
			str="/MemberServlet?command=delete_ok";
			
		}else {
			str="/MemberServlet?command=member_admin";
		}
		
		
		RequestDispatcher rd=
				request.getRequestDispatcher(str);
		rd.forward(request, response);
		
	}
	

}
