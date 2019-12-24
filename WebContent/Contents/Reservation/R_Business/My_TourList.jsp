<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 





<section>
	<div class = "product_table">
		
        <table align="center">
        <c:if test="${empty mlist}">
			<p style="font-size:40px;">등록된 상품이 없습니다</p>
		</c:if>
		<c:if test="${!empty mlist}">
		<c:set var="cnt" value="0"></c:set>
		<tr>
		<c:forEach var="mlist" items="${ mlist }" varStatus="stat">
          
            <td>
              <section class="hoverEffect">
              	<img style="border: 8px solid #000000; border-radius: 48px; -moz-border-radius: 48px; -khtml-border-radius: 48px; -webkit-border-radius: 48px; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "ReservServlet?command=ProductView&p_idx=${ mlist.p_idx }">
              	<div class="txt"><h3>${ mlist.p_title }</h3>예약인원수 ${ mlist.p_reservpeople }/${ mlist.p_maxpeople }<br>가격 ${ mlist.p_price }원<br>★★★★★</div>
                </a>
              </section>
            </td>
            <c:if test="${ stat.count%4==0||stat.count/4==0 }">`
            	</tr>
            	<tr>
            	
            	<c:forEach var="mlist2" items="${ mlist2 }" begin="${ cnt*4 }" end="${ (cnt*4)+3 }" varStatus="stat2">
            		<td><font size = "4">
                      <p><center>도착지: ${ mlist2.p_title } </p>
                      <p> 예약인원수 : ${ mlist2.p_reservpeople }/${ mlist2.p_maxpeople } </center></font></p>
            		</td>
            	</c:forEach>
            	<c:set var="cnt" value="${cnt+1 }"></c:set>
            	</tr>
            	<tr>
            </c:if>
		 </c:forEach>
		 </tr>
		 </c:if>	
          </table>

         
</div>
</section>
    <style>
    
    body{background-color: #727272}
    .hoverEffect { float:left; position:relative; width: 270px; height:260px; margin:10px; overflow:hidden; }
    .hoverEffect .image { display:block; opacity:1; position:relative; transform:scale(1.2); transition:0.5s ease; }
    .hoverEffect:hover>.image { transform:scale(1); filter: blur(5px); opacity:0.3; }
    .hoverEffect .txt {color:black; font-size:20px; top:50%; left:50%; text-align:center; line-height:20px; position:absolute; top:0; left:0; height:100%; width: 100%; background:rgba(195,193,149,0); opacity:0; overflow:hidden; transform:scale(2); transition:0.3s ease; }
    .hoverEffect:hover .txt { background:rgba(255,255,255,0.8); transform:scale(1); opacity:1; border-radius: 48px; -moz-border-radius: 48px; -khtml-border-radius: 48px; -webkit-border-radius: 48px;}
    .hoverEffect .txt h3 { font-size:30px; margin:120px 0 10px 0; }

    .product_table{position:relative; width:65%; top:230px;  margin:auto;}
    .product_table { border-collapse: collapse;  }
    .product_table td { color: #ffffff; text-align: center;}

  	</style>


</body>

</html>
