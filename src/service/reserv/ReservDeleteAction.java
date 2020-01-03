package service.reserv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.reserv.ProductDAO;
import model.reserv.ProductVO;
import service.Action;

public class ReservDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ProductDAO dao = ProductDAO.getInstance();
		int p_idx = Integer.parseInt(request.getParameter("idx"));
		ProductVO vo = dao.ProductView(p_idx);
		String id = request.getParameter("id");
		String p_customer = vo.getP_customer();
		String cust[] = p_customer.split("[\\)]");
		
		int cnt=0;
		
		for(int i=0; i<cust.length; i++) {
			if(cust[i].contains(id)) {
				cnt=i;
				
			}
		}
		
		int reserv_cnt = Integer.parseInt(request.getParameter("reserv_cnt"));
		String result = cust[cnt].replaceAll("[^0-9]","");
				
				
		
		int p_reservpeople = vo.getP_reservpeople();
		p_reservpeople = p_reservpeople - Integer.parseInt(result);
				
		
		
		
		


		
		for(int i = 0; i < cust.length; i++) {
			if(cust[i].contains(id)) {
				cust[i]="";
				
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
		
		 dao.reservUpdate(p_customer, p_idx);
		 dao.reservPeopleUpdate(p_reservpeople, p_idx);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/Reserv_main.jsp");
		rd.forward(request, response);
	}

}
