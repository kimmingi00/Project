<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>


<div class = "notice">
<font color="#000000" class="alert">
  <font size ="6">
        Q&A
  </font>
  <br>
    <table style="margin-top:20px;border-top:3px solid black; " >  
        <tbody>
        
       <c:forEach var="board" items="${list}">
       
		<tr onMouseOver="style.backgroundColor='#ffffff'" onMouseOut="style.backgroundColor=''">
        <td align="center" height="25" width="10%">
        <font class="alert" size="6" color="#000000">${listcount}</font></td>
			
			<td align="left" height="20" style="width:500px;text-align:left;">&nbsp; 
				<font class="alert" size="6" color="#000000">
					<c:if test="${board.q_re_lev > 0}">
                        <c:forEach begin="1" end="${board.q_re_lev}">
                            &nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
                        </c:forEach>
                        <font style="color:#848484">[답글]</font>
                    </c:if>
				<a class="list" href="BoardServlet?command=board_qna_view&idx=${board.q_idx}&page=${nowpage}" style="color:black;text-decoration:none;">${board.q_title}</a></td>
				
					<td align="center" height="20"><font class="alert" size="6">
					${board.id}</font></td>
					
					 <td align="center" height="20" ><font class="alert" size="6">${board.filename}</td>
					 
				<td align="center" height="20"><font class="alert" size="6">${board.q_regdate.substring(0,11)}</font></td>
				<td align="center" height="20"><font class="alert" size="6">${board.q_readcnt}</font><img src="/Contents/img/board_img/eye2.png" style="width:18px;height:17px;margin-left:5px;position:relative;top:3px;"/></td>
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
			<form name="sboard" method="post" action ="BoardServlet?command=board_qna" style="margin-top:20px;">
			<select name="search">
				<option value="q_title" style="color:black;" <c:if test="${query=='q_title'}">selected </c:if>>글제목</option>
				<option value="id" style="color:black;" <c:if test="${query=='id'}">selected </c:if>>작성자</option>
				<option value="q_contents" style="color:black;" <c:if test="${query=='q_contents'}">selected </c:if>>글내용</option>
			</select>
			
          	<input type="text" required onkeyup="this.setAttribute('value', this.value);" name="key" value="${key}" style="border:2px solid #000000;border-radius:24px;width:300px;height:35px;">
		
			 <a href="javascript:search()"><img src="/Contents/img/board_img/qsearch.png" style="width:30px;position:relative;top:10px;"></a>
			 
			<c:if test="${user != null}">
   			<a href="BoardServlet?command=board_qna_write&page=${nowpage}"><img src="/Contents/img/board_img/qwrite.png" style=width:30px;hight:30px;float:right;position:relative;top:10px;></a>
    		</c:if>
			</form>
			</div>
			
</font>
</div>

     <style>
    body{background-color:#f2f2f2}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top:130px; width:60%; height: 450px; border: 24px solid #ffffff;
      background-color: #FFFFFF; overflow: auto;margin-left: 20%; margin-bottom: 170px;}
    .add{position: absolute; right: 90px; top:710px; }

    @font-face {
      font-family: 'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
    table{width: 100%;border-collapse: collapse;}
    th, td { border-bottom: 1px solid #D8D8D8; padding : 20px 0px 20px 0px; text-align: center;}
    th{background-color: #585858; color:#ffffff;}

select {
text-align:center;
width: 60px;
padding: .8em .5em;
border: 2px solid #000000;
font-family: inherit;
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

.alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";
    font-size:16px;
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
<%@ include file="/Contents/include_file(navi bar)/footer.jsp" %>


</html>
