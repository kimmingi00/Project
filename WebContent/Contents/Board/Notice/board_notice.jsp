<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head><title>게시판 읽기</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
<style type="text/css">
  a.list {text-decoration:none;color:black;font-size:10pt;}
</style>
<script type="text/javascript">
	function search(){
		if(sboard.key.value==""){
			alert("검색어를 입력하세요");
			sboard.key.focus();
			return;
		}
		sboard.submit();
	}
</script>

<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>

<table border="0" width="800">
  <tr>
    <td width="20%" height="500" valign="top" bgcolor="#ecf1ef">
    
	<!-- 다음에 추가할 부분 --></td>

	<td width="80%" valign="top">	
		<br>
    <table border="0" cellspacing="1" width="100%" align="center">
      <tr>
        <td colspan="7" align="center" valign="center" height="20">
        <font size="4" color="blue">
        <img src="Board/img/bullet-01.gif"> <b>공지사항</b></font></td></tr>
      <tr>
        <td colspan="5" align="right" valign="middle" height="20">
		<font size="2">전체 : <b>${totcount}</b>건 - ${nowpage}/ ${totpage} Pages</font></td></tr>
 	   <tr bgcolor="e3e9ff">
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">번 호</font></td>
 	      <td width="50%" align="center" height="20"><font face="돋움" size="2">제 목</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">아이디</font></td>
 	      <td width="20%" align="center" height="20"><font face="돋움" size="2">파일이름 및 크기</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">작성일</font></td>
 	   </tr>

<c:forEach var="board" items="${list}">
		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
        <td align="center" height="25">
        <font face="돋움" size="2" color="#000000">${listcount}</font></td>
			<td align="left" height="20">&nbsp; 
				<img src="Board/img/reply2.gif">
				<font face="돋움" size="2" color="#000000">
				<a class="list" href="BoardServlet?command=board_notice_view&idx=${board.idx}">${board.title}</a></td>
					<td align="center" height="20"><font face="돋움" size="2">
					<a class="list">${board.id}</a></font></td>
					 <td align="center" height="20"><font face="돋움" size="2">${board.filename}</td>
				<td align="center" height="20"><font face="돋움" size="2">${board.regdate}</font></td>
			</tr>
			<c:set var="listcount" value="${listcount-1}"/>	
</c:forEach>

	 <div align="center">
        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr><tr>
             <td colspan="5">        
                 <div align="center">${pageSkip}</div>
			  </td>
			 </tr>
		</table>

	<div align="center">
			
			<form name="sboard" method="post" action ="BoardServlet?command=board_notice">
			
			<select name="search">
				<option value="title" style="color:black;" <c:if test="${query=='title'}">selected </c:if>>글제목</option>
				<option value="id" style="color:black;" <c:if test="${query=='id'}">selected </c:if>>작성자</option>
				<option value="contents" style="color:black;" <c:if test="${query=='contents'}">selected </c:if>>글내용</option>
			</select>
			
          	<input type="text" required onkeyup="this.setAttribute('value', this.value);" name="key" value="${key}" style="border:10px solid #ffffff;border-radius:24px;width:300px;">
		
			 <a href="javascript:search()"><img src="Board/img/search.png" style=width:50px;></a>
			 
		   	<a href="BoardServlet?command=board_notice_write&page=${nowpage}"><img src="Board/img/write.png" style=width:50px;></a>
    		
			</form>
			</div>
	
</body>
</html>

