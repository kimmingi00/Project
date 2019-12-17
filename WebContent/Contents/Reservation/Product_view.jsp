<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

<section>
	<div class="list_cont">
		<ul>
			<li>
				<p>{pvo.p_title}</p>
			</li>
			<li>
				<img src="" alt="">
			</li>
			<li>
				출발일 &nbsp;${pvo.p_in.substring(0,10)}/종료일&nbsp;${pvo.p_out.substring(0,10)}
			</li>
		<c:if test="${pvo.p_maxpeople-pvo.p_reservpeople==0}">	
			<li>매진되었습니다</li>
		</c:if>
		<c:if test="${pvo.p_maxpeople-pvo.p_reservpeople>0}">	
			<li>
				예약인원&nbsp;${pvo.p_reservpeople}명/${pvo.p_maxpeople}명<br>
				지금 바로 예약하세요!&nbsp;<a href="#"><button>예약</button></a>
			</li>
		</c:if>	
			<li>
				등록일&nbsp;${pvo.p_regdate.substring(0,10)}
			</li>
		</ul>
	</div>		
	
</section>


</body>

<style>
	section {margin-top:20%; color:white; text-align:center;}
</style>

</html>