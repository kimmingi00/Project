package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KISA.SHA256;
import model.member.BusinessDAO;
import model.member.BusinessVO;
import service.Action;
import sun.misc.BASE64Encoder;

public class BusinessPassSearchProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_pass = request.getParameter("pass");
		String  b_id   = request.getParameter("id");
		System.out.println(b_id+"a");
		System.out.println(b_pass+"b");
		
		BusinessVO vo = new BusinessVO();
		
		
		SHA256 s = new SHA256(b_pass.getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		
		vo.setB_pass(Base64Encoder.encode(s.GetHashCode()));
		vo.setB_id(b_id);
		System.out.println(vo.getB_pass()+"암호화된값");		
		//-----------------------------------------------//
		
		BusinessDAO dao=BusinessDAO.getInstance();
		int row = dao.passEdit(vo);
		System.out.println(row+"row값 ");
		String Jsp="";
		if(row == 1) {
			
			request.setAttribute("result", "업데이트 완료");
			
			 Jsp="MemberServlet?command=member_login";
		} 
		
		
		else {
			request.setAttribute("result", "비밀번호 업데이트 실패");
			 Jsp="BusinessServlet?command=business_pass_search";
		}
		
		RequestDispatcher rd=
				request.getRequestDispatcher(Jsp);
		rd.forward(request, response);
		
	}

}
