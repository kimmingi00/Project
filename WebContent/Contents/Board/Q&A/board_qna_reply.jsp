<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>

<title>reply</title>

<section>
<center>
<div class="notice">
    <input type="hidden" name="idx" value="${vo.q_idx}"/>
  <input type="hidden" name="filename2" value="${vo.filename}"/>
  
     <div style="margin-top:30px;">
     <font style="color:#000000;" class="alert" size="4">
     <img src="/Contents/img/board_img/qcomment3.png"  width="64px;" height="64px;"style="margin-left:130px;"></a>
     	답변쓰기
     </font>
     </div>
 
     <form method="post" action="BoardServlet?command=board_qna_reply_pro&page=${page}&idx=${board.q_idx}" name="boardForm">
      <input type="hidden" name="id" value="${user.id}">
    <input type="hidden" name="idx" value="${board.q_idx}"/>
    <input type="hidden" name="q_re_ref" value="${board.q_re_ref}"/>
    <input type="hidden" name="q_re_lev" value="${board.q_re_lev}"/>
    <input type="hidden" name="q_re_seq" value="${board.q_re_seq}"/>
    
	  <table border="0" style="margin-top:30px;width:90%;margin-left:10px">

       <tr>
         <td><font size="3" color="#000000" class="alert">아이디</font></td>
         <td>
         <input type="text" size="60" name="id" style="text-align:center;width:200px;" value="${user.id}" readonly></td>
       </tr>
	   <tr>
         <td><font size="3"  color="#000000" class="alert">제목</font></td>
         <td><input type="text" size="60" name="title" style=text-align:center;width:400px; ></td>
       </tr>
       <tr>
      
         <td><font size="3" color="#000000" class="alert">내용</font></td>
         <td><textarea wrap="physical" rows="30" name="contents" cols="100" style="border-radius:24px;text-align:center;width:90%;height:300px"></textarea></td>
       </tr>
       
       	<tr>
		  
		  <td><font size="3"  color="#000000" class="alert">파일첨부</font></td>
		  <td><input type="file" name="filename" size="60" style="width:180px;position:relative;top:4px;"></td>
		  </tr>
		 
		<tr>
          <td style="position:relative;left:480px;">
          <center>
            <a href="javascript:send()"><img src="/Contents/img/board_img/qcomment3.png" style="width:64px;height:64px"></a>
            <a href="javascript:back()"><img src="/Contents/img/board_img/qback.png" style="position:relative;bottom:3px;width:64px;height:64px"></a>
            </center>
          </td>
        </tr>
        
      </table>
    
      </form>
	</div>
  </center>
</section>




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
	
    body{background-color: #f2f2f2;}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top: 130px; width: 60%; height:740px; border: 24px solid #f2f2f2;
      background-color: #ffffff; overflow: auto; margin-bottom: 170px;}
    .add{position: absolute; right: 90px; top:710px;}
	
    @font-face {
      font-family: 'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
    table{width: 100%;}
    th, td {padding: 10px; text-align: center;}
    th{background-color: #003800;}
    input{border-radius: 12px; height:30px;}
    
 .alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";}
  </style>
  </body>
  <%@ include file="/Contents/include_file(navi bar)/footer.jsp" %>
  </html>
