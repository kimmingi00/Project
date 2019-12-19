<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${row==0}">
	<script>
		alert("pass error");
		history.back();
	</script>
</c:if>
<c:if test="${row==-1}">
	<script>
		alert("id error");
		history.back();
	</script>
</c:if>

<HTML>
<HEAD>
<TITLE>로그온</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000; 
      BACKGROUND-POSITION: left top; BACKGROUND-REPEAT: no-repeat;}
//-->
</STYLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000" leftmargin=0 topmargin=0 >
<br><br>
<TABLE width="683" border="0" cellspacing="0" cellpadding="0" height="265">
<TR>
  <TD width=100>&nbsp;</td>
  <TD>
    <table width="583" border="0" cellspacing="0" cellpadding="0" height="265">
	    <tr>
		  <td height="298"> 
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr> 
			    <td width="9"><img src="./img/h_b02.gif" width="9" height="21"></td>
				<td bgcolor="7aaad5"> 
				 <div align="center"><font color="#FFFFFF"><b>회원가입을 환영합니다</b></font></div>
				 </td>
				 <td width="9"><img src="./img/f_b03.gif" width="9" height="21"></td>
			  </tr>
			 </table>
			 <table border="0" cellpadding="0" cellspacing="0" width="550">
			   <tr> 
			     <td bgcolor="#7aaad5"> 
				   <table border="0" cellpadding="3" cellspacing="1" width="99%" height="321">
				     <tr bgcolor="#FFFFFF"> 
					   <td align=CENTER bgcolor="#eff4f8" height="92">${user.name}님 환영합니다 
						</td>
					  </tr>
				     <tr bgcolor="#FFFFFF"> 
					   <td align=CENTER bgcolor="#eff4f8" height="92">
					   <a href="">[내정보수정]</a>
					   <a href="member_logout.do">[로그아웃]</a>
					  <a href="Contents/index.jsp">[메인 페이지이동]</a>  
						</td>
					 </tr>
					  <tr bgcolor="#FFFFFF"> 
						<td bgcolor="#ffffff" align=CENTER height="138"> 
						  <table width="600" border="0" cellspacing="0" cellpadding="0">
							<tr> 
							  <td> 
								<table cellpadding=2 cellspacing=0 align=center border=0>
								  <tr> 
									<td> 
										<p style="LINE-HEIGHT:15PX;"><font color="#AFAFB1">
										
										   <FONT COLOR="#006F70">이용가능한 </FONT>곳입니다.<BR><BR>
									</td> 
								  </tr> 
					              <tr> 
							        <td> 
							          <p style="LINE-HEIGHT:15PX;"><font color="#AFAFB1">즐거운 시간 
							          <font color="#ff7508">많이 배우고 가시길</font>을 바랍니다.<br>
							            <br>
							            <br>
							          </p>
							       </td>
							      </tr>
						         </table>
						       </td>
					         </tr>
					       </table>
				         </td>
				       </tr>
			         </table>
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr> 
				  <td width="9"><img src="./img/h_b04.gif" width="12" height="11"></td>
				  <td bgcolor="7aaad5" width="612"> 
					<div align="center"></div>
				  </td>
				  <td width="10"><img src="./img/h_b05.gif" width="12" height="11"></td>
				</tr>
			  </table>
			</td>
  		</tr>
		</table>
	</TD>
</TR>
</TABLE>
</body>
</html>

