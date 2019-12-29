<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="controller.reserv.*" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

	
	<section>
	<c:if test="${ empty b_user }">
		<h2>사업자 전용 메뉴입니다</h2>
	</c:if>
	<c:if test="${ !empty b_user }">
		<p class="title">지금 바로 여기관광의 서비스를 이용해보세요</p>
		<p>여기관광은 사업자 여러분들의 더 나은 수익과 편의성을 위해 다양한 서비스를 제공하고 있습니다</p>
		<a href="/ReservServlet?command=ProductUpload&b_id=${ b_user.b_id }"><button class="btn">&nbsp;  관광 상품 등록 >>  &nbsp;</button></a><br>
		<a href="/ReservServlet?command=MyTourList&b_id=${ b_user.b_id }"><button class="btn">&nbsp;  나의 관광 상품 >>  &nbsp;</button></a>
	</c:if>
	</section>

</body>
<style>
	
	section {margin-top:20%; color:black; text-align:center;}
	p {margin-bottom:20px;}
	.title {font-size: 30px; font-weight:bold;}
	.btn {margin-bottom:20px; background-color:white; color:black; font-size:25px;}
	
	
</style>


</html>