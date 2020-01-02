<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<section class="container">
	<div style="text-align:center;margin:20px">
		<a href="/MessageServlet?command=MsgSend"><img src="/Contents/img/icon/qwrite3.png">&nbsp;<font size="6"  class="alert"; style="margin-right:30%;position:relative;bottom:15px;font-size:30px;color:black;margin-left:3px;">메세지 보내기</font></a>
		
		<c:if test="${ !empty user }">
		<a href="/MessageServlet?command=MsgSendList&id=${ user.id }"><img src="/Contents/img/icon/qmessage.png" height="80px;" style="position:relative;top:10px">&nbsp;<font size="6"  class="alert"; style="margin-right:30px;position:relative;bottom:15px;font-size:30px;color:black;margin-left:3px;">보낸 메세지</font></a>
		</c:if>
		
		<c:if test="${ !empty b_user }">
		<a href="/MessageServlet?command=MsgSendList&id=${ b_user.b_id }"><img src="/Contents/img/icon/qmessage.png" height="80px;" style="position:relative;top:10px">&nbsp;<font size="6"  class="alert"; style="margin-right:30px;position:relative;bottom:15px;font-size:30px;color:black;margin-left:3px;">보낸 메세지</font></a>
		</c:if>
	</div>
<div style="border:5px solid black;"></div>

	<form name="msg_fm" method="post">	
	<table class="mt">
	<p style="margin-left:918px;margin-top:20px;font-size:14px;margin-bottom:20px">
	현재 총 ${fn:length(mlist)}개의 메세지가 있습니다</p>
		 <thead style="border:3px solid #444444;">
		<tr>
			<th><input type="checkbox" name="all_select" onclick="CheckAll(document.msg_fm.select)"></th>
			<th>보낸 사람</th>
			<th>제목</th>
			<th>등록일</th>
			<th>열람 여부</th>
		</tr>
		<tr>
		<c:if test="${empty mlist}">
				<td colspan="5">메세지가 없습니다</td>		
			</c:if>
		</tr>
		</thead>
		<c:if test="${!empty mlist}">
		<c:forEach var="mlist" items="${ mlist }" varStatus="stat" >
				<input type="hidden" name="mlist" value="${ mlist }">
			
					<tr>
						<td><input type="checkbox" id="check_sel" name="select" value="${ mlist.m_idx }"></td>
						<td>${ mlist.send_id }
						</td>
						<td><a href="/MessageServlet?command=MsgView&m_idx=${ mlist.m_idx }" style="color:black;">${ mlist.title }</a></td>
						<td>${ mlist.regdate }</td>
						<td>
						<c:if test="${ mlist.readcnt==0 }">
							<img src="/Contents/img/icon/message.png" style=width:30px;>
							</c:if>
							<c:if test="${ mlist.readcnt!=0 }">
							<img src="/Contents/img/icon/openMessage.png" style=width:30px;>
							</c:if>
							
						</td>
					</tr>
						</c:forEach>
			</c:if>
	</table>
	<c:if test="${ !empty user }">
		<input type="hidden" name="id" value="${ user.id }">
	</c:if>
	<c:if test="${ !empty b_user }">
		<input type="hidden" name="id" value="${ b_user.b_id }">
	</c:if>	
	</form>	
