<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>관광상품 페이지</title>

    



</head>

<body>


<div class = "product_table">
		
        <table align="center">
        <c:if test="${empty mlist}">
			<p style="font-size:40px;">등록된 상품이 없습니다</p>
		</c:if>
		<c:if test="${!empty mlist}">
		<tr>
		<c:forEach var="mlist" items="${ mlist }" varStatus="stat">
          
            <td>
              <section class="hoverEffect">
              	<img style="border: 8px solid #000000; border-radius: 48px; -moz-border-radius: 48px; -khtml-border-radius: 48px; -webkit-border-radius: 48px; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>${ mlist.p_title }</h3>예약인원수 ${ mlist.p_reservpeople }/${ mlist.p_maxpeople }<br>가격 ${ mlist.p_price }원<br>★★★★★</div>
                </a>
              </section>
            </td>
            <c:if test="${ stat.count%4==0 }">
            	</tr>
            	<tr>
            </c:if>
		 </c:forEach>
		 </tr>
		 </c:if>	
          </table>

          <table align="center">
            <tr>
              <td>
                <section class="hoverEffect">
                	<img style="border: 8px solid #000000; border-radius: 48px; -moz-border-radius: 48px; -khtml-border-radius: 48px; -webkit-border-radius: 48px; width:249px;"
                  src="product_img/4.jpg" width="350" height="240"/>
                  <a href = "###">
                	<div class="txt"><h3>지리산</h3>예약인원수20/25<br>가격 20,000원<br>★★★★★</div>
                  </a>
                </section>
              </td>

              <td>
                <section class="hoverEffect">
                	<img style="border: 8px solid #000000; border-radius: 48px; -moz-border-radius: 48px; -khtml-border-radius: 48px; -webkit-border-radius: 48px; width:249px;"
                  src="product_img/5.jpg" width="350" height="240"/>
                  <a href = "###">
                	<div class="txt"><h3>부산</h3>예약인원수17/25<br>가격 20,000원<br>★★★★★</div>
                  </a>
                </section>
              </td>

              <td>
                <section class="hoverEffect">
                	<img style="border: 8px solid #000000; border-radius: 48px; -moz-border-radius: 48px; -khtml-border-radius: 48px; -webkit-border-radius: 48px; width:249px;"
                  src="product_img/4.jpg" width="350" height="240"/>
                  <a href = "###">
                	<div class="txt"><h3>서울</h3>예약인원수23/25<br>가격 20,000원<br>★★★★★</div>
                </a>
                </section>
              </td>

              <td height="30">
                <section class="hoverEffect">
                	<img style="border: 8px solid #000000; border-radius: 48px; -moz-border-radius: 48px; -khtml-border-radius: 48px; -webkit-border-radius: 48px; width:249px;"
                  src="product_img/4.jpg" width="350" height="240"/>
                  <a href = "###">
                	<div class="txt"><h3>치악산</h3>예약인원수10/25<br>가격 20,000원<br>★★★★★</div>
                </a>
                </section>
              </td>
            </tr>

            <tr>
              <td><font size = "4">
                        <p><center>도착지:지리산 </p>
                        <p> 예약인원수 : 20/25 </center></font></p>
              </td>

              <td><font size = "4">
                        <p><center>도착지:부산 </p>
                        <p> 예약인원수 : 17/25 </center></font></p>
              </td>

              <td><font size = "4">
                        <p><center>도착지:서울 </p>
                        <p> 예약인원수 : 23/25 </center></font></p>
              </td>

            <td><font size = "4">
                        <p><center>도착지:치악산 </p>
                        <p> 예약인원수 : 10/25 </center></font></p>
            </td>
          </tr>
      </table>
</div>



</body>
<link href="/Contents/CSS/CSS_Reservation/product_css/menustyle.css" rel="stylesheet" type="text/css">
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
</html>
