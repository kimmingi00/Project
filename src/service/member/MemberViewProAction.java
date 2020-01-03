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

public class MemberViewProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		MemberDAO dao= MemberDAO.getInstance();
		MemberVO member = dao.getMember(vo.getId());
		 member.setPass((String)request.getParameter("pass"));
		SHA256 s = new SHA256(member.getPass().getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		member.setPass(Base64Encoder.encode(s.GetHashCode()));
		member.setTel((String)request.getParameter("tel"));
		member.setEmail((String)request.getParameter("email"));
		
		dao.modifyMem(member);
		session.invalidate();
		RequestDispatcher  rd = request.getRequestDispatcher("IndexServlet?command=index");
		   rd.forward(request, response);
		
	}

}
