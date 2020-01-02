package service.reserv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KISA.SHA256;
import model.member.UnRegitDAO;
import model.member.UnRegitVO;
import model.reserv.ProductDAO;
import service.Action;
import sun.misc.BASE64Encoder;

public class ReservUnregitProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		int reserv_cnt = Integer.parseInt(request.getParameter("reserv_cnt"));
		String ur_email = request.getParameter("email");
		String ur_name = request.getParameter("ur_name");
		String ur_tel = request.getParameter("ur_tel");
		String ur_pass = request.getParameter("ur_pass");
		
		
		UnRegitVO rvo = new UnRegitVO();
		
		rvo.setUr_email(ur_email);
		rvo.setUr_name(ur_name);
		
		SHA256 s = new SHA256(ur_pass.getBytes());
		BASE64Encoder Base64Encoder = new BASE64Encoder();
		
		rvo.setUr_pass(Base64Encoder.encode(s.GetHashCode()));
		
		rvo.setUr_tel(ur_tel);
		
		UnRegitDAO udao = UnRegitDAO.getInstance();
		int row = udao.insertUnRegit(rvo);
		
		if(row==1) {
			ProductDAO dao = ProductDAO.getInstance();
			
			
			String p_customer = ur_email+"("+reserv_cnt+")";
				
			
			row = dao.reservProduct(p_idx, p_customer, reserv_cnt);
			
			
			if(row!=0) {
				row=  4;  
			}else {
				row = 3;
				udao.deleteUnRegit(rvo);
			}
			
		}
		request.setAttribute("row", row);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/Reserv_unregit_ok.jsp");
		rd.forward(request, response);
	}

}
