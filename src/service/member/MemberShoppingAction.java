package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberVO;
import model.reserv.ProductDAO;
import model.reserv.ProductVO;
import service.Action;

public class MemberShoppingAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDAO dao= MemberDAO.getInstance();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		ProductDAO pdao=ProductDAO.getInstance();
		ProductVO pvo=new ProductVO();
		String p_customer="";
		int row=0;
		List<ProductVO>plist=pdao.ProductWholeList();
		for(int i=0;i<plist.size();i++) {
			System.out.println("리스트 확인 : "+plist.get(i).getP_customer()); 
			if(plist.get(i).getP_customer()!=null) {
				if(user.getId().contains(plist.get(i).getP_customer())){
					p_customer=plist.get(i).getP_customer();
				}
			}
			
			System.out.println(user.getId()+"id");
	        System.out.println(p_customer+"pc");
		}
		pvo=pdao.Cust(p_customer);
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("row", row);
		
	RequestDispatcher rd=
			request.getRequestDispatcher("Contents/Member/Member_slist.jsp");
	rd.forward(request, response);


}
}