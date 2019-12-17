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

public class ProductUploadAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String b_id = request.getParameter("b_id");
		
		ProductDAO dao = ProductDAO.getInstance();
		
		List<ProductVO> mlist = dao.MyTourList(b_id);
		
		request.setAttribute("mlist", mlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/R_Business/UploadService/Product_Upload.jsp");
		rd.forward(request, response);
	}

}
