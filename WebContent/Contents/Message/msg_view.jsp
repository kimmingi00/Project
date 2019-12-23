<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


<section>
	<form name="msg" method="post" action="/MessageServlet?command=MsgSendPro" >
	<table class="msg_table">	
		<tr>
			<th>메세지 제목</th>
			<td>${ mvo.title }</td>
		</tr>
		<tr>
			<th>보낸 사람</th>
			<td>${ mvo.send_id }</td>
		</tr>
		<tr>
			<th>메세지 내용</th>
			<td>	
			<textarea>${ mvo.contents }</textarea>
			</td>
		</tr>
		<tr>
			<th>전송일</th>
			<td>${ mvo.regdate }</td>
		</tr>
	</table>
	</form>	
</section>
<style>
	section {margin-top:20%;}
	table, tr, td {border:1px solid white;}
	.msg_table {font-size:20px; text-align:center; margin-left:30%;}
	
	.msg_table th {width:250px;}
	.msg_ul {font-size:20px; margin-bottom:5%;}
	
	
</style>
<script>
	
</script>
</body>
</html>