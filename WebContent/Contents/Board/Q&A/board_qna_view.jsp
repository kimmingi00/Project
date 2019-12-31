<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>



 
<title>QNA</title>
   
<font style=font-family:HoonYunpilsupkyukR;>
 <body topmargin="0" leftmargin="0">
 <div class="notice">
   <table border="0" width="800">
     <tr>
       <td width="100%" valign="top">&nbsp;<br>
       
       <table border="0" width="100%" align="center" cellspacing="0" style="height:200px;">
         <tr>
           <td class="title">
          <font size="7" style="color:#000000;">
                  제목 : ${board.q_title}</font>
                 <div style="border:5px solid black;margin-top:20px;"></div> 
           </td>
         </tr>
         
         <tr>
           <td class="content"  style="height:550px;">
             <p align="right" position="top" style="margin-bottom:150px;"><font size="5" style="color:#ffffff;">
              <font size="6" style="color:#000000;"><a class="list">${board.id}</a> / ${board.q_regdate.substring(0,11)}<a href="Board/filedown.jsp?idx=${board.q_idx}"> <img src="Board/img/disk.png" align="middle" width="22" height="20" border="0">${board.filename}</a>              
             <p>
             ${board.q_contents}<p><!--contents의 내용을 <BR>태그로 처리-->
             </font>
           </td>
         </tr>
         
         </table>
</font>

      <!--**** 여기서부터 게시물 내용 아래쪽의 버튼들이 나옵니다. 답변, 수정, 삭제, 목록보기 ****-->
      <p align="center">
      <font size="2">
       <!-- 새글쓰기 -->
       <a href="BoardServlet?command=board_qna_write&page=${page}">
       <img src="Board/img/write.png" border="0"></a>&nbsp;&nbsp;   
	   <!-- 수정하기 -->
       <a href="BoardServlet?command=board_qna_modify&idx=${board.q_idx}&page=${page}">
       <img src="Board/img/update.png" border="0"></a>&nbsp;&nbsp;
         <!-- 삭제하기 -->
     	<a href="javascript:board_del()"><img src="Board/img/delete.png" border="0"></a>&nbsp;&nbsp;
     	<a href="BoardServlet?command=board_qna_reply&idx=${board.q_idx}&page=${page}"><img src="Board/img/reply.png" border="0"></a>
       <!-- 목록보기 -->
       <a href="BoardServlet?command=board_qna&page=${page}"><img src="Board/img/list.png" border="0"></a>&nbsp;&nbsp;
      </font>
    </td>
  </tr>
  </table>  
</div>

	<style>
    body{background-color: #000000}
    .notice {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top: 130px; width: 97%; height: 85%; border: 24px solid #ffffff;
      background-color: #ffffff; overflow: auto;}
    .add{position: absolute; right: 90px; top:710px;}
	
    @font-face {
      font-family:'HoonYunpilsupkyukR';
      src:url(Board/font/HoonYunpilsupkyukR.ttf) format('truetype');
    }
    table{width: 100%;}
    th, td {padding: 10px; text-align: center;}
    th{background-color: #003800;}
    input{border-radius: 12px; height:45px;}
  </style>

<script>
   function board_del(){
      url = "BoardServlet?command=board_qna_delete&idx=${board.q_idx}&page=${page}";
      window.open(url, "board_qna_delete", "width=350, height=250");      
   }
</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
  </body>
  </html>

