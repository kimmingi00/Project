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
		
		String row = request.getParameter("row");
		String table = "";
		ProductDAO dao = ProductDAO.getInstance();
		int place =0; 
		int outplace = 0;
		List<ProductVO> mlist = null;
		
		place = Integer.parseInt(request.getParameter("place"));
		outplace = Integer.parseInt(request.getParameter("outplace"));
		
		
		
		
		if(place==0&&outplace==0) {
			mlist = dao.ProductWholeList();
		}else if(place!=0&&outplace!=0){
				
			table="(select * from product where place = "+place+")";
			mlist = dao.SelectProductList(table, outplace);
				
				
			}else {
				if(row.equals("1")) {				
					
					table = "product";
					
					mlist = dao.SelectProductList2(table, place);
				}else if(row.equals("-1")){
					
					
					table = "product";
					
					
					mlist = dao.SelectProductList(table, outplace);
				}else {
					table = "product";
				}
			}
			
			
			
			
			
		
		
		
		String p_button="";
		String op_button="";
		
		switch(place) {
		
		case 1:
			p_button="서울/경기/인천";
			break;
		case 2:
			p_button="강원도";
			break;
		case 3:
			p_button="대전/충청남도/충청북도";
			break;
		case 4:
			p_button="광주/전라남도/전라북도";
			break;
		case 5:
			p_button="부산/대구/경상남도/경상북도";
			break;	
		}
		
		switch(outplace) {
		
		case 1:
			op_button="서울/경기/인천";
			break;
		case 2:
			op_button="강원도";
			break;
		case 3:
			op_button="대전/충청남도/충청북도";
			break;
		case 4:
			op_button="광주/전라남도/전라북도";
			break;
		case 5:
			op_button="부산/대구/경상남도/경상북도";
			break;	
		}
		
		
		
		
	    String savePath = "/Contents/img/product_img";
		
	    request.setAttribute("p_button", p_button);
	    request.setAttribute("op_button", op_button);
	    request.setAttribute("place", place);
		request.setAttribute("outplace", outplace);
	    request.setAttribute("row", row);
		request.setAttribute("savePath", savePath);
		request.setAttribute("mlist", mlist);
		request.setAttribute("mlist2", mlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/Reserv_main.jsp");
		rd.forward(request, response);
	}

}
