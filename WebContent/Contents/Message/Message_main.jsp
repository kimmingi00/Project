<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


<section>
	<ul class="msg_ul">
		<li><a href="/MessageServlet?command=MsgSend">메세지 작성</a></li>
		<li><a href="##">보낸 메세지</a></li>
		
	</ul>

	<table class="msg_table">	
		<tr>
			<th><input type="checkbox" name="all_select" value="9"></th>
			<th>보낸 사람</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		<tr>
			<c:if test="${empty mlist}">
				<td colspan="4">메세지가 없습니다</td>		
			</c:if>
		</tr>	
			<c:if test="${!empty mlist}">
				<c:forEach var="mlist" items="${ mlist }">
					
					<tr>
						<td><input type="checkbox" name="select" value="1"></td>
						<td>${ mlist.send_id }
						<c:if test="${mlist.b_id=='not' }">
						(사업자)
						</c:if>
						<c:if test="${mlist.id=='not' }">
						(개인)
						</c:if>
						</td>
						<td><a href="/MessageServlet?command=MsgView&m_idx=${ mlist.m_idx }">${ mlist.title }</a></td>
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
	section {margin-top:20%;}
	table, tr, td {border:1px solid white;}
	.msg_table {font-size:20px; text-align:center; margin-left:30%;}
	
	.msg_table th {width:250px;}
	.msg_ul {font-size:20px; margin-bottom:5%;}
	
	
</style>
</body>
</html>