<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<link rel="stylesheet" href="/Contents/Index/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="/Contents/Index/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="/Contents/Index/jquery-ui-1.12.1/datepicker-ko.js"></script>
    <link rel="stylesheet" href="/Contents/CSS/CSS_Reservation/product_css/signupstyle.css">

  <style type="text/css">
      body{
        margin-top: 17%; background-color:#f2f2f2;
      }
    </style>

    <script>
    //캘린더 함수
    $(function() {
        //input을 datepicker로 선언
        $("#datepicker1").datepicker();
        $("#datepicker2").datepicker();

    });

    function send(){
      if(member.p_title.value==""){
        alert("관광상품의 이름을 입력해주세요");
        member.p_tile.focus();
        return false;
      }
      if(member.p_contents.value==""){
        alert("관광상품의 내용을 입력해주세요");
        member.p_contents.focus();
        return false;
      }
      if(member.p_indate.value==""){
        alert("출발일자를 선택해주세요");
        member.p_indate.focus();
        return false;
      }
      if(member.p_intime.value==""){
        alert("출발시간을 입력해주세요");
        member.p_intime.focus();
        return false;
      }
      if(member.p_outdate.value==""){
        alert("도착일자를 선택해주세요");
        member.p_outdate.focus();
        return false;
      }
      if(member.p_outtime.value==""){
        alert("도착시간을 입력해주세요");
        member.p_outtime.focus();
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
    function add_row(cnt) {
      var my_tbody = document.getElementById('add_p_in');
      // var row = my_tbody.insertRow(0); // 상단에 추가
      var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
	  
      if(my_tbody.rows.length > 4){
        alert("탑승지는 최대 5개까지 입니다");
        member.p_in.focus();
        return;
      }else {
    	  member.cnt.value=my_tbody.rows.length+2;	
    	  cell1.innerHTML = "<td><input type='text' name='p_in"+cnt+"' style='width:180px;' required onkeyup='this.setAttribute('value', this.value);' value=''><input type='time' name='p_intime"+cnt+"' style='width:100px;'><input type='button' value='X' style='WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px' onclick='delete_row(member.cnt.value)'></td>";
          cnt--;
      }

    }

    //Row 삭제
    function delete_row(cnt) {
      var my_tbody = document.getElementById('add_p_in');
      if (my_tbody.rows.length < 1) return;
      // my_tbody.deleteRow(0); // 상단부터 삭제
      my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
      
      member.cnt.value=my_tbody.rows.length+1;
      
    }


    </script>

	<section>	
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
	                  <input type="text" name="p_indate" id="datepicker1" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
	                  <label><font size="4">출발일자</font></label>
	                  <input type="time" name="p_intime" style="width:180px;" value="">
	                </div>

                  <div class="inputBox">
                        <input type="text" name="p_outdate" id="datepicker2" style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">도착일자</font></label>
                        <input type="time" name="p_outtime" style="width:180px;" value="">
                  </div>

                  <div class="inputBox" id="p_in">
                          <input type="text" name="p_in" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">탑승지</font></label>
                          <input type="hidden" name="cnt" value="2">
                          <input type="button" value="지역추가"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="add_row(member.cnt.value)">
                  </div>

                  <table>
                    <tbody id="add_p_in" class="inputBox">

                    </tbody>
                  </table>

                  <div class="inputBox">
                        <input type="text" name="p_out" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">목적지</font></label>
                  </div>

                  <div class="inputBox">
                        <input type="text" name="p_spot" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">관광지 탑승지</font></label>
                        <input type="time" name="p_spottime" style="width:180px;" value="">
                  </div>

                  <div class="inputBox">
                        <input type="text" name="p_stopover" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">하차지</font></label>
                        <input type="time" name="p_stoptime" style="width:180px;" value="">
                  </div>

                  <div class="inputBox">
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
                      <input type="checkbox" name="thema" value="해돋이여행">해돋이여행
                      <input type="checkbox" name="thema" value="단풍맞이여행">단풍맞이여행
                      <input type="checkbox" name="thema" value="사찰여행">사찰여행
                      <input type="checkbox" name="thema" value="축제여행">축제여행
                      <input type="checkbox" name="thema" value="겨울여행">겨울여행
                      <input type="checkbox" name="thema" value="여름휴가">여름휴가
                      <input type="checkbox" name="thema" value="꽃구경">꽃구경
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
    </section>      

        
</body>
</html>
