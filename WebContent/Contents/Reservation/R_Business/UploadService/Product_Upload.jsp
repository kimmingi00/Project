<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>글쓰기</title>
    <link rel="stylesheet" href="login_css/write.css">
    <script type="text/javascript">
      function send(){
        if(member.title.value==""){
          alert("이름을 적어주세요");
          member.tile.focus();
          return false;
        }
      }
    </script>
  </head>
  <body>
    <div class="contents">
      <div class="sub-cont">
        <h2>글쓰기</h2>
        <form class="member" action="" method="post">
          <table calss="board">
            <caption class="readonly">제목, 내용, 첨부가 있는 표</caption>
            <tbody>
              <tr>
                <th>관광상품 이름</th>
                <td><input type="text" name="title" class="form1" value=""></td>
              </tr>
              <tr>
                <th>관광상품 내용</th>
                <td><input type="text" name="contents" class="form1 form2" value=""></td>
              </tr>
              <tr>
                <th>출발, 도착일자</th>
                <td><input type="text" name="day" class="form3" value=""></td>
              </tr>
              <tr>
                <th>탑승지, 목적지</th>
                <td><input type="text" name="place" value=""></td>
              </tr>
              <tr>
                <th>최대인원수</th>
                <td><input type="text" name="cnt" value=""></td>
              </tr>
              <tr>
                <th>가격</th>
                <td><input type="text" name="price" value=""></td>
              </tr>
              <tr>
                <th>테마</th>
                <td><input type="text" name="tema" value=""></td>
              </tr>
              <tr>
                <th>첨부파일</th>
                <td><input type="file" name="file" value=""></td>
              </tr>
            </tbody>
          </table>
          <div class="btn">
              <input type="submit" value="글작성" class="btn-send">
              <input type="reset" value="다시쓰기" class="btn-reset">
              <input type="button" value="목록" class="btn-list" onclick="location.href='';">
          </div>
        </form>
        </div>
      </div>
  </body>
</html>