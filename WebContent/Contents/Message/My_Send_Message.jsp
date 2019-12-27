<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section>
	<ul class="msg_ul">
		<li><a href="/MessageServlet?command=MsgSend">메세지 작성</a></li>
		<c:if test="${ !empty user }">
			<li><a href="/MessageServlet?command=MsgSendList&id=${ user.id }">보낸 메세지</a></li>
		</c:if>
		<c:if test="${ !empty b_user }">	
			<li><a href="/MessageServlet?command=MsgSendList&id=${ b_user.b_id }">보낸 메세지</a></li>
		</c:if>
		
	</ul>
	<c:if test="${ !empty user }">
					<h2 style="text-align:center;">${ user.name }님의 보낸쪽지함입니다.</h2> 
				</c:if>
				<c:if test="${ !empty b_user }">
					<h2 style="text-align:center;">${ b_user.b_name }님의 보낸쪽지함입니다.</h2>
				</c:if>

	<table class="msg_table">	
		<tr>
			<th><input type="checkbox" name="all_select" value="9"></th>
			<th>받는 사람</th>
			<th>제목</th>
			<th>등록일</th>
			<th>열람 여부</th>
		</tr>
		<tr>
			<c:if test="${empty mlist}">
				<td colspan="5">메세지가 없습니다</td>		
			</c:if>
		</tr>	
			<c:if test="${!empty mlist}">
				<p style="margin-left: 73%; margin-bottom: 10px;">현재 총 ${fn:length(mlist) }개의 메세지가 있습니다</p>
				<c:forEach var="mlist" items="${ mlist }">
					
					<tr>
						<td><input type="checkbox" name="select" value="1"></td>
						<td>${ mlist.receive_id }
						</td>
						<td><a href="/MessageServlet?command=MsgSendView&m_idx=${ mlist.m_idx }">${ mlist.title }</a></td>
						<td>${ mlist.regdate }</td>
						<td>
							<c:if test="${ mlist.readcnt==0 }">
							읽지 않음
							</c:if>
							<c:if test="${ mlist.readcnt!=0 }">
							읽음
							</c:if>
						</td>
					</tr>	
				</c:forEach>
			</c:if>
		</tr>	
	</table>	
</section>
<style>
	section {margin-top:15%;}
	table, tr, td {border:1px solid white;}
	.msg_table {font-size:20px; text-align:center; margin-left:17%;}
	
	.msg_table th {width:250px;}
	.msg_ul {font-size:20px; margin-bottom:5%; margin-left:10%;}
	a {color:white;}
	
	
</style>
</body>
</html>