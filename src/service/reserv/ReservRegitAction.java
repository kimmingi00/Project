package service.reserv;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.reserv.ProductDAO;
import service.Action;

public class ReservRegitAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		int reserv_cnt = Integer.parseInt(request.getParameter("reserv_cnt"));
		String id = request.getParameter("id");
	
		ProductDAO dao = ProductDAO.getInstance();
		
		
		String p_customer = id+"("+reserv_cnt+")";
			
		
		int row = dao.reservProduct(p_idx, p_customer, reserv_cnt);
		if(row==1) {
			dao.memReservNumAdd(request.getParameter("p_idx"), id);
		}
		
		request.setAttribute("row", row);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/reserv_complete.jsp");
		rd.forward(request, response);
	}

}
