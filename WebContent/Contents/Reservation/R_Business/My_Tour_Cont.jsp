<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

<section>
	<h2>${ pvo.p_title }</h2>
	<p>${ pvo.p_contents }</p>
	<p>출발일 : ${ pvo.p_indate }</p>
	<p>도착일 : ${ pvo.p_outdate }</p>
	<p>출발지 : ${ pvo.p_in }</p>
	<p>도착지 : ${ pvo.p_out }</p>
	<p>예약인원 : ${ pvo.p_reservpeople }/정원 : ${ pvo.p_maxpeople }</p>
	<p>가격 : ${ pvo.p_price }</p>
	<p>테마 : ${ pvo.theme }</p>
	<p>등록일 : ${ pvo.p_regdate.substring(0,10) }</p>
	<form name="fm" method="post">
	<a href="javascript:modi()"><input type="button" value="수정"></a>
	<a href="javascript:dele()"><input type="button" value="삭제"></a>
	<input type="hidden" name="id" value="${ b_user.b_id }">
	<input type="hidden" name="idx" value="${ pvo.p_idx }">
	</form>
</section>


</body>

<style>
	section {margin-top:20%; color:white; text-align:center;}
	
</style>
<script type="text/javascript">
	function modi() {
		fm.action="ReservServlet?command=ProductModify&idx="+fm.idx.value;
		fm.submit();
	}
	function dele() {
		fm.action="ReservServlet?command=ProductDelete&idx="+fm.idx.value+"&id="+fm.id.value;
		fm.submit();
	}
</script>
</html>