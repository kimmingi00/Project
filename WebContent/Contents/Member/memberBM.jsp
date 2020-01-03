<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>


<meta charset="UTF-8">
<title>본인확인 </title>
<script>
function send(){
	var pass=mfm.pass.value;
		if(mfm.checkPW.value==""){
			alert("내 정보를 확인하려면 비밀번호를 입력해주세요.");
			return;
		}
		
		
		alert("인증되었습니다.");
		mfm.submit();
	}
function before(){
	alert("메인페이지로 돌아갑니다.");
	location.href="/IndexServlet?command=index";
}
	

    </script>




<div class="container" style="margin-bottom:300px;">
		<div class="alert">
		<br><br><br><br>
						<center>
						<font size ="4"><p>회원님의 <span>회원정보 확인</span>을 위해 비밀번호를 한번 더 입력해 주세요.</p></font>
						</center>
						<br>
					<ul>
						<center>
						<font size ="3"><li>비밀번호가 타인에게 노출되지 않도록 주의하시기 바랍니다.</li><br>
						<li>비밀번호에는 개인정보를 포함하거나 아이디를 포함한 </li>
						<li>비밀번호, 집전화, 휴대폰 번호 , 영문 성명 등 타인이 유추할 수 있는 비밀번호는 사용 하지 않는 것이 좋습니다.</li>
						</font>
						</center>
					</ul>
				</div>

					<br>
				
					<div style="text-align:center">
						<form name="mfm" method="post" action="MemberServlet?command=member_bm_pro" style="display:inline">
						<font size ="4"><h3>회원 정보</h3></font>
						<br>				
						<font size ="3">
						<ul>
						
							<li><input type="hidden" name="id" value="${ user.id }"></li>
							<li><input type="hidden" name="pass" value="${ user.pass }"></li>
						</ul>
							<center>
							<table>
								<tr>
									<td style="text-align:left">아 이 디 &nbsp;&nbsp;: &nbsp;${ user.id }</td>
								</tr>
								<tr>
									<td>비밀번호 : &nbsp;<input type="password" class="medium" id="checkPW" name="checkPW" title="비밀번호를 입력하세요" style="width:120px" /></td>
								</tr>
							</table>
							</center>
						</font>		
									
						</font>
							</form>
						</div>
				<br><br><br><br>
					<div style="text-align:center">
					<input type="submit" value="확인" title="확인" class="btn" onClick="javascript:send()"/>
					<input type="submit" value="취소" title="취소" class="btn" onClick="javascritpt:before()"/>
					</div>
		
				</div>
</div>
		
				
				
				
	


   

 
<style>
	body{background-color:#f2f2f2;
	}
   .container {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top:180px; width:60%; height: 450px; border: 24px solid #ffffff;
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
				
</body>
<%@ include file="/Contents/include_file(navi bar)/footer.jsp" %>

</html>