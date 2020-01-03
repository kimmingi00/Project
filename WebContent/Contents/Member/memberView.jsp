<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="Mind freaker stuff (Mindfreakerstuff.com) is a blog for Design inspiration, tutorials and latest mobile/Gadgets review . Learn Design Theory, Typography, Website Design, MS office Tips and latest android mobiles/apps more.">
<title>마이페이지</title>
  

<style type="text/css">


  .box {
    position: relative;
    top: 350px;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 36rem;
    padding: 2.5rem;
    box-sizing: border-box;
    border: 1px solid #dadce0;
    -webkit-border-radius: 8px;
    border-radius: 8px;

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
    left:150px;
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
    left: 20px;
    padding: 0.625rem 0;
    font-size: 1rem;
    color: grey;
    pointer-events: none;
    transition: 0.5s;
  }

  .box .inputBox input:focus ~ label,
  .box .inputBox input:valid ~ label,
  .box .inputBox input:not([value=""]) ~ label {
    top: -1.125rem;
    left: 10px;
    color: #363636;
    font-size: 0.75rem;
    background-color: white;
    height: 10px;
    padding-left: 5px;
    padding-right: 5px;
  }


 

  .onelogin{position:fixed; top:64%; left:740px;}

body {background-color:#f2f2f2;}


	 .btn {
   cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}
	
h1 {font-size: 3em; margin: 20px 0; color: #FFF;}
.container {position: relative; left:80px; top:50px; width: 800px; margin: 10px auto; position:relative; border-top-left-radius: 36px;	border-top-right-radius: 36px;	border-bottom-left-radius: 36px; border-bottom-right-radius: 36px; }
ul.tabs {margin: 0;	padding: 0;	float: left;list-style: none;	height: 48px;	width: 100%;}
ul.tabs li {width:350px; min-height: 50px; float: left;	margin: 0; padding: 0; height: 31px; line-height: 31px; border: 1px solid #999; border-left: none; background: #F0F0F0; overflow: hidden;}
ul.tabs li a {text-decoration: none; color: #000; display: block;	font-size: 1.2em; padding: 0 20px; outline: none; }
html ul.tabs li.active, html ul.tabs li.active a:hover  {background: #fff; border-bottom: 1px solid #fff;}
.tab_container {border-top: none; clear: both;  position:raletive; width: 702px; top:680px; height:680px; background: #fff;}
.tab_content {padding: 20px;}
.tab_content h3 a{color: #254588;}
.tab_content img {float: left;	margin: 0 20px 20px 0; padding: 5px;}



</style>

<script>
function cansel(){
  
  alert("메인페이지로 돌아갑니다.");
  location.href="/IndexServlet?command=index";
  
}

function send() {
  var pass = member.pass.value;

  if(member.name.value=="") {
    alert("이름은 필수 입력 사항입니다");
    member.name.focus();
    return;
  }


  else if(pass.length<6) {
    alert("비밀번호는 6자에서 12자 이내입니다");
    member.pass.focus();
    return;
 
  }
    else if(member.tel.value=="") {
    alert("전화번호를 입력해주세요 ");
    member.tel.focus();
    return;
  }

 
  alert("수정되었습니다 .");
  member.submit();

}
</script>



<div class="container">
    	<form name="member" method="post" action="/MemberServlet?command=member_view_pro">
<br><br><br>
    <div class="tab_container">

          <div class="box">
                  <center><font size="6">마이페이지</font></center>
                  <br>
                  
                  
                    <div class="inputBox">
                      <input type="text" name="name" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ vo.name }" readonly>
                      
                      <label><font size="4">성명</font></label>
                    </div>


                  <div class="inputBox" >
                    <input type="text" name="id" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ vo.id }" readonly>
                    <label><font size="4">아이디</font></label>
                   
                  </div>

                    <div class="inputBox">
                          <input type="password" name="pass"  style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">비밀번호</font></label>
                    </div>

                    

                    <div class="inputBox">
                          <input type="text" name="tel"  style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="${ vo.tel }">
                          <label><font size="4">전화번호</font></label>
                    </div>

                    <div class="inputBox"> 
                         <input type="text" name="email" id="str_email01" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="${ vo.email }">
                          <input type="hidden" name="email"value=""></input> 
                          <label><font size="4">이메일</font></label>
                          
                         
                    </div>

                    <div class="inputBox">
                    </div>
	
					<center>
                    <input type="submit" value="수정완료"   class="btn" onClick="javascript:send()"/>   
                    
                    <div class="btn">  
					<a href="/MemberServlet?command=member_shopping"><input type="button" class="btn" value="내 쇼핑목록" ></a>
					</div>   
					
					<div class="btn">
					<a href="/MemberServlet?command=member_delete"><input type="button" class="btn" value="회원탈퇴"></a>
                  	</div> 
                  	</center>
                
          </div>
      </div>
      </form>
      <br><br>
      

        

	
	
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});

});
</script>

</body>
<%@ include file="/Contents/include_file(navi bar)/footer.jsp" %>
</html>
