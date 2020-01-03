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
import util.PassConfirm;

public class BusinessPassSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String JSP_PAGE = "";
		
		String b_email = request.getParameter("email");
		String b_id    = request.getParameter("id");
		String b_name  = request.getParameter("name");
		String b_tel   = request.getParameter("tel");
		
		BusinessDAO dao=BusinessDAO.getInstance();
		
		// 아이디 / 핸드폰 맞으면 이메일로 임시번호 보내준다? 
		
		String _id = null;
		if(b_id != null) {
			_id = dao.BusinessIdSearch(b_tel, b_name);
		}
		
		if(_id != null && _id.equals(b_id)) {
			PassConfirm passconfirm = new PassConfirm();
			String passnum = passconfirm.connectEmail(b_email);
			request.setAttribute("passnum", passnum);
			BusinessVO vo=new BusinessVO();
			 SHA256 s = new SHA256(passnum.getBytes());
				BASE64Encoder Base64Encoder = new BASE64Encoder();
			 passnum=Base64Encoder.encode(s.GetHashCode());
			vo.setB_pass(passnum);
			int row=dao.passEdit(vo);
			request.setAttribute("id", b_id);
			request.setAttribute("result", "");
			request.setAttribute("row", row);
			// 패스워드 변경 jsp 
			JSP_PAGE = "Contents/Member/b_pass_edit.jsp?row="+row;
		} else {
			// 아이디 없음.
			request.setAttribute("result", "아이디를 찾을 수 없습니다");

			// 패스워드 찾는 jsp
			JSP_PAGE = "Contents/Member/b_pass_search.jsp";
		}
		
		
		
		RequestDispatcher dispatcher =
                request.getRequestDispatcher(JSP_PAGE);
          dispatcher.forward(request, response);

	}

}