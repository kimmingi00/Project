package service.reserv;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.reserv.ProductDAO;
import model.reserv.ProductVO;
import service.Action;

public class ReservModifyProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ProductDAO dao = ProductDAO.getInstance();
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		ProductVO pvo = dao.ProductView(p_idx);
		String id = request.getParameter("id");
		int reserv_cnt = Integer.parseInt(request.getParameter("reserv_cnt"));
		String p_customer = pvo.getP_customer();
		String cust[] = p_customer.split("[\\)]");
		System.out.println("reserv_cnt : "+reserv_cnt);
		int cnt=0;
		
		for(int i=0; i<cust.length; i++) {
			if(cust[i].contains(id)) {
				cnt=i;
				
			}
		}
		

		for(int i=0; i<cust.length; i++) {
			System.out.println(cust[i]);
		}
		
		
		System.out.println("cust[cnt] : "+cust[cnt]);
		String mer = p_customer.substring(p_customer.length()-2, p_customer.length()-1);
		String result = mer.replaceAll("[^0-9]","");
		
		int p_reservpeople = pvo.getP_reservpeople();
		p_reservpeople = p_reservpeople - Integer.parseInt(result)+reserv_cnt;
		
		for(int i = 0; i < cust.length; i++) {
			if(cust[i].contains(id)) {
				cust[i]=result;
				
			}
		}
		
		for(int i = 0; i < cust.length; i++) {
			cust[i]=cust[i]+")";
		}
		
		
		for(int i = 0; i < cust.length; i++) {
			if(!cust[i].equals(")")) {
				p_customer = cust[i];	
			}
		}
		
		 dao.reservPeopleUpdate(p_reservpeople, p_idx);
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("p_idx", p_idx);
		request.setAttribute("id", id);
		request.setAttribute("reserv_cnt", reserv_cnt);
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/Reserv_main.jsp");
		rd.forward(request, response);
	}

}
