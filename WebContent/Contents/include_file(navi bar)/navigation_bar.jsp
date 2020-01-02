<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<link href="cssfile.css" media="screen and (min-width: 1080px) and (max-width: 1920px)" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="/Contents/CSS/CSS_Index/hsilder(navi).css">
	<link rel="stylesheet" href="/Contents/font_awesome/css/font-awesome.min.css">

	
	
	<style type="text/css" media="screen and (min-width: 1080px) and (max-width:1920px)">
 
	*{margin: 0; padding: 0;}
	li{list-style: none;}
	a{text-decoration: none;}

	.navi_article{width:1200px; margin: 0 auto;}
	.clearfix{content:''; display: block; clear:both;}

	.header{height: 75px; background-color: #242424; border:1px solid #white;
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

</head>
<body>	
	<span class ="header">
		<div class = "navi_article">
				<span>
						<ul class ="logo">
							<li><font size="6"><a href="/IndexServlet?command=index"> LOGO</font></a> </li>
						</ul>
					<ul class="menu">
						<li><a href="/ReservServlet?command=reserv_main&row=0&place=0&outplace=0"><font size="4">여행상품 둘러보기 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="/ReservServlet?command=upload_main"><font size="4">사업자 상품등록 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="/BoardServlet?command=board_notice"><font size="4">공지사항 </font>&nbsp; &nbsp; &nbsp;</a></li>
						<li><a href="/BoardServlet?command=board_qna"><font size="4">문의하기 </font>&nbsp; &nbsp; &nbsp;</a></li>
					</ul>
				</span>
		</div>

		<div class = "login">
				<div class="menubar">
      		<li style="color:white; margin-top:11px;">
      			<c:if test="${!empty user }">${ user.name }님</c:if>
      			<c:if test="${!empty b_user }">${ b_user.b_name }님</c:if>
      		</li>
      		<li>
      			
      			<a href="#" id="current"><img src="/Contents/img/index_img/login.png"></a>
      			
         		<ul>
         		<c:if test="${empty user&&empty b_user }">
           			<li><a href="/MemberServlet?command=member_login" style="color:white;">로그인</a></li>
		        	<li><a href="/MemberServlet?command=member_confirm" style="color:white;">회원가입</a></li>
		        </c:if>
		        <c:if test="${!empty user||!empty b_user }">
           			<li><a href="/MemberServlet?command=member_logout" style="color:white;">로그아웃</a></li>
		          	<li><a href="#" style="color:white;">회원정보</a></li>
		         </c:if> 
         		</ul>

      		</li>
      			<c:if test="${!empty user }">
					<a href="/MessageServlet?command=MyMsgList&id=${ user.id }&user_num=1" style="color:white;"><img src="/Contents/img/index_img/message.png"></a>
				</c:if>
				<c:if test="${!empty b_user }">
					<a href="/MessageServlet?command=MyMsgList&id=${ b_user.b_id }&user_num=2" style="color:white;"><img src="/Contents/img/index_img/message.png"></a>
				</c:if>
				</div>
			</a>
		</div>
	</span>

