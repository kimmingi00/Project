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

public class ProductModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int p_idx = Integer.parseInt(request.getParameter("idx"));
		
		ProductDAO dao = ProductDAO.getInstance();
		
		ProductVO pvo = dao.ProductView(p_idx);
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("p_idx", p_idx);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/R_Business/UploadService/Product_Modify.jsp");
		rd.forward(request, response);
	}

}
