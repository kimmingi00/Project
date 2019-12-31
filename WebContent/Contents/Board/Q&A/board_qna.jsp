<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>

    <title>qna</title>

<div class = "notice">
<font color="#000000" style="font-family:HoonYunpilsupkyukR;">
  <font size ="9">
      <center>
        <br>여기관광 QNA

      </center>
  </font>
  <br>
  <font size ="6">
    <table>
        <thead>
          <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>첨부파일</th>
            <th>등록일</th>
            <th>조회수</th>
          </tr>
        </thead>
  </font>
        <tbody>
        
       <c:forEach var="board" items="${list}">
       
		<tr onMouseOver="style.backgroundColor='#ffffff'" onMouseOut="style.backgroundColor=''">
        <td align="center" height="25" width="350px">
        <font style=font-family:HoonYunpilsupkyukR; size="6" color="#000000">${listcount}</font></td>
			
			<td align="left" height="20" style="width:300px">&nbsp; 
				<font style=font-family:HoonYunpilsupkyukR; size="6" color="#000000">
					<c:if test="${board.q_re_lev > 0}">
                        <c:forEach begin="1" end="${board.q_re_lev}">
                            &nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
                        </c:forEach>
                        <font style="color:yellow">[답글]</font>
                    </c:if>
				<a class="list" href="BoardServlet?command=board_qna_view&idx=${board.q_idx}&page=${nowpage}" style="color:#848484;text-decoration:none;">${board.q_title}</a></td>
				
					<td align="center" height="20"><font style=font-family:HoonYunpilsupkyukR; size="6">
					${board.id}</font></td>
					
					 <td align="center" height="20"><font style=font-family:HoonYunpilsupkyukR; size="6">${board.filename}</td>
					 
				<td align="center" height="20"><font style=font-family:HoonYunpilsupkyukR; size="6">${board.q_regdate.substring(0,11)}</font></td>
				<td align="center" height="20"><font style=font-family:HoonYunpilsupkyukR; size="6">${board.q_readcnt}</font></td>
			</tr>
			<c:set var="listcount" value="${listcount-1}"/>	</div>
</c:forEach>
        </tbody>
      </table>
          <table>
  		<tr>
             <td>        
                 <div align="center" style="color:#000000">${pageSkip}</div>
			  </td>
			 </tr>
		</table>
		
			<div align="center">		
			<form name="sboard" method="post" action ="BoardServlet?command=board_qna">
			<select name="search">
				<option value="q_title" style="color:black;" <c:if test="${query=='q_title'}">selected </c:if>>글제목</option>
				<option value="id" style="color:black;" <c:if test="${query=='id'}">selected </c:if>>작성자</option>
				<option value="q_contents" style="color:black;" <c:if test="${query=='q_contents'}">selected </c:if>>글내용</option>
			</select>
			
          	<input type="text" required onkeyup="this.setAttribute('value', this.value);" name="key" value="${key}" style="border:2px solid #000000;border-radius:24px;width:300px;height:35px;">
		
			 <a href="javascript:search()"><img src="/Contents/img/board_img/search.png" style=width:50px;></a>
			 
			<c:if test="${user != null}">
   			<a href="BoardServlet?command=board_qna_write&page=${nowpage}"><img src="/Contents/img/board_img/write.png" style=width:50px;></a>
    		</c:if>
			</form>
			</div>
			
</font>
</div>
     <style>
    body{background-color: #000000}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top: 130px; width: 97%; height: 700px; border: 24px solid #ffffff;
      background-color: #FFFFFF; overflow: auto;}
    .add{position: absolute; right: 90px; top:710px;}

    @font-face {
      font-family: 'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
    table{width: 100%; border-top: 2px solid #444444; border-collapse: collapse;}
    th, td { border-bottom: 1px solid #444444; padding: 10px; text-align: center;}
    th{background-color: #585858; color:#ffffff;}

select {
text-align:center;
width: 50px;
padding: .8em .5em;
border: 2px solid #000000;
font-family: inherit;
background: url('arrow.jpg') no-repeat 95% 50%;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
border-radius: 12px;
color:black;
size:5;
}

select::-ms-expand {
display: none;


}


.inputbox{
	width:150px;
}
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
</body>



</html>
