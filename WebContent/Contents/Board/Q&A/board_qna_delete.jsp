<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head><title>자료 삭제</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
</head>
<body>
<form method="post" name="delfrm" action="BoardServlet?command=board_qna_delete_pro&idx=${idx}&page=${page}" >
 	<input type="hidden" name ="idx" value="${idx}">
  <table border="0" cellpadding="0" cellspacing="0" width="300" align="center" style="margin-top:20px;" >
  <tr>
    <td valign="middle" height="30">
    <font size="3" face="돋움" style="margin-left:40px;" class="alert">게시물을 삭제하시겠습니까?<br>
</font></td></tr>

  <tr>
    <td valign="middle" height="40">
    <input type="submit" value="삭제" style="margin-left:70px;margin-top:10px;" class="btn">
    <input type="button" value="닫기" onClick="window.close()" class="btn"> </td></tr>
  </table>
 
  </form>
  
  <style>
  .alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";}
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
  </style>
</body>
</html>
