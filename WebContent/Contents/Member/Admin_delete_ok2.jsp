<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${ row==1 }">
		<center>
	<h2> 삭제된 이름: ${ ur_name } </h2>
	
	<h2> 삭제된 번호:  ${ ur_tel } </h2>
			</center>
	</c:if>
		
		<c:if test="${ row==0 }">
		<center>
		<h2>예약이 되어있는 고객입니다 .</h2>
		<a href="/MemberServlet?command=member_list">돌아가기</a>
		</center>
		</c:if>
	
</body>
</html>