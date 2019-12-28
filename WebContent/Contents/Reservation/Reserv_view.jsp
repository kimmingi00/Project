<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="controller.reserv.*" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="tempDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
	<fmt:parseDate value="${tempDate}" var="sysDate" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${ sysDate.time  / (1000*60*60*24) }" integerOnly="true" var="sysDateNum"></fmt:parseNumber>
	<div>
		<img src="/Contents/img/product_img/천지연.jpg" style="width:1900px; height:850px;">
		<h2 style="color:white;position: absolute;left: 28%;top: 50%;font-size: 50px; text-shadow: 2px 1px 1px black;">지금, 여기관광과 함께 여행을 떠나보세요</h2>
	</div>
	  <h1 class="flash" style="position:absolute; left: 41%; top: 669px; text-shadow: 2px 1px 1px black;">
	  	밑에서 상품 정보를 확인해보세요<br>
	  	<i class="fa fa-angle-double-down" aria-hidden="true" style="position:absolute;left: 46%;top: 108px;text-shadow: 2px 1px 1px black;font-size: 52px;"></i>
	  </h1>
	
	<section class="product">
		<div class="cont_img">
			<c:if test="${ pvo.p_filename==null }">
				<img src="/Contents/img/product_img/no-image.png" style="width:650px; height:340px; margin-left:11%; margin-top: 2%;">
			</c:if>
				<c:if test="${ pvo.p_filename!=null }">
				<img src="${ savePath }/${pvo.p_filename}" style="width:650px; height:340px; margin-left:11%; margin-top: 2%;">
			</c:if>
		</div>
		<div class="cont_info">
			<h2>${ pvo.p_title }</h2>
			
			<p>출발일 : ${ pvo.p_indate }/ 
			<fmt:parseDate value="${ pvo.p_indate }" var="indate" pattern="yyyy-MM-dd"/>
			<fmt:parseNumber value="${ indate.time  / (1000*60*60*24) }" integerOnly="true" var="indateNum"></fmt:parseNumber>
			 <font style="font-weight:bold;">현재 ${indateNum-sysDateNum}일 남음</font></p>
			<p>도착일 : ${ pvo.p_outdate }</p>
			<p>출발지 : ${ pvo.p_in }</p>
			<p>도착지 : ${ pvo.p_out }</p>
			<p>현재 예약인원 : ${ pvo.p_reservpeople }&nbsp;/&nbsp;정원 : ${ pvo.p_maxpeople }</p>
			<p>예약 가능 인원 : <font style="font-weight:bold;">${ pvo.p_maxpeople-pvo.p_reservpeople }명</font></p>
			<p>가격 : ${ pvo.p_price }원</p>
			
			<c:if test="${pvo.theme!=null }">
			<p>테마 : ${ pvo.theme }</p>
			</c:if>
			
			<p>등록일 : ${ pvo.p_regdate.substring(0,10) }</p>
			<form name="fm" method="post">
				<a href="javascript:reserv()"><input type="button" value="예약" class="btn"></a>
				<input type="hidden" name="id" value="${ b_user.b_id }">
				<input type="hidden" name="idx" value="${ pvo.p_idx }">
			</form>
		</div>
	
		
	</section>
	
	<section class="product_cont">
		<div class="cont_contents">
			<p>${ pvo.p_contents }</p>
		</div>	
	</section>
<style>
	
	section {background-color:#fff; font-color:black; margin-left: 184px; }
	.product {margin-top:7%; color:black; width:1500px; height:500px; }
	.product h2 {font-size:35px; margin-bottom:5%;}
	p {margin-bottom:20px;}
	.title {font-size: 30px; font-weight:bold;}
	.btn {margin-bottom:20px; background-color:#07c; color:white; 
		border-color: #07c;
    	border-width: 1px;
    	border-style: solid;
    	font-size: 17px;
    	font-weight: 400;
    	text-align: center;
    	white-space: nowrap;
    	line-height: 1.17648;
	    min-width: 28px;
	    padding-left: 16px;
	    padding-right: 16px;
	    padding-top: 8px;
	    padding-bottom: 8px;
	    border-radius: 18px;
	    background: #0071e3;
		}
	.cont_image {position:absolute;  }
	.cont_info {margin-top: -24%; margin-left:67%;}
	.cont_info p {font-size:20px;}
	
	.product_cont {margin-top:7%; color:black; width:1500px; height:500px; 
					text-align:center; font-size:20px;
	}
	
<!--flash css -->
@-webkit-keyframes flash {
  from,
  50%,
  to {
    opacity: 1;
  }

  25%,
  75% {
    opacity: 0;
  }
}

@keyframes flash {
  from,
  50%,
  to {
    opacity: 1;
  }

  25%,
  75% {
    opacity: 0;
  }
}

.flash {
  -webkit-animation-name: flash;
  animation-name: flash;
}

<!--flash css 끝 -->	
	
</style>
</body>





</html>