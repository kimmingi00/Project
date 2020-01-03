package service.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberVO;
import service.Action;

public class MemberThemeProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = MemberDAO.getInstance();
		String id = request.getParameter("id");
		System.out.println(id+"ddd");
		MemberVO vo = new MemberVO();
		
		vo.setId(id);
		System.out.println(vo.getId()+" : id");
		
		String them1[] = request.getParameterValues("theme");

		String theme = null;
		if (them1 == null)
			theme = null;
		else {
			theme = them1[0];
			if (them1.length > 1) {
				for (int i = 1; i < them1.length; i++) {
					theme = theme + "," + them1[i];
				

				}
			}
	

		}
		String str1[] = request.getParameterValues("favorite");
		String favorite = null;
		if (str1 == null)
			favorite = null;
		else {
			favorite = str1[0];
			if (str1.length > 1) {
				for (int i = 1; i < str1.length; i++) {
					favorite = favorite + "," + str1[i];
					favorite.split(",");
				}
			}

		}
		System.out.println(favorite+" : favorite");
		System.out.println(theme+" : theme");
		System.out.println(vo.getId()+" : id");
		
		vo.setTheme(theme);
		vo.setFavorite(favorite);
		int row = dao.modifytheme(vo);
		request.setAttribute("row", row);

		System.out.println("row : "+row);

		RequestDispatcher rd = null;

		if (row == 1) {

			rd = request.getRequestDispatcher("Contents/Member/complete.jsp");
		} else {
			rd = request.getRequestDispatcher("MemberServlet?command=member_login");
		}
		rd.forward(request, response);

	}
}