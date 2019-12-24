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

public class ProductDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String id = request.getParameter("id");
		
		int p_idx = Integer.parseInt(request.getParameter("idx"));
		
		ProductDAO dao = ProductDAO.getInstance();
		
		dao.productDelete(p_idx);
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/ReservServlet?command=MyTourList&b_id="+id);
		rd.forward(request, response);
	}

}
