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
      if(member.place.value==0){
          alert("지역을 선택해주세요");
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
	
    function add_file(fcnt) {
        var my_tbody = document.getElementById('plus_file');
        // var row = my_tbody.insertRow(0); // 상단에 추가
        var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
       
        if(my_tbody.rows.length > 4){
          alert("파일은 최대 5개까지 입니다");
          member.p_file.focus();
          return;
        }else {
             fcnt++;
           cell1.innerHTML = "<td><input type='file' id='p_filename"+fcnt+"' name='p_filename"+fcnt+"' style='width:180px;' required onkeyup='this.setAttribute('value', this.value);' value=''><input type='button' value='X' id='p_button"+fcnt+"' name='p_button' style='WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px' onclick='delete_filerow("+fcnt+")'></td>";
            member.fcnt.value=fcnt;
        }

      }
      //Row 삭제
      function delete_filerow(fcnt) {
        var my_tbody = document.getElementById('plus_file');
        if (my_tbody.rows.length < 1) return;
        // my_tbody.deleteRow(0); // 상단부터 삭제
        $("#p_filename"+fcnt).remove();// 삭제
        $("#p_button"+fcnt).remove();
      }
      


    </script>

	<section style="margin-top:26%;">	
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

	              <div class="inputBox">
                  	<span><font size="4">출발지 지역</font></span>
                  	<br><br>
                  	<select name="place" style="height:30px;">
                  		<option value="0">지역 선택</option>
                  		<option value="1">서울/경기/인천</option>
                  		<option value="2">강원도</option>
                  		<option value="3">대전/충청남도/충청북도</option>
                  		<option value="4">광주/전라남도/전라북도</option>
                  		<option value="5">부산/대구/경상남도/경상북도</option>
                  	</select>
                  
                  </div>
	              
	              <div class="inputBox" id="p_in">
                          <input type="text" name="p_in" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">탑승지</font></label>
                          <input type="text" name="cnt" value="2">
                          <input type="button" value="지역추가"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="add_row(member.cnt.value)">
                  </div>

                  <table>
                    <tbody id="add_p_in" class="inputBox">

                    </tbody>
                  </table>
	              
	              <div class="inputBox" >
	                  <input type="text" name="p_indate" id="datepicker1" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
	                  <label><font size="4">출발일자</font></label>
	                  <input type="time" name="p_intime" style="width:180px;" value="">
	              </div>
	              
	              <div class="inputBox">
                  	<span><font size="4">도착지 지역</font></span>
                  	<br><br>
                  	<select name="outplace" style="height:30px;">
                  		<option value="0">지역 선택</option>
                  		<option value="1">서울/경기/인천</option>
                  		<option value="2">강원도</option>
                  		<option value="3">대전/충청남도/충청북도</option>
                  		<option value="4">광주/전라남도/전라북도</option>
                  		<option value="5">부산/대구/경상남도/경상북도</option>
                  	</select>
                  
                  </div>
	              
	               <div class="inputBox">
                        <input type="text" name="p_out" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">목적지</font></label>
                  </div>

                  <div class="inputBox">
                        <input type="text" name="p_outdate" id="datepicker2" style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">도착일자</font></label>
                        <input type="time" name="p_outtime" style="width:180px;" value="">
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
                    <span><font size="4">옵션</font></span><br>
                    <span style="margin:60px;"><input type="checkbox" name="thema" value="1">식사여부</span>
                  </div>
                  
                  
                  
                 
                     <div class="inputBox" id="p_file">
                        <input type="file" name="p_filename" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <input type="button" name="0" value="파일추가"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="add_file(member.fcnt.value)">
                        <input type="text" name="fcnt" value="0">
                  </div>
                  
         <table id="plus_file" class="inputBox">
                    <tbody>
                    </tbody>
            </table>
                 


                  <input type="button" value="등록"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" onclick="send();">
                  <input type="reset" value="다시쓰기"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" >

                </form>
        </div>
    </section>      

        
</body>
</html>
