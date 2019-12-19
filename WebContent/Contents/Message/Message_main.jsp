<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


<section>
	<ul>
		<li><a href="#">메세지 작성</a></li>
		<li><a href="##">보낸 메세지</a></li>
		
	</ul>

	<table>	
		<tr>
			<th><input type="checkbox" name="all_select" value="9"></th>
			<th>보낸 사람</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		<tr>
			<c:if test="${empty id}">
				<td colspan="4">메세지가 없습니다</td>		
			</c:if>
			<c:if test="${!empty id}">
				<td><input type="checkbox" name="select" value="1"></td>
				<td>${ b_id }</td>
				<td><a href="#">${ title }</a></td>
				<td>${ regdate }</td>
			</c:if>
		</tr>	
	</table>	
</section>
<style>
	section {margin-top:20%;}
	table, tr, td {border:1px solid white;}
	tr, td {font-size:20px; text-align:center;}
	table {margin-left:30%;}
	th {width:250px;}
	li {font-size:20px; margin-bottom:5%;}
	
	
</style>
</body>
</html>