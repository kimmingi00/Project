<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head><title>자료 등록 수정</title><link rel="stylesheet" type="text/css" href="/stylesheet.css">
   <script>
function send(){
	alert("방명록을 수정합니다");
	frm.submit();
	}
function back(){
	alert("뒤로갑니다");
	history.back();
}
</script>
</head>
<body topmargin="0" leftmargin="0">


 <form method="post" action="BoardServlet?command=board_notice_modify_pro&idx=${board.idx}" 
 	name="frm" enctype="multipart/form-data">

<table border="0" width="800">
<tr>
  <td width="20%" height="500" valign="top" bgcolor="#ecf1ef">

  <!--  로그인 폼 추가부분 -->
  <input type="hidden" name="idx" value="${vo.idx}"/>
  <input type="hidden" name="filename2" value="${vo.filename}"/>

  </td>
  <td width="80%" valign="top">&nbsp;<br>
  <img src="Pds/img/bullet-01.gif"><font size="3" face="돋움" color="blue">
  <b> 뮤직자료실</b></font><font size="2"> - 자료 수정하기</font><p>
  <img src="Pds/img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
  <img src="Pds/img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>

		<table border="0">
    <tr>
      <td width="5%" align="right"><img src="Pds/img/bullet-02.gif"></td>
      <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
      <td width="80%"><input type="text" size="20" name="id" value="${board.id}" readonly></td></tr>
      <td align="right"><img src="Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">제목</font></td>
      <td><input type="text" size="60" name="title" value="${board.title}"></td></tr>
    <tr>
      <td align="right"><img src="Pds/img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">자료설명</font></td>
      <td><textarea wrap="physical" rows="10" name="contents" cols="60">${board.contents}</textarea></td></tr>
      <tr>
      <td align="right"><img src="./img/bullet-02.gif"></td>
      <td><font size="2" face="돋움">파일첨부</font></td>
      <td><input type="file" name="filename" size="30" ></td>
      </tr>

   
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td><a href="javascript:send()"><img src="Pds/img/edit-1.gif" border=0></a>&nbsp;
          <a href="javascript:back()"><img src="Pds/img/cancle.gif" border=0></a>
          </td>
          </tr>
    </table>
    </td>
  </tr>
  </table>
    </form>
</body>
</html>
