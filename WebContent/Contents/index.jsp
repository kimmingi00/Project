<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<link href="cssfile.css" media="screen and (min-width: 1080px) and (max-width: 1920px)" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
	<link rel="stylesheet" type="text/css" href="CSS/CSS_Index/reset.css">
	<link rel="stylesheet" type="text/css" href="CSS/CSS_Index/hsilder.css">
	<link rel="stylesheet" type="text/css" href="CSS/CSS_Index/default-style.css">
	<link rel="stylesheet" type="text/css" href="CSS/CSS_Index/popup.css">
	<script type="text/javascript" src="Index/index_js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="Index/index_js/jquery.HSlider.min.js"></script>


	<style type="text/css" media="screen and (min-width: 1080px) and (max-width:1920px)">

	*{margin: 0; padding: 0;}
	li{list-style: none;}
	a{text-decoration: none;}

	.nav{width:1200px; margin: 0 auto;}
	.clearfix{content:''; display: block; clear:both;}

	header{height: 75px; background-color: #242424; border:1px solid #white;
					position:fixed; width:100%; z-index: 9999; top:0; left:0;}
	h1{color:white; line-height: 150px; float: left;}

	.logo {float:left;}
	.logo li{float:left;}
	.logo a{line-height: 75px; right:75px; color:white; padding:0 15px; display: block;}
	.login{float:right; position:fixed; top:15px; right:75px;  display: block;}

	.menu {float:right;}
	.menu li{float:left;}
	.menu a{line-height: 75px; right:75px; color:white; padding:0 15px; display: block;}

	.menubar{border:none; border:0px; margin:0px;	padding:0px;}
	.menubar ul{list-style:none; margin:0; padding:0;}
	.menubar li{float:left;	padding:0px;}
	.menubar li a{display:block; font-weight:normal; line-height:40px; margin:0px; padding:0px 25px; text-align:center; text-decoration:none;}
	.menubar li a:hover, .menubar ul li:hover a{color:#FFFFFF;text-decoration:none;}
	.menubar li ul{background: rgb(109,109,109); display:none; height:auto; padding:0px; margin:0px;	border:0px;	position:absolute; width:150px;	z-index:200;}
	/* 평상시에는 드랍메뉴가 안보이게 하기 */

	.menubar li:hover ul{display:block;} /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
	.menubar li li {background: rgb(109,109,109); display:block; float:none; margin:0px; padding:0px; width:150px;}
	.menubar li:hover li a{background:none;}
	.menubar li ul a{display:block;	height:40px; font-size:12px; font-style:normal; margin:0px; padding:0px 10px 0px 15px; text-align:left;}
	.menubar li ul a:hover, .menubar li ul li:hover a{background: rgb(71,71,71); border:0px; color:#ffffff; text-decoration:none;}
	.menubar p{clear:left;}

	#button{ position:relative; border-top-left-radius: 8px;	border-top-right-radius: 8px;	border-bottom-left-radius: 8px;	border-bottom-right-radius: 8px;	margin-right:-4px;}
	#btn_group button{border: 1px solid skyblue; background-color: rgba(0,0,0,0); color: skyblue; padding:5px; z-index: 1; position: relative;}
  #btn_group button:hover{color:black; background-color: skyblue;}

	#button1{border-top-left-radius: 8px;	border-top-right-radius: 8px;	border-bottom-left-radius: 8px;	border-bottom-right-radius: 8px;	margin-right:-4px;}
	#btn_group1 button{border: 1px solid white; background-color: rgba(0,0,0,0); color: white; padding:5px;}
	#btn_group1 button:hover{color:black; background-color: white;}

	
</style>

</head>
<body>

	<header>
		<div class = "nav">
				<nav>
						<ul class ="logo">
							<li><font size="6"><a href="#"> LOGO</font></a> </li>
						</ul>
					<ul class="menu">
						<li><a href="#"><font size="4">여행상품 둘러보기 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="##"><font size="4">사업자 상품등록 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="###"><font size="4">공지사항 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="####"><font size="4">문의하기 </font>&nbsp; &nbsp; &nbsp;</a></li>
					</ul>
				</nav>
		</div>

		<div class = "login">
			<a href="###.jsp">
				<div class="menubar">
      		<li><a href="#" id="current"><img src="img/index_img/login.png"></a>
         		<ul>
           		<li><a href="login.jsp">로그인</a></li>
		          <li><a href="signup.jsp">회원가입</a></li>
         		</ul>

      		</li>
					<img src="img/index_img/message.png">
				</div>
			</a>
		</div>
	</header>

	<div class="wrap">
		<div class="slider">
			<section>
				<article>
					<font size="6"><p>  &nbsp; 여행의 시작</p></font>
					<br>
					<font size="5"><p>  &nbsp; 모든 여행의 시작과 마무리는 여러 교통수단이 사용됩니다.</p></font>
					<br>
					<font size="5"><p>  &nbsp; 대표적인 수단중 하나가 고속버스 관광이죠.</p></font>
					<br>
					<font size="5"><p>  &nbsp; 저희와 함께하는 기분 좋은 여행을 시작해볼까요?</p></font>
					<br><br>
					<div id = "btn_group">
						<a href="javascript:void(0)" class="btn">
					 &nbsp;  &nbsp; <button id = "button" ><font size="4"> &nbsp;
						 더 알아보기 >
					 &nbsp; </font></button></label> &nbsp; &nbsp; &nbsp; &nbsp;
						 </a>
				 </div>

				 <div class="modal">
					 <p class="modal_content">
						 <a href="javascript:void(0)" class="btn_close">
						 <B><FONT size=5><br>  &nbsp; &nbsp; X</FONT></B>
					 	</a>
						<br><br><br><br>
							<B> <font size="5"> &nbsp; &nbsp;  &nbsp;안녕하세요. JSL 38기 D조입니다.<br> </font></B>
							<B> <font size="4"><br> &nbsp; &nbsp;  &nbsp; &nbsp; 팀장 = 김민기 <br></font></B>
							<B> <font size="4"><br>&nbsp; &nbsp;  &nbsp; &nbsp;  팀원 = 장재희 이하균 안준혁 이예리 </font></B>
					 </p>
				 </div>

					</article>
				<img src="img/index_img/1.jpg" >
			</section>



			<section>
				<article class="left">
					<center>
					<div id = "btn_group">
						<button id = "button"><font size="4">&nbsp;  여행상품 둘러보기 >  &nbsp; </font></button>
					</div>
						<br><br><br><br><br><br>
					<font size="6"><p> 세상에서 가장 빛날 여행의 첫걸음 </p></font>
					<br>
					<font size="5"><p> 지금 바로 여러 관광상품을 둘러볼 수 있습니다. </p></font>
					<br>
					<font size="5"><p> 쉽고 간편하게 예매를 해보세요.</p></font>
					<br>
					<font size="5"><p> 물론 계정이 없더라도 서비스 이용이 가능하답니다.</p></font>
					</center>
				</article>
				<img src="img/index_img/2.jpg" >
			</section>


			<section>
				<article class="right">
					<center>
						<br><br><br><br>
					<font size="6"><p> 운송사업의 신개념</p></font>
					<br>
					<font size="5"><p> 사업자분들의 수익창출을 위한 서비스가 마련되어있습니다.</p></font>
					<br>
					<font size="5"><p> 여러분들의 빛나는 서비스를 이곳에서 맘껏 뽐내보세요.</p></font>
					<br>
					<font size="5"><p> 소중한 관광상품은 여행자분들이 즉시 바로 확인할 수 있습니다.</p></font>
					<br><br><br>
					<div id = "btn_group1">
						<button id = "button1"><font size="4">&nbsp; 관광상품 등록하기 >  &nbsp; </font></button>
					</div>
					</center>
				</article>
				<img src="img/index_img/3.jpg" >
			</section>


		</div>
	</div>

 <script src="js/jquery-1.11.0.min.js"></script>
	<script>
	$(document).ready(function() {
  $(".btn").click(function() {
    $(".modal").fadeIn();
  });
  $(".btn_close").click(function() {
    $(".modal").fadeOut();
  });
});
	</script>

	<script type="text/javascript">
		$(".slider").HSlider({
			easing: 'ease',
			animationTime: '400',
			pagination: true
		});
	</script>
</body>
</html>
