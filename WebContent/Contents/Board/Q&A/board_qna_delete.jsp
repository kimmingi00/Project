<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head><title>자료 삭제</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
</head>
<body>
<form method="post" name="delfrm" action="BoardServlet?command=board_qna_delete_pro&idx=${idx}&page=${page}" >
 	<input type="hidden" name ="idx" value="${idx}">
  <table border="0" cellpadding="0" cellspacing="0" width="300" align="center">
  <tr>
    <td height="50">
    <img src="Pds/img/bullet-05.gif"> <b><font size="3" color="red">잠깐 !!</font></b></td></tr>
  <tr>
    <td valign="middle" height="30">
    <font size="2" face="돋움">게시물을 삭제하시겠습니까?<br>
</font></td></tr>
  <tr>
    <td valign="middle" height="40">
    <input type="submit" value="삭제">
    <input type="button" value="닫기"> </td></tr>
  </table>
  </form>
</body>
</html>
