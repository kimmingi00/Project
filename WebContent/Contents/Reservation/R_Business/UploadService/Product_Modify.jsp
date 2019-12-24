<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>상품 업로드</title>
    <link rel="stylesheet" href="/Contents/Index/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/Contents/Index/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="/Contents/Index/jquery-ui-1.12.1/datepicker-ko.js"></script>
    <link rel="stylesheet" href="/Contents/CSS/CSS_Member/signupstyle.css">
    <style type="text/css">
      body{
        margin-top: 17%;
      }
    </style>
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
        member.p_tile.focus();
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
    function add_div(){
    var div = document.createElement('div');
	var i = 2;
    div.innerHTML = document.getElementById('p_in').innerHTML;
    document.getElementById('field').appendChild(div);
    
  }
    //Row　삭제
    function remove_div(obj){
    document.getElementById('field').removeChild(obj.parentNode);

  }
    </script>

</head>

<body>
        <div class="box">
                <center><font size="6">상품 업로드</font></center>
                <br>
                <form name="member" method="post" enctype="multipart/form-data" action="ReservServlet?command=ProductModifyPro&b_id=${ b_user.b_id }&idx=${ p_idx }">
                  <div class="inputBox">
                    <input type="text" name="p_title" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ pvo.p_title }">
                    <label><font size="4">관광상품 이름</font></label>
                  </div>

                  <div class="inputBox">
                    <input type="text" name="p_contents" style="width:95%; height:130px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ pvo.p_contents }">
                    <label><font size="4">관광상품 내용</font></label>
                  </div>

                <div class="inputBox" >
                  <input type="text" name="p_indate" id="datepicker" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ pvo.p_indate }">
                  <label><font size="4">출발일자</font></label>
                </div>

                  <div class="inputBox">
                        <input type="text" name="p_outdate" id="datepicker2" style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="${ pvo.p_outdate }">
                        <label><font size="4">도착일자</font></label>
                  </div>

                  <div class="inputBox" id="p_in">
                          <input type="text" name="p_in" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="${ pvo.p_in }">
                          <label><font size="4">탑승지</font></label>
                          <input type="button" value="지역추가"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="add_div()">
                          <input type="button" value="삭제"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="remove_div(this)">
                  </div>

                  <div class="inputBox" id="field">

                  </div>

                  <div class="inputBox">
                        <input type="text" name="p_out" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="${ pvo.p_out }">
                        <label><font size="4">목적지</font></label>
                  </div>

                  <div class="inputBox" >
                    <input type="text" name="p_maxpeople" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ pvo.p_maxpeople }">
                    <label><font size="4">최대인원수</font></label>
                  </div>

                  <div class="inputBox" >
                    <input type="text" name="p_price" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ pvo.p_price }">
                    <label><font size="4">가격</font></label>
                    <input type="hidden" name="idx" value="${ p_idx }">
                  </div>

                  <div class="thema">
                    <span><font size="4">테마</font></span>
                    <br><br>
                    <div class="sub-thema">
                      <input type="checkbox" name="thema" value="팀장은 김민기">팀장은 김민기
                      <input type="checkbox" name="thema" value="팀장은 김민기">팀장은 김민기
                      <input type="checkbox" name="thema" value="팀장은 김민기">팀장은 김민기
                    </div>
                  </div>

                  <div class="thema">
                    <label><font size="4">첨부파일</font></label>
                    <br><br>
                    <input type="file" name="p_filename" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                  </div>

                  <input type="button" value="등록"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="send();">
                  <input type="reset" value="다시쓰기"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >

                </form>
              </div>
              <br>

        </div>
</body>
</html>