</section>


    <footer class="footer-distributed">
       <span class="footer-left">
       <h3><font size="6">L O G O </font></h3>
       <p class="footer-links">
       <font size="3"><a href="#"> 회사 소개 </a></font>   |
       <font size="3"><a href="#"> 이용 약관 </a></font>   |
       <font size="3"><a href="#"> 개인정보 처리방침 </a></font>   |
       <font size="3"><a href="#"> 청소년 보호정책 </a></font>   |
       <font size="3"><a href="#"> 여기관광 정책 </a></font>   |
       <font size="3"><a href="#"> 고객 센터</a></font></p>
       <p class="footer-company-name">ⓒ칠면조 Corp &copy; 2019</p>
       </span>
       <span class="footer-center">
           
                <ul>
                   <li>
                      <i class="fa fa-envelope"></i>
                         <p><font size="4">dlgkrbs1@naver.com</font></p>
                   </li>
                </ul>
            
      
             <ul>
                  <li>
                      <i class="fa fa-phone"></i>
                         <p><font size="4">010-4907-3585</font></p>
                  </li>
             </ul>

             <span>
                
                   
                   <i class="fa fa-map-marker"></i>
                            <p><font size="5" >대전광역시 중구</font>
                           <font size="4">어덕마을로 10번길 95-6</font></p>
             </span>
             
             
       </span>

       <span class="footer-right">
                <p class="footer-company-about">
                   <span>수천번의 NO끝에 나오는 단 하나의 YES</span>
                      여기 관광
                </p>
            <br>
             <span class="footer-icons" >
                <a href="#"><img src="/Contents/img/footer_img/facebook.png" style="width:50px; height:50px;"></a>&nbsp;
                <a href="#"><img src="/Contents/img/footer_img/instagram.png" style="width:50px; height:50px;"></a>&nbsp;
                <a href="#"><img src="/Contents/img/footer_img/kakaotalk.png" style="width:50px; height:50px;"></a>&nbsp;
                <a href="#"><img src="/Contents/img/footer_img/youtube.png" style="width:50px; height:50px;"></a>&nbsp;
             </span>
       </span>
       </footer>



<style>
  .mt{width: 100%; border-top: 2px solid #444444; border-collapse: collapse;}
    .mt th, td { border-bottom: 1px solid #444444; padding: 10px; text-align: center;}
	body{background:#f2f2f2;}
	section {margin-top:7%;}

	a {color:white;}
	.btn {
    margin-bottom: 20px;
    background-color: #07c;
    color: white;
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
	
	   .footer-distributed{background-color: #292c2f; box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12); box-sizing: border-box; width: 100%; text-align: left; font: bold 16px sans-serif; padding: 55px 50px; margin-top: 50px;
                                 position: relative; left:0; bottom:0; }
   .footer-distributed .footer-left,
   .footer-distributed .footer-center,
   .footer-distributed .footer-right{display: inline-block; vertical-align: top; position:relative; left:50px;}
   .footer-distributed .footer-left{width: 40%;}
   .footer-distributed h3{color:  #ffffff;   font: normal 36px 'Cookie', cursive; margin: 0;}
   .footer-distributed .footer-links{color:  #ffffff; margin: 20px 0 12px; padding: 0;}
   .footer-distributed .footer-links a{display:inline-block;   line-height: 1.8;   text-decoration: none; color:  inherit;}
   .footer-distributed .footer-company-name{color:  #8f9296; font-size: 14px; font-weight: normal;   margin: 0;}
   .footer-distributed .footer-center{width: 30%;}
   .footer-distributed .footer-center i{background-color:  #33383b; color: #ffffff; font-size: 25px;   width: 38px; height: 38px; border-radius: 50%; text-align: center; line-height: 42px; margin: 10px 15px; vertical-align: middle;}
   .footer-distributed .footer-center i.fa-envelope{font-size: 17px; line-height: 38px;}
   .footer-distributed .footer-center p{display: inline-block; color: #ffffff; vertical-align: middle; margin:0;}
   .footer-distributed .footer-center p span{display:block; font-weight: normal; font-size:14px; line-height:2;}
   .footer-distributed .footer-center p a{color:  darkgray;   text-decoration: none;}
   .footer-distributed .footer-right{width: 20%;}
   .footer-distributed .footer-company-about{line-height: 20px; color:  #92999f; font-size: 13px; font-weight: normal; margin: 0;}
   .footer-distributed .footer-company-about span{display: block; color:  #ffffff; font-size: 14px; font-weight: bold;   margin-bottom: 20px;}
   .{position: relative;}
</style>

<style>
 .container {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; width:60%; height:700px; border: 24px solid #ffffff;
      background-color: #FFFFFF; overflow: auto;margin-left: 20%;}

</style>
</body>
</html>
