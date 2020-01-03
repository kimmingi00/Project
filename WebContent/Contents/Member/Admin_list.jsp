<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<center>
	<h1> 관리자목록 </h1>
	
		<table border="2" width="700px">
			<tr>
			
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>가입날짜</th>
			<th>최근 로그인</th>
			</tr>
	<c:if test="${! empty list }">		
		<c:forEach var="list" items="${ list }">
	 <tr>
	 	
	 	<td>${ list.id }</td>
	 	<td><a href="/MemberServlet?command=admin_cs&id=${ list.id }">${ list.name }</a>
	 	</td>
	 	<td>${ list.email }</td>
	 	<td>${ list.tel }</td>
	 	<td>${ list.regdate }</td>
	 	<td>${ list.lastdate }</td>
	 	
	 </tr>			
		</c:forEach>
	</c:if>	
		</table>
		
	</center>

</body>
</html>