package service.reserv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.reserv.ProductDAO;
import model.reserv.ProductVO;
import service.Action;

public class ProductUploadProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		String b_id = request.getParameter("b_id");
		
		request.setAttribute("b_id", b_id);
		
		

		
		String path = "C:\\Users\\JSLHRD\\eclipse-workspace\\Web_Project\\Project\\WebContent\\Contents\\img\\product_img";
		String encType = "utf-8";
		
		int sizeLimit = 4*1024*1024; //최대 4MB
		
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, 
				encType, new DefaultFileRenamePolicy()); // 첨부파일 업로드
		
		int cnt = Integer.parseInt(multi.getParameter("cnt"));
		
		String p_title = multi.getParameter("p_title"); // 상품 이름
		String p_contents = multi.getParameter("p_contents"); // 상품 내용
		String p_indate = multi.getParameter("p_indate"); // 출발일
		String p_outdate = multi.getParameter("p_outdate"); // 종료일
		String p_in = multi.getParameter("p_in"); //출발지
		String p_intime = multi.getParameter("p_intime");
		String p_outtime = multi.getParameter("p_outtime");
		String p_spot = multi.getParameter("p_spot");
		String p_spottime = multi.getParameter("p_spottime");
		String p_stopover = multi.getParameter("p_stopover");
		String p_stoptime = multi.getParameter("p_stoptime");
		int place = Integer.parseInt(multi.getParameter("place"));
		int outplace = Integer.parseInt(multi.getParameter("outplace"));
		if(cnt!=0) {
			String[] in_array = new String[cnt-2];
			String[] time_array = new String[cnt-2];
			for(int i=0; i<cnt-2; i++) {
				in_array[i] = multi.getParameter("p_in"+(i+2));
				time_array[i] = multi.getParameter("p_intime"+(i+2));
				
			}
		
			for(int i=0; i<in_array.length; i++) {
				p_in = p_in+", "+in_array[i];
				p_intime = p_intime+", "+time_array[i];
			}
		}
		
		
		
		
		String p_out = multi.getParameter("p_out"); //목적지
		int p_maxpeople = Integer.parseInt(multi.getParameter("p_maxpeople")); //최대 인원
		int p_price = Integer.parseInt(multi.getParameter("p_price")); //가격
		String[] tema = multi.getParameterValues("thema"); //테마
		String p_filename = multi.getFilesystemName("p_filename"); //파일 이름
		int fcnt = Integer.parseInt(multi.getParameter("fcnt"));
		
		if(fcnt!=0) {
			String[] file_array = new String[fcnt];
			
			for(int i=0; i<fcnt; i++) {
				file_array[i]=multi.getFilesystemName("p_filename"+(i+1));
			}
			
			for(int i=0; i<file_array.length; i++) {
				p_filename = p_filename+", "+file_array[i];
			}
		}
		
		
		String theme="";
		if(tema!=null) {
			for(int i=0; i<tema.length; i++) {
				if(i==tema.length-1) {
					theme=theme+tema[i];
				}else theme=theme+tema[i]+",";
			}
		}
		
		
		ProductVO pvo = new ProductVO();
		
		pvo.setB_id(b_id); pvo.setP_title(p_title); pvo.setP_contents(p_contents);
		pvo.setP_indate(p_indate); pvo.setP_outdate(p_outdate); pvo.setP_in(p_in);
		pvo.setP_out(p_out); pvo.setP_maxpeople(p_maxpeople); pvo.setP_price(p_price);
		pvo.setTheme(theme); pvo.setP_filename(p_filename); 
		
		pvo.setP_intime(p_intime); pvo.setP_outtime(p_outtime); pvo.setP_spot(p_spot);
		pvo.setP_spottime(p_spottime); pvo.setP_stopover(p_stopover); pvo.setP_stoptime(p_stoptime);
		pvo.setPlace(place); pvo.setOutplace(outplace);
		
		
		ProductDAO dao = ProductDAO.getInstance();
		
		int row = 0;
		
		row = dao.productUpload(pvo);
		
	
		
		request.setAttribute("row", row);
		
				
		RequestDispatcher rd = request.getRequestDispatcher("/Contents/Reservation/R_Business/upload_ok.jsp");
		rd.forward(request, response);
	}

}
