<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

	
	<section >
		<div class="ok_div">		
			<c:if test="${ row == 0 }">	
				<p class="title">등록에 실패하였습니다</p>
			</c:if>
			<c:if test="${ row == 1 }">
				<p class="title">감사합니다</p>
				<p class="title">상품이 등록되었습니다</p>
			</c:if>	
				<a href="/ReservServlet?command=ProductUpload&b_id=${ b_user.b_id }"><button class="btn">&nbsp;  다른 상품 등록 >>  &nbsp;</button></a><br>
				<a href="/ReservServlet?command=MyTourList&b_id=${ b_user.b_id }"><button class="btn">&nbsp;  나의 관광 상품 >>  &nbsp;</button></a>
		</div>		
	</section>
	
<style>
	
	section {margin-top:10%; color:black; text-align:center; margin-bottom: 230px;}
	p {margin-bottom:50px;}
	.title {font-size: 30px; font-weight:bold;}
	.btn {
			margin-bottom:20px; background-color:#07c; color:white; 
		border-color: #07c;
    	border-width: 1px;
    	border-style: solid;
    	font-size: 17px;
    	font-weight: 400;
    	text-align: center;
    	white-space: nowrap;
    	line-height: 1.17648;
	    min-width: 28px;
	    padding-left: 16px;
	    padding-right: 16px;
	    padding-top: 8px;
	    padding-bottom: 8px;
	    border-radius: 18px;
	    background: #0071e3;
}
	
	
</style>

<%@ include file="/Contents/include_file(navi bar)/footer.jsp" %>

</body>



</html>