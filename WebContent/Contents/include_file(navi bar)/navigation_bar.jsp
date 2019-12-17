<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<link href="cssfile.css" media="screen and (min-width: 1080px) and (max-width: 1920px)" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
	<link rel="stylesheet" type="text/css" href="/Contents/CSS/CSS_Index/hsilder(navi).css">
	

	
	
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




</style>
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
</head>
<body>	
	<header>
		<div class = "nav">
				<nav>
						<ul class ="logo">
							<li><font size="6"><a href="/Contents/index.jsp"> LOGO</font></a> </li>
						</ul>
					<ul class="menu">
						<li><a href="#"><font size="4">여행상품 둘러보기 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="/Contents/Reservation/R_Business/upload_main.jsp"><font size="4">사업자 상품등록 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="###"><font size="4">공지사항 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="####"><font size="4">문의하기 </font>&nbsp; &nbsp; &nbsp;</a></li>
					</ul>
				</nav>
		</div>

		<div class = "login">
			<a href="###.jsp">
				<div class="menubar">
      		<li><a href="#" id="current"><img src="/Contents/img/index_img/login.png"></a>
         		<ul>
           		<li><a href="/Contents/Member/login.jsp">로그인</a></li>
		          <li><a href="/Contents/Member/confirm.jsp">회원가입</a></li>
         		</ul>

      		</li>
					<img src="/Contents/img/index_img/message.png">
				</div>
			</a>
		</div>
	</header>

