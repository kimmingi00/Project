<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 




<div class = "notice">
<font color="#ffffff" style="font-family: HoonYunpilsupkyukR;">
  <font size ="9">
      <center>
        <br>여기관광 공지사항

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
          </tr>
        </thead>
  </font>
        <tbody>
        
       <c:forEach var="board" items="${list}">
       
		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
        <td align="center" height="25" width="350px">
        <font style=font-family:HoonYunpilsupkyukR; size="6" color="#ffffff">${listcount}</font></td>
			<td align="left" height="20" style="width:300px">&nbsp; 
				<font style=font-family:HoonYunpilsupkyukR; size="6" color="#000000">
				<a class="list" href="BoardServlet?command=board_notice_view&idx=${board.idx}" style="color:skyblue;text-decoration:none;">${board.title}</a></td>
					<td align="center" height="20"><font style=font-family:HoonYunpilsupkyukR; size="6">
					${board.id}</font></td>
					 <td align="center" height="20"><font style=font-family:HoonYunpilsupkyukR; size="6">${board.filename}</td>
				<td align="center" height="20"><font style=font-family:HoonYunpilsupkyukR; size="6">${board.regdate.substring(0,11)}</font></td>
			</tr>
			<c:set var="listcount" value="${listcount-1}"/>	</div>
</c:forEach>

        </tbody>
      </table>
      
          <table>
  		<tr>
             <td>        
                 <div align="center" style="color:#ffffff">${pageSkip}</div>
			  </td>
			 </tr>
		</table>
		
			<form name="sboard" method="post" action ="BoardServlet?command=board_notice">	
			<select name="search">
				<option value="title"  style="color:black"<c:if test="${query=='title'}">selected </c:if>>글제목</option>
				<option value="id" style="color:black"<c:if test="${query=='id'}">selected </c:if>>작성자</option>
				<option value="contents" style="color:black"<c:if test="${query=='contents'}">selected </c:if>>글내용</option>
			</select>

		 		<div class="box">
		 		 <div class="inputBox">
          			<input type="text" required onkeyup="this.setAttribute('value', this.value);" name="key" value="${key}">
          			<label><font size="4">search</font></label>
		        </div>
		       </div>
		
			 <a href="javascript:search()"><img src="/Contents/img/board_img/search.png" style=width:45px;></a>
			<c:if test="${user.admin==1}">
   			<a href="BoardServlet?command=board_notice_write&page=${nowpage}"><img src="/Contents/img/board_img/write.png" style=width:50px;></a>
    		</c:if>
			</form>
			
	
      
      
</font>
</div>
 
</body>
<style>
    body{background-color: #727272}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top: 130px; width: 97%; height: 700px; border: 24px solid #754C00;
      background-color: #004B00; overflow: auto;}
    .add{position: absolute; right: 90px; top:710px;}

    @font-face {
      font-family: 'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
    table{width: 100%; border-top: 2px solid #444444; border-collapse: collapse;}
    th, td { border-bottom: 1px solid #444444; padding: 10px; text-align: center;}
    th{background-color: #003800;}




select {
text-align:center;
width: 50px;
padding: .8em .5em;
border: 2px solid #ffffff;
font-family: inherit;
background: url('arrow.jpg') no-repeat 95% 50%;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
border-radius: 12px;
color:white;
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
</html>
