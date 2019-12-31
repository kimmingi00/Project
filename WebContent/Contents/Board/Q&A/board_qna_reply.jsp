<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>

<title>QNA</title>

<div class="notice">
     <font style="font-family:HoonYunpilsupkyukR;color:#000000;" size="9"><center style="margin:30px">답글쓰기</center></font>
     
       <form method="post" action="BoardServlet?command=board_qna_reply_pro&page=${page}&idx=${board.q_idx}" name="boardForm">
        <input type="hidden" name="id" value="${user.userid}">
    <input type="hidden" name="idx" value="${board.q_idx}"/>
    <input type="hidden" name="q_re_ref" value="${board.q_re_ref}"/>
    <input type="hidden" name="q_re_lev" value="${board.q_re_lev}"/>
    <input type="hidden" name="q_re_seq" value="${board.q_re_seq}"/>
	  <table border="0">

       <tr>
         <td width="18%" align="right"></td>
         <td><font size="6" color="#000000" style=font-family:HoonYunpilsupkyukR;>아이디</font></td>
         <td>
         <input type="text" size="60" name="id" style="text-align:center;width:500px;" value="${user.userid}" readonly></td>
       </tr>
       
	   <tr>
         <td align="right"></td>
         <td><font size="6"  color="#000000" style=font-family:HoonYunpilsupkyukR;>제목</font></td>
         <td><input type="text" size="60" name="title" style=text-align:center;width:500px;></td>
       </tr>
       
       <tr>
         <td align="right"></td>
         <td><font size="6" color="#000000" style=font-family:HoonYunpilsupkyukR;>내용</font></td>
         <td><textarea wrap="physical" rows="30" name="contents" cols="100" style="border-radius:24px;text-align:center;width:500px;"></textarea></td>
       </tr>
       
       	<tr>
		  <td align="right"></td>
		  <td><font size="6"  color="#000000" style=font-family:HoonYunpilsupkyukR;>파일첨부</font></td>
		  <td><input type="file" name="filename" size="60"></td>
		  </tr>
		 
		<tr>
          <td align="right">&nbsp;</td>
          <td><font size="6">&nbsp;</font></td>
          <td>
            <a href="javascript:send()"><img src="Board/img/write.png" border=0></a>&nbsp;&nbsp;&nbsp;
            <a href="javascript:back()"><img src="Board/img/cancel.png" border=0></a>
          </td>
        </tr>
      </table>
      </form>
</div>





<script>
	function send(){
	alert("전송합니다");
	boardForm.submit();
}
	
	function back(){
		alert("뒤로갑니다");
		history.back();
	}
</script>

<style>
	
    body{background-color: #000000}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top: 130px; width: 97%; height: 85%; border: 24px solid #ffffff;
      background-color: #ffffff; overflow: auto;}
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
  </body>
  </html>
