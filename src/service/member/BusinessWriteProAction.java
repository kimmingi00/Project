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

public class BusinessWriteProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BusinessDAO dao=BusinessDAO.getInstance();
		
	
		
		String b_tel=request.getParameter("b_tel");
		String b_name =request.getParameter("b_name");
		String b_email =request.getParameter("b_email");
		String b_pass =request.getParameter("b_pass");
		String b_id=request.getParameter("b_id");
		String b_number=request.getParameter("b_number");
		int b_rating=0;
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
		SHA256 s = new SHA256(b_pass.getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		BusinessVO vo=new BusinessVO();
			vo.setB_email(b_email);
			vo.setB_id(b_id);
			vo.setB_name(b_name);
			vo.setB_number(b_number);
			vo.setB_pass(Base64Encoder.encode(s.GetHashCode()));
			vo.setB_rating(b_rating);
			vo.setB_tel(b_tel);
			
			int row=dao.BusinessWrite(vo);
			request.setAttribute("row", row);
			
			RequestDispatcher rd = null;
			
			if(row==1) {
				rd=request.getRequestDispatcher("Contents/Member/complete.jsp");
			}else {
				rd=request.getRequestDispatcher("/MemberServlet?command=member_login");
			}
			
			rd.forward(request, response);
	}
	}

