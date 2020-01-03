package service.reserv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.reserv.ProductDAO;
import model.reserv.ProductVO;
import service.Action;

public class ReservViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("p_idx"));
		String id = request.getParameter("id");		
		ProductDAO dao = ProductDAO.getInstance();
		dao.plusReadcnt(idx);
		ProductVO vo = dao.ProductView(idx);
		String savePath = "/Contents/img/product_img";
		String place[] = vo.getP_in().split(","); 
		String time[] = vo.getP_intime().split(",");
		String plus[] = new String[place.length + time.length]; 
		System.arraycopy(place, 0, plus, 0, place.length);
		System.arraycopy(time, 0, plus, place.length, time.length);
		
		String idd[] = null;
		
		if(vo.getP_customer() != null) {
			idd = vo.getP_customer().split("[\\(]");
		}
		
		int cnt = 0;
		int row = dao.customerSearch(id, idx);
		
		if(id.equals("")) {
			cnt = 1;
			request.setAttribute("cnt", cnt);
		}
		
			String contents = vo.getP_contents();
			
			StringBuffer buf = new StringBuffer();
			
			for(int i=0; i<contents.length(); i++) {
				if(contents.charAt(i)=='\n') {
					buf.append("<br>");
				}else {
					buf.append(contents.charAt(i));
				}
			}
			
		contents = buf.toString();
		
		request.setAttribute("contents", contents);
		request.setAttribute("row", row);
		request.setAttribute("savePath", savePath);
		request.setAttribute("pvo", vo);
		request.setAttribute("time", time);
		request.setAttribute("place", place);
		request.setAttribute("idd", idd);
		request.setAttribute("plus", plus);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/Reserv_view.jsp");
		rd.forward(request, response);
	}

}
