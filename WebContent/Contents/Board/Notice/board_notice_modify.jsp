<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 


   <input type="hidden" name="idx" value="${vo.idx}"/>
  <input type="hidden" name="filename2" value="${vo.filename}"/>
<div class="notice">
     <font style="font-family:HoonYunpilsupkyukR;color:#ffffff;" size="9"><center style="margin:20px;">글수정</center></font>
     <form method="post" name="board" enctype="multipart/form-data" action="BoardServlet?command=board_notice_modify_pro">
	  <table border="0">

       <tr>
         <td width="18%" align="right"></td>
         <td><font size="6" color="#ffffff" style=font-family:HoonYunpilsupkyukR;>아이디</font></td>
         <td>
         <input type="text" size="60" name="id" style="text-align:center;" value="${board.id}" readonly></td>
       </tr>
       
	   <tr>
         <td align="right"></td>
         <td><font size="6" color="#ffffff" style=font-family:HoonYunpilsupkyukR;>제목</font></td>
         <td><input type="text" size="60" name="title" value="${board.title}" style="text-align:center;"></td>
       </tr>
       
       <tr>
         <td align="right"></td>
         <td><font size="6"  color="#ffffff" style=font-family:HoonYunpilsupkyukR;>내용</font></td>
         <td><textarea wrap="physical" rows="30" name="contents" cols="100" style="border-radius:24px;text-align:center;">${board.contents}</textarea></td>
       </tr>
       
       	<tr>
		  <td align="right"></td>
		  <td><font size="6" color="#ffffff" style=font-family:HoonYunpilsupkyukR;>파일첨부</font></td>
		  <td><input type="file" name="filename" size="60"></td>
		  </tr>
		 
		<tr>
          <td align="right">&nbsp;</td>
          <td><font size="6">&nbsp;</font></td>
          <td>
            <a href="javascript:send()"><img src="/Contents/img/board_img/write.png" border=0></a>&nbsp;&nbsp;&nbsp;
            <a href="javascript:back()"><img src="/Contents/img/board_img/cancel.png" border=0></a>
          </td>
        </tr>
      </table>
      </form>
</div>
  </body>
  
<script>
	function send(){
	alert("전송합니다");
	board.submit();
}
	
	function back(){
		alert("뒤로갑니다");
		history.back();
	}
</script>

<style>
	
    body{background-color: #727272}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top: 130px; width: 97%; height: 85%; border: 24px solid #754C00;
      background-color: #004B00; overflow: auto;}
    .add{position: absolute; right: 90px; top:710px;}
	
	
    @font-face {
      font-family: 'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
    table{width: 100%;}
    th, td {padding: 10px; text-align: center;}
    th{background-color: #003800;}
    input{border-radius: 12px; height:45px;}

 
  </style>
  </html>
