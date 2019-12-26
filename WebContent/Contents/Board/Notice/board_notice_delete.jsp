<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 

<form method="post" name="delfrm" action="BoardServlet?command=board_notice_delete_pro&idx=${idx}" >
 	<input type="hidden" name ="idx" value="${idx}">
  <table border="0" cellpadding="0" cellspacing="0" width="300" align="center">
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
