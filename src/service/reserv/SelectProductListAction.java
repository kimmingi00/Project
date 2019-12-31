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

public class SelectProductListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int row = Integer.parseInt(request.getParameter("row"));
		int place =0; 
		int outplace = 0;
		
		String table = "";
		
		if(row == 1) {
			place = Integer.parseInt(request.getParameter("place"));
			table="(select * from product where place = "+place+")";
		}else if(row==-1){
			outplace = Integer.parseInt(request.getParameter("outplace"));
			table="(select * from product where outplace = "+outplace+")";
		}else {
			table = "product";
		}
		
		ProductDAO dao = ProductDAO.getInstance();
		
		List<ProductVO> mlist = dao.SelectProductList(table, place);
		
		
	    String savePath = "/Contents/img/product_img";
		
		request.setAttribute("savePath", savePath);
		request.setAttribute("mlist", mlist);
		request.setAttribute("mlist2", mlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/R_Business/My_TourList.jsp");
		rd.forward(request, response);
	}

}
