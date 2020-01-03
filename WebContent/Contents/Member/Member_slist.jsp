<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<style>
	.container {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top:180px; width:60%; height: 530px; border: 24px solid #ffffff;
      background-color: #FFFFFF; overflow: auto;margin-left: 20%;}

       .alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";
    }
	</style>
	
	

	<h1> 예매목록 </h1>
	<c:set var="pvo" value="${ pvo }"></c:set>
	<c:if test="${ empty pvo.p_title }">
	
	<h1>예약하신 상품이 없습니다.</h1>
	
	</c:if>
	
	
	<c:if test="${ !empty pvo.p_title }">
	
	<div class="container" style="margin-bottom:300px;">
		<div class="alert">
<font size="6"> 예매목록 <br></font>
<br><hr>
		<table width="700px" style="text-align:center;">
			<tr>
			<th><font size="4">예매한 상품</font></th>
			<c:set var="pvo" value="${ pvo }"></c:set>

	 		<td><font size="4"><a href="">${ pvo.p_title }</a></font></td>
			
			
			</tr>

		</table>
		</div>
		</div>
		</c:if>

	
</body>
<%@ include file="/Contents/include_file(navi bar)/footer.jsp"%>
</html>