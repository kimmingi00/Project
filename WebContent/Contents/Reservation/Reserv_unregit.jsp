<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="controller.reserv.*" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<section>
		<form name="fm" method="post" action="/ReservServlet?command=Reserv_Unregit_pro&p_idx=${ pvo.p_idx }">
			<div class="box">
				<h1 style="color:black; float:none; 
				font-size:40px;
				line-height:100px; text-align:center;">비회원 예약</h1><br>
				<p>비회원은 다음과 같은 정보를 입력해주셔야 합니다</p>
				<div class="inputBox"> 
                         <input type="text" name="str_email01" id="str_email01" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">@
                          <input type="hidden" name="email"value=""></input> 
                          <label class="em_label"><font size="4">이메일</font></label>
                          <input type="text" name="str_email02" id="str_email02" style="width:140px;" disabled value="naver.com">
                          <select name="selectEmail" id="selectEmail">
  				                <option value="1">직접입력</option>
  				                <option value="naver.com" selected>naver.com</option>
  				                <option value="hanmail.net">hanmail.net</option>
  				                <option value="hotmail.com">daum.net</option>
  				                <option value="nate.com">nate.com</option>
  				                <option value="yahoo.co.kr">yahoo.co.kr</option>
  				                <option value="gmail.com">gmail.com</option>
  				          </select>      
                    </div>
					
                    <div class="inputBox">
                      <input type=button style="width:130px;" value="이메일 인증" onClick="emailcheck(fm.str_email01.value, fm.str_email02.value, fm.selectEmail.value)">
                    </div>
					<input type="hidden" name="email_check" value="0">
	            <div class="inputBox">
	                    <input type="text" name="ur_name" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
	                    <label><font size="4">이름</font></label>
	            </div>
	            <div class="inputBox">
	                    <input type="text" name="ur_tel" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
	                    <label><font size="4">전화번호</font></label>
	            </div>
	            <div class="inputBox">
	                    <input type="password" name="ur_pass" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
	                    <label><font size="4">비밀번호</font></label>
	            </div>
	        </div>
	        
	        <div class="cont_info">
	        	<h2 style="font-size:20px; margin-bottom:60px; margin-left:50px;">${ pvo.p_title }</h2>
	        	<c:if test="${pvo.p_title!=null }">
	        		<img src="${savePath }/${pvo.p_filename}" style="width:220px; height:140px; margin-bottom:60px;">
	        	</c:if>
	        	<c:if test="${pvo.p_title==null }" >
	        		<img src="${savePath }/no-image.png" style="width:220px; height:140px; margin-bottom:60px;">
	        	</c:if>
	        	<input type="hidden" name="reserv_cnt" value="${ reserv_cnt }">
	        	<p style="font-size:20px; margin-bottom:60px;">예약 인원 : ${ reserv_cnt }&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;${ reserv_cnt*pvo.p_price }원</p>
	        	<p><a href="javascript:send()"><input type="button" name="reserv" value="예약" class="btn" style="margin-left:70px;"></a></p>
	        </div>    
		</form>
		
	</section>
