package service.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.NoticeBoardDAO;
import model.board.NoticeBoardVO;
import service.Action;
import util.PageIndex;

public class BoardNoticeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
		String url = "BoardServlet?command=board_notice";
		String s_query = "",addtag="",query="",key="";
		
		int totcount=0;
		if(request.getParameter("key") != null && 
				!request.getParameter("key").equals("")) {
			query = request.getParameter("search");
			key = request.getParameter("key");
			s_query = query + " like '%" + key + "%'";
			addtag = "&search="+query+"&key="+key; 
			
			totcount = dao.boardCount(s_query); 
		}else {
			totcount = dao.boardCount(); 
		}
		int nowpage = 1; 
		int maxlist = 10; 
		int totpage = 1; 
		
		if(totcount % maxlist == 0) {
			totpage = totcount/maxlist;

		}else {
			totpage = totcount/maxlist + 1;
		}
		
		
		if(request.getParameter("page") != null && 
				!request.getParameter("page").equals("")){
					nowpage = Integer.parseInt(request.getParameter("page"));
				}
		if(nowpage > totpage)
			nowpage = totpage;
		
		int pagestart = (nowpage-1) * maxlist +1;
		int endpage = nowpage * maxlist;
		int listcount = totcount - ((nowpage-1)*maxlist);
		
		List<NoticeBoardVO> list = null;
		if(!s_query.equals("")) {
			list = dao.boardList(s_query, pagestart, endpage);
		}else {
			list = dao.boardList(pagestart,endpage);
		}
		String pageSkip = PageIndex.pageList(nowpage, totpage, url, addtag);
		
		request.setAttribute("totcount", totcount);
		request.setAttribute("listcount", listcount);
		request.setAttribute("list", list);
		request.setAttribute("pageSkip", pageSkip);
		request.setAttribute("addtag", addtag);
		request.setAttribute("nowpage", nowpage);
		request.setAttribute("totpage", totpage);
		request.setAttribute("query", query);
		request.setAttribute("key", key);
		
		
		RequestDispatcher dispatcher =request.getRequestDispatcher("/Contents/Board/Notice/notice.jsp");
		dispatcher.forward(request, response);
	}

}
