<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<HTML>
<HEAD>
<TITLE>사용자의 아이디를 체크합니다.</TITLE>
    <link rel="stylesheet" href="/Contents/CSS/CSS_Member/signupstyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">

body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
  .btn {
   cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}
    
</STYLE>
<script>
	function id_check(){
		var user = frm.b_id.value;
		if(user=="" || user.length<5 || user.length>16){
			alert("아이디는 5~16자 이내로 입력해주세요");
			frm.b_id.focus();
			return;
		}
		frm.action="/BusinessServlet?command=business_idCheck";
		frm.submit();
	}
	function win_close(){
		opener.business.b_id.value=frm.id2.value;
		opener.business.b_check.value=1;
		self.close();
	}
</script>





</HEAD>
<BODY bgcolor="#FFFFFF">






<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
        	<form name="frm" method="post" action="BusinessServlet?command=business_idCheck"  >
	 <div class="tab_container" style="margin-top:10px;width:477;height:182;">
         <div class="box" style="top:115px;border:none;width:400px;left:111.5;" >
                    <div class="inputBox" style="width:300px;marign-top:100px;left: 44px;bottom: 27px;">
                      <input type="text" name="b_id" maxlength=16 style="width:300px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ b_id }" >
                      <label><font size="4">성명</font></label>
                      <input type=hidden name="id2" value="${ b_id }">
                    </div>
                    </div>
                    </div>
                    <input class="btn" type=button border=0 vspace=0 onclick="id_check()" style="position:relative;position:relative;left: 222px;bottom: 129px;" value="확인"/>
                    <input class="btn" type=button border=0 vspace=0 onclick="win_close()" style="position:relative;position:relative;left: 0px;right: 0px;border-right-width: 0px;margin-right: 20‒;margin-right: 70px;top: 21px;" value="사용하기"/>
	</form>
        
        
        
       <div style="position:relative;bottom: 125px;width: 495px;height: 83px;">
	<c:if test="${ row==0 }">
          <br><FONT FACE="굴림"><B>사용 가능합니다.</B></FONT><br>
         <BR><FONT COLOR="#483cae"><b>${ b_id }</b></FONT>는 아직 사용되지 않은 아이디입니다.
         <BR><FONT COLOR="#483cae"><b>${ b_id }</b></FONT>로 등록하셔도 됩니다.
         
	</c:if>
	<c:if test="${ row==1 }">
         <br><font face="굴림"><b>죄송합니다</b></font><br>
    	<BR><FONT COLOR="#483cae"><b>${ b_id }</b></FONT>는 이미 사용 중인 아이디입니다<br>
    	다른 아이디를 사용하여 주십시오.
    	
	</c:if>
</div>
	
        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>



<script>
$(document).ready(function() {

	//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});

});
</script>
</BODY>
</HTML>