<style>
	
	section {background-color:#fff; font-color:black; margin-left: 290px; margin-top:7%;
        		width:1300px; height:720px; 
        		
        		
        		}
	
	p {margin-bottom:20px;}
	
	.cont_info {margin-left:66%; margin-top:-30%;}
	
	
	.btn {margin-bottom:20px; background-color:#07c; color:white; 
		border-color: #07c;
    	border-width: 1px;
    	border-style: solid;
    	font-size: 17px;
    	font-weight: 400;
    	text-align: center;
    	white-space: nowrap;
    	line-height: 1.17648;
	    min-width: 28px;
	    padding-left: 16px;
	    padding-right: 16px;
	    padding-top: 8px;
	    padding-bottom: 8px;
	    border-radius: 18px;
	    background: #0071e3;
		}
		

  .box {
    position: relative;
    top: 370px;
    left: 370px;
    transform: translate(-50%, -50%);
    width: 36rem;
    padding: 2.5rem;
    box-sizing: border-box;
    border-right: 1px solid #dadce0;
    -webkit-border-radius: 8px;
    border-radius: 8px;
    text-align:center;

  }



  .box h2 {
    margin: 0px 0 -0.125rem;
    padding: 0;
    color: #fff;
    text-align: center;
    color: #202124;
    font-family: 'Google Sans','Noto Sans Myanmar UI',arial,sans-serif;
    font-size: 24px;
    font-weight: 400;
  }

  .box p {
    font-size: 16px;
    font-weight: 400;
    letter-spacing: .1px;
    line-height: 1.5;
    margin-bottom: 25px;
    text-align: center;
  }

  .box .inputBox {
    position: relative;
  }

  .box .inputBox input {
    width: 73%;
    padding: 0.625rem 10px;
    font-size: 1rem;
    letter-spacing: 0.062rem;
    margin-bottom: 1.875rem;
    border: 1px solid #ccc;
    background: transparent;
    border-radius: 4px;

  }

  .box .thema {
    width: 73%;
    padding: 0.625rem 10px;
    font-size: 1rem;
    letter-spacing: 0.062rem;
    margin-bottom: 1.875rem;
    border: 1px solid #ccc;
    background: transparent;
    border-radius: 4px;
    height: 50px;
    padding-bottom: 10px;
}

  .box .inputBox label {
    position: absolute;
    top: 0;
    left: 160px;
    padding: 0.625rem 0;
    font-size: 1rem;
    color: grey;
    pointer-events: none;
    transition: 0.5s;
  }
  
   .box .inputBox .em_label {
    position: absolute;
    top: 0;
    left: 30px;
    padding: 0.625rem 0;
    font-size: 1rem;
    color: grey;
    pointer-events: none;
    transition: 0.5s;
  }
	
  .box .inputBox input:focus ~ .em_label,
  .box .inputBox input:valid ~ .em_label,
  .box .inputBox input:not([value=""]) ~ .em_label {
    top: -1.125rem;
    left: 20px;
    color: #363636;
    font-size: 0.75rem;
    background-color: white;
    height: 10px;
    padding-left: 5px;
    padding-right: 5px;
  }
	
	
  .box .inputBox input:focus ~ label,
  .box .inputBox input:valid ~ label,
  .box .inputBox input:not([value=""]) ~ label {
    top: -1.125rem;
    left: 150px;
    color: #363636;
    font-size: 0.75rem;
    background-color: white;
    height: 10px;
    padding-left: 5px;
    padding-right: 5px;
  }
  .box .inputBox input:focus {
    outline: none;
    border: 2px solid #363636;
  }
  .box input[type="submit"] {
    border: none;
    outline: none;
    color: #fff;
    background-color: #;
    padding: 0.625rem 1.25rem;
    cursor: pointer;
    border-radius: 0.312rem;
    font-size: 1rem;
    float: right;
  }

  .box input[type="submit"]:hover {
    background-color: #909090;
  }

  

	
</style>
<script>
	function send() {
		if(fm.str_email01.value=="") {
			alert("이메일을 입력해주세요");
			fm.ur_email.focus();
			return;
		}else if(fm.ur_name.value=="") {
			alert("이름을 입력해주세요");
			fm.ur_name.focus();
			return;
		}else if(fm.ur_tel.value=="") {
			alert("전화번호를 입력해주세요");
			fm.ur_tel.focus();
			return;
		}else if(fm.ur_pass.value=="") {
			alert("비밀번호를 입력해주세요");
			fm.ur_pass.focus();
			return;
		}else if(fm.email_check.value=="0") {
			  alert("이메일 인증을 실시해주세요");
			  return;
		}
		
		fm.submit();
	}
	
	function emailcheck(str_email01, str_email02, selectEmail){
		  if(fm.str_email01.value==""){
		    alert("이메일을 입력해주세요");
		    fm.str_email01.focus();
		    return;
		  }
		  var email="";
		  var exptext= /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		  if(fm.selectEmail.value==1){
		    if(exptext.test(str_email02)==false){
		      alert("형식 오류");
		      return;
		    }else{
		      email=str_email01+"@"+str_email02;
		    }
		  }else{
		    email=str_email01+"@"+selectEmail;
		  }
		  url = "/UnregitServlet?command=unregit_emailcheck&email="+email;
		  window.open(url, "email 인증", "width=450 height=350");
		}
</script>


</body>





</html>