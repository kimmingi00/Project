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

public class ReservMainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ProductDAO dao = ProductDAO.getInstance();
		
		List<ProductVO> mlist = dao.ProductWholeList();
		
	    String savePath = "/Contents/img/product_img";
		
		request.setAttribute("savePath", savePath);
		request.setAttribute("mlist", mlist);
		request.setAttribute("mlist2", mlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/Reserv_main.jsp");
		rd.forward(request, response);
	}

}
