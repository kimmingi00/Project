<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<section>
		<c:if test="${ row == 0}">
			<p class="title">등록에 실패하였습니다</p>
		</c:if>
		<c:if test="${ row == 1}">
			<p class="title">감사합니다</p>
			<p class="title">상품이 등록되었습니다</p>
		</c:if>
		<a href=""><button class="btn">&nbsp;  다른 상품 등록 >>  &nbsp;</button></a><br>
		<a href="/ReservServlet?command=MyTourList&b_id=${ user.b_id }"><button class="btn">&nbsp;  나의 관광 상품 >>  &nbsp;</button></a>
	</section>

</body>
<style>
	
	section {margin-top:20%; color:white; text-align:center;}
	p {margin-bottom:20px;}
	.title {font-size: 30px; font-weight:bold;}
	.btn {margin-bottom:20px; background-color:black; color:white; font-size:25px;}
	
	
</style>

</html>