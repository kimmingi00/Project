package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KISA.SHA256;
import model.member.MemberDAO;
import model.member.MemberVO;
import service.Action;
import sun.misc.BASE64Encoder;
import util.PassConfirm;

public class MemberPassSearchProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass = request.getParameter("pass");
		String id   = request.getParameter("id");
		System.out.println(id+"a");
		System.out.println(pass+"b");
		
		MemberVO vo = new MemberVO();
		
		
		SHA256 s = new SHA256(pass.getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		
		vo.setPass(Base64Encoder.encode(s.GetHashCode()));
		vo.setId(id);
		System.out.println(vo.getPass()+"암호화된값");		
		//-----------------------------------------------//
		
		MemberDAO dao=MemberDAO.getInstance();
		int row = dao.passEdit(vo);
		System.out.println(row+"row값 ");
		String Jsp="";
		if(row == 1) {
			
			request.setAttribute("result", "업데이트 완료");
			
			 Jsp="MemberServlet?command=member_login";
		} 
		
		
		else {
			request.setAttribute("result", "비밀번호 업데이트 실패");
			 Jsp="MemberServlet?command=member_pass_search";
		}
		
		RequestDispatcher rd=
				request.getRequestDispatcher(Jsp);
		rd.forward(request, response);
		
	}

}
