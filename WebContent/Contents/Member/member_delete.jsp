<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp"%>

  <meta charset="utf-8">
  <title>약관동의</title>

   <style type="text/css">
        #d1{
          width:870px;
          margin:0 auto;
        }
        
     body{background-color:#f2f2f2;
	}
	
   .container {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top:180px; width:60%; height: 530px; border: 24px solid #ffffff;
      background-color: #FFFFFF; overflow: auto;margin-left: 20%;}

       .alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";

    }

            .btn {
   cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}
      

    </style>


<div class="container" style="margin-bottom:300px;">
		<div class="alert">
<form action="/MemberServlet?command=member_delete_pro" method="post" id="form1">
<div id="d1">
 <font size="6">
 <br>
 <h2 align="center">회원탈퇴</h2>
 <br>
</font>

  <tr>
 

       <center>
          <textarea readonly="readonly" rows="15" cols="66">
사용하고 계신 아이디(${ user.id })는 탈퇴할 경우 재사용 및 복구가 불가능합니다.

탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.

탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.

탈퇴 후에는 아이디 ${ user.id }로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.

게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
		
			
    </textarea>
     
           
      
       <center>
       <br>
		<font size="4">
          	회원탈퇴를 동의하시면 클릭해주세요
       </font><input type="checkbox" name="c1" id="c1" style="width:20px;height:20px;"></a></h3>
          
      </center>
   
 </div>
 <center>
						
						<div class="bg-contents contents-table type02" text-align="center">
							
							<input type="hidden" name="id" value="${ user.id }">
							<input type="hidden" name="pass" value="${ user.pass }">
						
							<table cellspacing="0" class="request member-info" >
								
								
								<tbody>
									<center>
								<br>
							<table>
								<tr>
									<td style="text-align:left"><font size="3">아 이 디 &nbsp;&nbsp;: &nbsp;${ user.id }</font></td>
								</tr>
								<td></td>
								<tr>
									<td><font size="3">비밀번호 : &nbsp;<input type="password" class="medium" id="checkPW" name="checkPW" title="비밀번호를 입력하세요" style="width:120px" /></font></td>
								</tr>
							</table>
							</center>
									
								</tbody>
							</table>
							</center>

<br><br>
 <div align="center">
  <input type="submit" value="회원탈퇴"  class="btn" >
 </div>
   <br>
</div>
	</div>
</div>
</form>

<script>
   var doc = document;
   var form1 = doc.getElementById('form1');
   var inputs = form1.getElementsByTagName('INPUT');
   var form1_data = {
      "c1": false,
      
   }; // 창에 새로 들어왔을때 체크박스 3개는 무조건 false
   var c1 = doc.getElementById('c1');
  
   function checkboxListener() {
      form1_data[this.name] = this.checked;
      if(this.checked) {
         // submit 할때 체크하지 않아 색이 변한 font 를 다시 원래 색으로 바꾸는 부분.
         this.parentNode.style.color = "#000";
      }
   }
   function setCheckbox(obj, state) {
       for (var x in obj) {
          obj[x] = state;
          for(var i = 0; i < inputs.length; i++) {
             if(inputs[i].type == "checkbox") {
                inputs[i].checked = state;
             }
          }
       }
    }
   c1.onclick  = checkboxListener;
   
   c1.onclick = function() {
      if (this.checked) {
         setCheckbox(form1_data, true);
      } else {
         setCheckbox(form1_data, false);
      }
   };
      

   form1.onsubmit = function(e) {
      e.preventDefault(); // 서브밋 될때 화면이 깜빡이지 않게 방지
      if ( !form1_data['c1'] ) {
         alert('회원탈퇴를 하시려면 동의를 해주세요.');
         c1.parentNode.style.color = 'red';
         	return false;
      }
      
      this.submit();
   };
   
</script>




</body>
<%@ include file="/Contents/include_file(navi bar)/footer.jsp"%>
</html>