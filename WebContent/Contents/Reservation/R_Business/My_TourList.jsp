<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

<section>
	
	<c:if test="${empty mlist}">
		<p style="font-size:40px;">등록된 상품이 없습니다</p>
	
	</c:if>
	<c:if test="${!empty mlist}">
		<c:forEach var="mlist" items="${ mlist }">
			<div class="list_cont">
				<ul>
					<li>
						<a href="/Contents/Reservation/R_Business/My_TourCont.jsp?p_idx=${mlist.p_idx}">{mlist.p_title}</a>
					</li>
					<li>
						<img src="" alt="">
					</li>
					<li>
						출발일 &nbsp;${mlist.p_in.substring(0,10)}/종료일&nbsp;${mlist.p_out.substring(0,10)}
					</li>
					<li>
						예약인원&nbsp;${mlist.p_reservpeople}명/${mlist.p_maxpeople}명
					</li>
					<li>
						등록일&nbsp;${mlist.p_regdate.substring(0,10)}
					</li>
				</ul>
			</div>		
		</c:forEach>		
	</c:if>
	
</section>


</body>

<style>
	section {margin-top:20%; color:white; text-align:center;}
</style>

</html>