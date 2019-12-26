<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>


 <div class="notice">
   <table border="0" width="800">
     <tr>
       <td width="100%" valign="top">&nbsp;<br>
       
         <table border="0" width="90%" align="center">
           <tr>
              <font size="8" color="#ffffff"> 글읽기</font>
           </tr>
         </table>

       <table border="0" width="100%" align="center" cellspacing="0" style="height:200px;">
         <tr>
           <td class="title">
          <font size="5" style="color:#ffffff;">
                  제목 : ${board.title}</font>
           </td>
         </tr>
         
         <tr>
           <td class="content"  style="border:7px solid #ffffff;border-radius:24px;height:550px;">
             <p align="right" piosition="top" style="margin-bottom:150px;"><font size="5" style="color:#ffffff;">
              <a class="list">${board.id}</a> / <font size="5" style="color:#ffffff;">${board.regdate}</font><a href="Board/filedown.jsp?idx=${board.idx}"> <img src="/Contents/img/board_img/disk.png" align="middle" width="22" height="20" border="0">${board.filename}</a>
             <p>
             ${board.contents}<p><!--contents의 내용을 <BR>태그로 처리-->
           </td>
         </tr>
         </table>
</font>

      <!--**** 여기서부터 게시물 내용 아래쪽의 버튼들이 나옵니다. 답변, 수정, 삭제, 목록보기 ****-->
      <p align="center">
      <font size="2">
            <c:if test="${user != null}">
       <!-- 새글쓰기 -->
       <a href="BoardServlet?command=board_notice_write">
       <img src="/Contents/img/board_img/write.png" border="0"></a>&nbsp;&nbsp;   
	   <!-- 수정하기 -->
       <a href="BoardServlet?command=board_notice_modify&idx=${board.idx}">
       <img src="/Contents/img/board_img/update.png" border="0"></a>&nbsp;&nbsp;
         <!-- 삭제하기 -->
     	<a href="javascript:board_del()"><img src="/Contents/img/board_img/delete.png" border="0"></a>&nbsp;&nbsp;
     	 </c:if>
       <!-- 목록보기 -->
       <a href="BoardServlet?command=board_notice"><img src="/Contents/img/board_img/list.png" border="0"></a>&nbsp;&nbsp;
      </font>
    </td>
  </tr>
  </table>
  
</div>
  </body>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
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

<script>
   function board_del(){
      url = "BoardServlet?command=board_notice_delete&idx=${board.idx}";
      window.open(url, "board_notice_delete", "width=350, height=250");      
   }
   
 
</script>
  </html>

