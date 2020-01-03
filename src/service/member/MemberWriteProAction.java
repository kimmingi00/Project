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

public class MemberWriteProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDAO dao=MemberDAO.getInstance();
		
		
	String enctype="utf-8";
		
		String tel=request.getParameter("tel");
		String name =request.getParameter("name");
		String email =request.getParameter("email");
		String pass =request.getParameter("pass");
		String id=request.getParameter("id");
		String theme1[] = request.getParameterValues("them");
		String them=null;
		if (theme1 == null)
			them = null;
		else {
			them = theme1[0];
			if (theme1.length > 1) {
				for (int i = 1; i < theme1.length; i++) {
					them = them + "," + theme1[i];
				}
			}
		}
		String reserv_num=request.getParameter("reserv_num");
		String str1[] = request.getParameterValues("fa");
		String fa=null;
		if (str1 == null)
			fa = null;
		else {
			fa = str1[0];
			if (str1.length > 1) {
				for (int i = 1; i < str1.length; i++) {
					fa = fa + "," + str1[i];
				}
			}
		}
		SHA256 s = new SHA256(pass.getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		MemberVO vo=new MemberVO();
			vo.setEmail(email);
			vo.setTel(tel);
			vo.setName(name);
			vo.setPass(Base64Encoder.encode(s.GetHashCode()));
			vo.setId(id);
			vo.setTheme(them);
			vo.setFavorite(fa);
		
			
			
			int row=dao.MemberWrite(vo);
			request.setAttribute("vo", vo);
			request.setAttribute("row", row);
			request.setAttribute("id", id);
			
			RequestDispatcher rd = null;
			
			if(row==1) {
				rd=request.getRequestDispatcher("Contents/Member/complete.jsp");
			}else {
				rd=request.getRequestDispatcher("/MemberServlet?command=member_login");
			}
			rd.forward(request, response);
	}
	}

