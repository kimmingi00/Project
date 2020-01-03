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

public class MemberPassSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String JSP_PAGE = "";
		
		String email = request.getParameter("email");
		String id= request.getParameter("id");
		String name= request.getParameter("name");
		String tel= request.getParameter("tel");
		
		MemberDAO dao=MemberDAO.getInstance();
		
		// 아이디 / 핸드폰 맞으면 이메일로 임시번호 보내준다? 
		
		String _id = null;
		if(id != null) {
			_id = dao.memIdSearch(tel, name);
		}
		
		if(_id != null && _id.equals(id)) {
			PassConfirm passconfirm = new PassConfirm();
			String passnum = passconfirm.connectEmail(email);
			request.setAttribute("passnum", passnum);
			MemberVO vo=new MemberVO();
			 SHA256 s = new SHA256(passnum.getBytes());
				BASE64Encoder Base64Encoder = new BASE64Encoder();
			 passnum=Base64Encoder.encode(s.GetHashCode());
			vo.setPass(passnum);
			int row=dao.passEdit(vo);
			request.setAttribute("id", id);
			request.setAttribute("result", "");
			request.setAttribute("row", row);
			// 패스워드 변경 jsp 
			JSP_PAGE = "Contents/Member/pass_edit.jsp?row="+row;
		} else {
			// 아이디 없음.
			request.setAttribute("result", "아이디를 찾을 수 없습니다");

			// 패스워드 찾는 jsp
			JSP_PAGE = "Contents/Member/pass_search.jsp";
		}
		
		
		
		RequestDispatcher dispatcher =
                request.getRequestDispatcher(JSP_PAGE);
          dispatcher.forward(request, response);

	}

}