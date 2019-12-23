<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<TITLE>사용자의 아이디를 체크합니다.</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
--->
</STYLE>
<script>
	function id_check(){
		var user = frm.id.value;
		if(user=="" || user.length<5 || user.length>16){
			alert("아이디는 5~16자 이내로 입력해주세요");
			frm.id.focus();
			return;
		}
		
		frm.action="/BusinessServlet?command=business_idCheckPro";
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
  <TR BGCOLOR=#7AAAD5>
   
    <td align=center><FONT COLOR="#FFFFFF"><b>사업자 아이디 중복 체크</FONT></td>
 
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
	<c:if test="${ row==0 }">
          <br><FONT FACE="굴림"><B>사용 가능합니다.</B></FONT><br>
         <BR><FONT COLOR="#483cae"><b>${ id }</b></FONT>는 아직 사용되지 않은 아이디입니다.
         <BR><FONT COLOR="#483cae"><b>${ id }</b></FONT>로 등록하셔도 됩니다.
	</c:if>
	<c:if test="${ row==1 }">
         <br><font face="굴림"><b>죄송합니다</b></font><br>
    	<BR><FONT COLOR="#483cae"><b>${ id }</b></FONT>는 이미 사용 중인 아이디입니다<br>
    	다른 아이디를 사용하여 주십시오.
	</c:if>
	<form name="frm" method="post" action="/BusinessServlet?command=business_idCheckPro"  >
           <INPUT NAME=id type=text size=16 maxlength=16 value="${ id }">
      	   <a href="javascript:id_check()"><input type="button" value="ID찾기"></a>
      	   <input type=hidden name="id2" value="${ id }">
	</form>
        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
  </tr>
  <tr>
    <td colspan=3 align=center>
      <a href="javascript:win_close()"><input type="button" value="닫기"></a>
    </td>
  </tr>
</table>
</BODY>
</HTML>