<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>글쓰기</title>
    <link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
    <link rel="stylesheet" href="login_css/write.css">
    <script type="my.js"></script>

  </head>
  <body>
    <div class="contents">
      <div class="sub-cont">
        <h2>글쓰기</h2>
        <form class="member" action="###" method="post">
          <table calss="board">
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
                <th>출발일자</th>
                <td><input type="text" name="day" class="form3" id="datepicker" value=""></td>
              </tr>
              <tr>
                <th>도착일자</th>
                <td><input type="text" name="day" class="form3" id="datepicker2" value=""></td>
              </tr>
              <tr>
                <th>탑승지</th>
                <td><input type="text" name="place" value=""></td>
              </tr>
              <tr>
                <th>목적지</th>
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
                <td>
                  <select name="select" id="select">
                    <option value="">테마를 선택해주세요</option>
                      <option value="1">팀장은 김민기</option>
                      <option value="2">팀장은 김민기</option>
                      <option value="3">팀장은 김민기</option>
                      <option value="4">팀장은 김민기</option>
                      <option value="5">팀장은 김민기</option>
                      <option value="6">팀장은 김민기</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>첨부파일</th>
                <td><input type="file" name="file" value=""></td>
              </tr>
            </tbody>
          </table>
          <div class="btn">
              <a href="javascript:send();" class="btn-send">글쓰기</a>
              <input type="reset" value="다시쓰기" class="btn-reset" style="cursor:pointer">
              <input type="button" value="목록" class="btn-list" onclick="location.href='';">
          </div>
        </form>
        </div>
      </div>
      <script>
          $(function() {
              //input을 datepicker로 선언
              $("#datepicker").datepicker();
              $("#datepicker2").datepicker();

              //From의 초기값을 오늘 날짜로 설정
              $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
              //To의 초기값을 내일로 설정
              $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
          });

          function send(){
            if(member.title.value==""){
              alert("이름을 적어주세요");
              member.tile.focus();
              return false;
            }
            if(member.contents.value==""){
              alert("내용을 적어주세요");
              member.contents.focus();
              return false;
            }
          }

      </script>
  </body>

</html>
