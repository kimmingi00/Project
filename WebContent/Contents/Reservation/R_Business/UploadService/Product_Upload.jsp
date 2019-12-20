<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입</title>
    <link rel="stylesheet" href="/Contents/Index/jquery-ui-1.12.1/jquery-ui.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/Contents/Index/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="/Contents/Index/jquery-ui-1.12.1/datepicker-ko.js"></script>
    <link rel="stylesheet" href="/Contents/CSS/CSS_Member/signupstyle.css">

    <script>
    //캘린더 함수
    $(function() {
        //input을 datepicker로 선언
        $("#datepicker").datepicker();
        $("#datepicker2").datepicker();

    });

    function send(){
      if(member.p_title.value==""){
        alert("관광상품의 이름을 적어주세요");
        member.p_title.focus();
        return false;
      }
      if(member.p_contents.value==""){
        alert("관광상품의 내용을 적어주세요");
        member.p_contents.focus();
        return false;
      }
      if(member.p_indate.value==""){
        alert("출발일자를 선택해주세요");
        member.p_indate.focus();
        return false;
      }
      if(member.p_outdate.value==""){
        alert("도착일자를 선택해주세요");
        member.p_outdate.focus();
        return false;
      }
      if(member.p_in.value==""){
        alert("탑승지를 입력해주세요");
        member.p_in.focus();
        return false;
      }
      if(member.p_out.value==""){
        alert("도착지를 입력해주세요");
        member.p_out.focus();
        return false;
      }
      member.submit();
    }

    //Row 추가
    function addRow(){
       mytable = document.getElementById('insert');  //행을 추가할 테이블
       row = mytable.insertRow(mytable.rows.length);  //추가할 행

       cell1 = row.insertCell(0);  //실제 행 추가 여기서의 숫자는 컬럼 수
       cell2 = row.insertCell(1);


       cell1.innerHTML = "<input type='text' name='place1' align=right> <input type=button value='삭제' onclick='delItem();'> "; //추가한 행에 원하는  요소추가
    }

    //Row 삭제
    function delItem(){
      var lo_table = document.getElementById("insert");
      var row_index = lo_table.rows.length-1;      // 테이블(TR) row 개수

      if(row_index > 0) lo_table.deleteRow(row_index);
    }

    </script>
    <style>
    body {margin-top:17%;}
    </style>

</head>

<body>
        <div class="box">
                <center><font size="6">상품 업로드</font></center>
                <br>
                <form name="member" method="post" enctype="multipart/form-data" action="ReservServlet?command=ProductUploadPro&b_id=${ b_user.b_id }">
                  <div class="inputBox">
                    <input type="text" name="p_title" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">관광상품 이름</font></label>
                  </div>

                  <div class="inputBox">
                    <input type="text" name="p_contents" style="width:95%; height:130px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">관광상품 내용</font></label>
                  </div>

                <div class="inputBox" >
                  <input type="text" name="p_indate" id="datepicker" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                  <label><font size="4">출발일자</font></label>
                </div>

                  <div class="inputBox">
                        <input type="text" name="p_outdate" id="datepicker2" style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">도착일자</font></label>
                  </div>
                  <table class="insert">
                    <div class="inputBox">
                          <input type="text" name="p_in" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">탑승지</font></label>
                          <input type="button" value="추가"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >
                    </div>
                </table>

                  <div class="inputBox">
                        <input type="text" name="p_out" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">목적지</font></label>
                  </div>

                  <div class="inputBox" >
                    <input type="text" name="p_maxpeople" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">최대인원수</font></label>
                  </div>

                  <div class="inputBox" >
                    <input type="text" name="p_price" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">가격</font></label>
                  </div>

                  <div class="thema">
                    <span><font size="4">테마</font></span>
                    <br><br>
                    <div class="sub-thema">
                      <input type="checkbox" name="tema" value="팀장은 김민기">팀장은 김민기
                      <input type="checkbox" name="tema" value="팀장은 김민기">팀장은 김민기
                      <input type="checkbox" name="tema" value="팀장은 김민기">팀장은 김민기
                    </div>
                  </div>

                  <div class="thema">
                    <label><font size="4">첨부파일</font></label>
                    <br><br>
                    <input type="file" name="file" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                  </div>

                  <input type="button" value="등록"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="send();">
                  <input type="reset" value="다시쓰기"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >

                </form>
              </div>
              <br>

        </div>
</body>
</html>
