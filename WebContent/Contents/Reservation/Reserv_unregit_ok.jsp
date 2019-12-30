<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="controller.reserv.*" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


 


<div class="ok">
	<c:if test="${ row==0 }">
		<h2 style="font-size: 50px; margin-bottom: 50px;">임시 계정 등록이 실패하였습니다</h2>
		<p style="font-size: 20px; margin-bottom: 20px;">등록하신 이메일이 이미 임시 계정으로 등록되어있습니다</p>
		<p style="font-size: 20px; margin-bottom: 20px;">*하나의 이메일로는 하나의 상품밖에 예약하지 못하며, 다시 예약하시려면 상품의 출발 날짜로부터 2주가 지나야합니다</p>
		
	</c:if>
	<c:if test="${ row==3 }">
		<h2 style="font-size: 50px; margin-bottom: 50px;">예약이 실패하였습니다</h2>
		<p style="font-size: 20px; margin-bottom: 20px;">다시 시도해주세요</p>
	</c:if>
	<c:if test="${ row==4 }">
		<h2 style="font-size: 50px; margin-bottom: 50px;">예약이 성공하였습니다</h2>
		<p style="font-size: 20px; margin-bottom: 20px;">여기관광을 이용해주셔서 감사합니다</p>
	</c:if>	
	<p style="color:#0070c9; font-size: 23px;"><a href="/IndexServlet?command=index" >메인 페이지로 ></a></p>
</div>
<style>
	.ok {color:black; text-align:center; margin-top:20%;}
	
</style>
</body>
</html>