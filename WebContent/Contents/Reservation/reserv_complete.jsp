<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

	
	<section>
		
	<c:if test="${ row == 0 }">	
		<p class="title">예약에 실패하였습니다</p>
		<a href="/IndexServlet?command=index"><input type="button" name="main" value="메인으로 >" class="button" style="margin-top: 50px;"></a>
	</c:if>
	<c:if test="${ row == 1 }">
		<p class="title">감사합니다</p>
		<p class="title">상품이 예약되었습니다</p>
		<a href="/IndexServlet?command=index"><input type="button" name="main" value="메인으로 >" class="button" style="margin-top: 50px;"></a>
	</c:if>	
		
	</section>

</body>
<style>
	
	section {margin-top:20%; color:black; text-align:center;}
	p {margin-bottom:20px;}
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
	.button {
	cursor: pointer; display: inline-block; text-align: center; font-size: 25px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;
    margin-top: 40px;
    }
	
</style>

</html>