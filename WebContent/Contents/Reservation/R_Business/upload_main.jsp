<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="controller.reserv.*" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

	
	<section>
	<c:if test="${ empty b_user }">
		<div class="no_b_id">
			<h2 style="margin-bottom: 45px;">죄송합니다</h2>
			<p>이 메뉴는 사업자 분들을 위한 메뉴입니다</p>
			<p>일반 사용자 분들은 다른 메뉴를 이용해주세요</p>
			<a href="/IndexServlet?command=index"><input type="button" name="main" value="메인으로 >" class="button" style="margin-top: 50px;"></a>
		</div>	
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
	
	section {margin-top:12%; color:black; text-align:center; margin-left:24%; background-color:white; 
				width:1000px; height:500px;
				
				}
	p {margin-bottom:20px;}
	.title {font-size: 30px; font-weight:bold;}
	.btn {margin-bottom:20px; background-color:white; color:black; font-size:25px;}
	.no_b_id {font-size:30px; padding-top:110px;
				
	}
	.button {
	cursor: pointer; display: inline-block; text-align: center; font-size: 25px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}
</style>


</html>