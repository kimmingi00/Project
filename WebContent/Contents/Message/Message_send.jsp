<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


<section>
	<form name="msg" method="post" action="/MessageServlet?command=MsgSendPro" >
	<table class="msg_table">	
		<tr>
			<td>
			메세지 제목
			<input type="text" name="title" value="">
			</td>
		</tr>
		<tr>
			<td>
			받는 사람
			<select name="receive_user">
				<option value="1">개인</option>
				<option value="2">사업자</option>
			</select>
			<input type="text" name="receive_id" value="">
			</td>
		</tr>
		<tr>
			<td>
			메세지 내용	
			<textarea name="contents">
			</textarea>
			</td>
		</tr>
		<tr>
			<c:if test="${!empty user }">
				<input type="hidden" name="send_id" value="${ user.id }">
				<input type="hidden" name="send_user" value="user">
			</c:if>
			<c:if test="${!empty b_user }">
				<input type="hidden" name="send_id" value="${ b_user.b_id }">
				<input type="hidden" name="send_user" value="business">
			</c:if>
			<td>
			<a href="javascript:send()"><input type="button" value="보내기"></a>
			</td>
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
	function send() {
		if(msg.title.value=="") {
			alert("메세지 제목을 입력해주세요");
			msg.title.focus();
			return
		}else if(msg.receive_id.value=="") {
			alert("받는 사람을 입력해주세요");
			msg.receive_id.focus();
			return
		}
		
		msg.submit();
	}
</script>
</body>
</html>