<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


<section>
	
	<c:if test="${row==1}">
		<h2>메세지 전송에 성공하였습니다</h2>
	</c:if>
	<c:if test="${row==0}">
		<h2>메세지 전송에 실패하였습니다</h2>
	</c:if>
	
</section>
<style>
	section {margin-top:20%;}
	table, tr, td {border:1px solid white;}
	.msg_table {font-size:20px; text-align:center; margin-left:30%;}
	
	.msg_table th {width:250px;}
	.msg_ul {font-size:20px; margin-bottom:5%;}
	h2 {text-align:center;}
	
	
</style>
</body>
</html>