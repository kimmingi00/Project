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

public class ReservOKAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		int reserv_cnt = Integer.parseInt(request.getParameter("reserv_cnt"));
		
		
		
		
		request.setAttribute("p_idx", p_idx);
		request.setAttribute("reserv_cnt", reserv_cnt);
		
		
	
		
		RequestDispatcher rd = request.getRequestDispatcher("/ReservServlet?command=reserv_ok");
		rd.forward(request, response);
	}

}
