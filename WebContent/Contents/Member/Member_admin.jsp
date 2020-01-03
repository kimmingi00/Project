<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp"%>
<style>
body {
	background-color: #f2f2f2;
}

#topMenu {
	position: relative;
	left: 620px;

	width: 850px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	float: left;
	display:inline;

	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: black;
	display: block;
	width: 100px;
	font-size: 14px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: white;
	background-color: #4d4d4d;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



<nav id="topMenu">

	<ul>
		<li><a class="menuLink" href="MemberServlet?command=member_list">&nbsp; 일반회원정보   &nbsp;</a></li>
		<li><a class="menuLink"	href="BusinessServlet?command=business_list">&nbsp; 사업자정보   &nbsp;</a></li>
		<li><a class="menuLink" href="MemberServlet?command=unregit_list">&nbsp; 비회원관리   &nbsp;</a></li>
		<li><a class="menuLink"	href="MemberServlet?command=member_admin_list">&nbsp; 관리자목록   &nbsp;</a></li>
		<li><a class="menuLink"	href="MemberServlet?command=member_admin_list">&nbsp; 상품정보   &nbsp;</a></li>
	</ul>

</nav>
<br><br><br><br><br><br><br><br>
<table class="table table-striped"
	style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">아이디</th>
			<th style="background-color: #eeeeee; text-align: center;">이름</th>
			<th style="background-color: #eeeeee; text-align: center;">이메일</th>
			<th style="background-color: #eeeeee; text-align: center;">전화번호</th>
			<th style="background-color: #eeeeee; text-align: center;">가입날짜</th>
			<th style="background-color: #eeeeee; text-align: center;">최근로그인</th>
		</tr>
	</thead>

	<c:if test="${! empty list }">
		<c:forEach var="list" items="${ list }">
			<tbody>
				<tr>
					<td>${ list.id }</td>
					<td>${ list.name }</td>
					<td>${ list.email }</td>
					<td>${ list.tel }</td>
					<td>${ list.regdate }</td>
					<td>${ list.lastdate }</td>
				</tr>
			</tbody>
		</c:forEach>
	</c:if>
</table>
<br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="/Contents/include_file(navi bar)/footer.jsp" %>
</body>

</html>