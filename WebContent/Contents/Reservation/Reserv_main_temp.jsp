<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %>

    <link href="/Contents/CSS/CSS_Reservation/product_css/menustyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/Contents/CSS/CSS_Reservation/product_css/slide.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="/Contents/Index/product_js/slide.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/Contents/Index/video_js/jquery.vide.js"></script>


    <style>
    body{background-color: #f2f2f2}
    div{display:none;}

    .block{position: fixed; z-index: 1000; }
    .video_text{position:absolute; color: #ffffff; top:150px; left:500px; font-size: 72px; z-index: 1001;}

    h3 {display: block; font-size: 1.2em; margin-block-start: 0.33em; margin-block-end: 0.33em; margin-inline-start: 0px; margin-inline-end: 0px; font-weight: bold;}

    .hoverEffect { float:left; position:relative; width: 270px; height:260px; margin:10px; overflow:hidden; }
    .hoverEffect .image { display:block; opacity:1; position:relative; transform:scale(1.2); transition:0.5s ease; }
    .hoverEffect:hover>.image { transform:scale(1); filter: blur(5px); opacity:0.3; }
    .hoverEffect .txt {color:black; font-size:20px; top:50%; left:50%; text-align:center; line-height:20px; position:absolute; top:0; left:0; height:100%; width: 100%; background:rgba(195,193,149,0); opacity:0; overflow:hidden; transform:scale(2); transition:0.3s ease; }
    .hoverEffect:hover .txt { background:rgba(255,255,255,0.8); transform:scale(1); opacity:1; }
    .hoverEffect .txt h3 { font-size:30px; margin:120px 0 10px 0; }

    .hoverEffect_good { float:left; position:relative; width: 950px; height:370px; margin:10px; overflow:hidden; }
    .hoverEffect_good .image { display:block; opacity:1; position:relative; transform:scale(1.2); transition:0.5s ease; }
    .hoverEffect_good:hover>.image { transform:scale(1); filter: blur(5px); opacity:0.3; }
    .hoverEffect_good .txt {color:black; font-size:20px; top:50%; left:50%; text-align:center; line-height:20px; position:absolute; top:0; left:0; height:100%; width: 100%; background:rgba(195,193,149,0); opacity:0; overflow:hidden; transform:scale(2); transition:0.3s ease; }
    .hoverEffect_good:hover .txt { background:rgba(255,255,255,0.8); transform:scale(1); opacity:1; }
    .hoverEffect_good .txt h3 { font-size:30px; margin:120px 0 10px 0; }

    .nav{position:fixed; left:30px; top:120px; z-index: 999;}

    .scroll_up{position:fixed; right:60px; top:350px;  line-height: 1.17648; min-width: 38px; background: #000000;
    padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; z-index: 999;}

    .infomation{position:relative; left:610px; font-size: 42px; line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";}

    .goodproduct{ position:relative; left:390px; width:900px; background-color: #ffffff;
    padding-top: 40px; padding-bottom: 40px;  height: 100%; width:1000px;  margin: 0 2.08333% 2.08333%;}

    .product_table{background-color:#ffffff; width:60%; margin:auto; }
    .product_table {background-color:#ffffff; border-collapse: collapse; }
    .product_table td {background-color:#ffffff; color: #000000; text-align: center; font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif"; font-weight: 600; }

    .content_add{position:relative; left:870px; line-height: 1.17648; min-width: 38px; background: #0071e3;
    padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px; border-radius: 18px;}
	.slide_btn {display:none;}
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
   $(function(){

  var vi = 630;
  $(window).scroll(function(){
     var num = $(window).scrollTop();
             if( num > vi ){
                  $(".nav").show(300);
             }else{
                  $(".nav").hide(300);
            }
   });

  });
   </script>

   <script type="text/javascript">
   $(function(){

  var vi = 630;
  $(window).scroll(function(){
     var num = $(window).scrollTop();
             if( num > vi ){
                  $(".scroll_up").fadeIn(300);
             }else{
                  $(".scroll_up").fadeOut(300);
            }
   });

  });
   </script>

 
  <div id="block" style="width: 100%; height: 600px;" data-vide-bg="/Contents/Index/video/ocean" data-vide-options="position: 0% 50%"></div>

          <div class="video_text">
              <h3>당신의 추억,</h2>
              <h3>여기 관광에서</h2>
              <h3>만들다.</h2>
          </div>

          <header role="banner">
            <nav class="nav" role="navigation">
              <ul class="nav__list">
                <li>
                  <input id="group-1" type="checkbox" hidden />
                  <label for="group-1"><span class="fa fa-angle-right"></span> 탑승지 </label>
                  <ul class="group-list">
                    <li><a href="#">서울 / 경기 / 인천</a></li>
                    <li><a href="#">강원도</a></li>
                    <li><a href="#">대전 / 충청남도 / 충청북도</a></li>
                    <li><a href="#">광주 / 전라남도 / 전라북도</a></li>
                    <li><a href="#">부산 / 대구 / 경상남도 / 경상북도</a></li>
                    </li>
                  </ul>
                </li>

                <li>
                <input id="group-2" type="checkbox" hidden />
                <label for="group-2"><span class="fa fa-angle-right"></span> 도착지</label>
                <ul class="group-list">
                  <li>
                    <li><a href="#">서울 / 경기 / 인천</a></li>
                    <li><a href="#">강원도</a></li>
                    <li><a href="#">대전 / 충청남도 / 충청북도</a></li>
                    <li><a href="#">광주 / 전라남도 / 전라북도</a></li>
                    <li><a href="#">부산 / 대구 / 경상남도 / 경상북도</a></li>
                  </li>
                </ul>

                </li>
                <li>
                <input id="group-3" type="checkbox" hidden />
                <label for="group-3"><span class="fa fa-angle-right"></span> 테마</label>
                <ul class="group-list">
                  <li>
                  <li><a href="#">봄 테마</a></li>
                  <li><a href="#">여름 테마</a></li>
                  <li><a href="#">가을 테마</a></li>
                  <input id="sub-group-3" type="checkbox" hidden />

                  </li>
                </ul>
                </li>

              </ul>
            </nav>
          </header>

<a style="display:scroll;" href="#">
        <div class="scroll_up">
          <font color="white">TOP ▲</font>
        </div>
</a>

<span class="infomation">
  ※ 상품은 평점순으로 나열됩니다. ※
</span>

<br><br><br><br><br><br>

<div class="goodproduct">

        <div class="slide">
        <ul class="slide_ul">
            <li>
              <section class="hoverEffect_good">
                    <img class="slide-image" src="product_img/1.png" width="250" height="350" alt="" style="border: 5px solid #000000; width:900px; ">
                <a href="####">
                    <div class="txt"><h3>평점 1위<br><br>한라산</h3>예약인원수20/25<br>가격 20,000원<br>★★★★★</div>
                </a>
                </section>
            </li>

            <li>
              <section class="hoverEffect_good">
                    <img class="slide-image" src="product_img/2.png" width="250" height="350" alt="" style="border: 5px solid #000000; width:900px;">
                <a href="####">
                    <div class="txt"><h3>평점 2위<br><br>백두산</h3>예약인원수20/25<br>가격 30,000원<br>★★★★★</div>
                </a>
                </section>
            </li>

            <li>
              <section class="hoverEffect_good">
                    <img class="slide-image" src="product_img/3.png" width="250" height="350" alt="" style="border: 5px solid #000000; width:900px;">
                <a href="####">
                    <div class="txt"><h3>평점 3위<br><br>히말라야</h3>예약인원수20/25<br>가격 40,000원<br>★★★★★</div>
                </a>
                </section>
            </li>
        </ul>
      </div>

</div>

<div class = "product_table">
  <tr><td colspan="4"><br></td></tr>
  <table>
          <tr>
            <td>

              <section class="hoverEffect">
              	<img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>지리산</h3>예약인원수20/25<br>가격 20,000원<br>★★★★★</div>
                </a>
              </section>
            </td>
			
            <td>
              <section class="hoverEffect">
              	<img style="border: 5px solid #000000; width:249px;"
                src="product_img/5.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>부산</h3>예약인원수17/25<br>가격 20,000원<br>★★★★★</div>
                </a>
              </section>
            </td>

            <td>
              <section class="hoverEffect">
              	<img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>서울</h3>예약인원수23/25<br>가격 20,000원<br>★★★★★</div>
              </a>
              </section>
            </td>

            <td height="30">
              <section class="hoverEffect">
              	<img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>치악산</h3>예약인원수10/25<br>가격 20,000원<br>★★★★★</div>
              </a>
              </section>
            </td>
          </tr>

          <tr>
            <td><font size = "4">
                      <p><center>도착지:지리산 </p>
                      <p> 예약인원수 : 20/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:부산 </p>
                      <p> 예약인원수 : 17/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:서울 </p>
                      <p> 예약인원수 : 23/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:치악산 </p>
                      <p> 예약인원수 : 10/25 </center></font></p>
            </td>
          </tr>
          </table>



          <table>
            <tr><td colspan="4"><br></td></tr>

          <tr>
            <td>
              <section class="hoverEffect">
                <img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
                <div class="txt"><h3>지리산</h3>예약인원수20/25<br>가격 20,000원<br>★★★★★</div>
                </a>
              </section>
            </td>

            <td>
              <section class="hoverEffect">
                <img style="border: 5px solid #000000; width:249px;"
                src="product_img/5.jpg" width="350" height="240"/>
                <a href = "###">
                <div class="txt"><h3>부산</h3>예약인원수17/25<br>가격 20,000원<br>★★★★★</div>
                </a>
              </section>
            </td>

            <td>
              <section class="hoverEffect">
                <img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
                <div class="txt"><h3>서울</h3>예약인원수23/25<br>가격 20,000원<br>★★★★★</div>
              </a>
              </section>
            </td>

            <td height="30">
              <section class="hoverEffect">
                <img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
                <div class="txt"><h3>치악산</h3>예약인원수10/25<br>가격 20,000원<br>★★★★★</div>
              </a>
              </section>
            </td>
          </tr>

          <tr>
            <td><font size = "4">
                      <p><center>도착지:지리산 </p>
                      <p> 예약인원수 : 20/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:부산 </p>
                      <p> 예약인원수 : 17/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:서울 </p>
                      <p> 예약인원수 : 23/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:치악산 </p>
                      <p> 예약인원수 : 10/25 </center></font></p>
            </td>
          </tr>
          <tr><td colspan="4"><br></td></tr>
          </table>
</div>

<br><br>

<div class = "product_table">
  <table>
    <tr><td colspan="4"><br></td></tr>
          <tr>
            <td>
              <section class="hoverEffect">
              	<img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>지리산</h3>예약인원수20/25<br>가격 20,000원<br>★★★★★</div>
                </a>
              </section>
            </td>

            <td>
              <section class="hoverEffect">
              	<img style="border: 5px solid #000000; width:249px;"
                src="product_img/5.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>부산</h3>예약인원수17/25<br>가격 20,000원<br>★★★★★</div>
                </a>
              </section>
            </td>

            <td>
              <section class="hoverEffect">
              	<img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>서울</h3>예약인원수23/25<br>가격 20,000원<br>★★★★★</div>
              </a>
              </section>
            </td>

            <td height="30">
              <section class="hoverEffect">
              	<img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
              	<div class="txt"><h3>치악산</h3>예약인원수10/25<br>가격 20,000원<br>★★★★★</div>
              </a>
              </section>
            </td>
          </tr>

          <tr>
            <td><font size = "4">
                      <p><center>도착지:지리산 </p>
                      <p> 예약인원수 : 20/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:부산 </p>
                      <p> 예약인원수 : 17/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:서울 </p>
                      <p> 예약인원수 : 23/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:치악산 </p>
                      <p> 예약인원수 : 10/25 </center></font></p>
            </td>
          </tr>
          </table>



          <table>
            <tr><td colspan="4"><br></td></tr>
          <tr>
            <td>
              <section class="hoverEffect">
                <img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
                <div class="txt"><h3>지리산</h3>예약인원수20/25<br>가격 20,000원<br>★★★★★</div>
                </a>
              </section>
            </td>

            <td>
              <section class="hoverEffect">
                <img style="border: 5px solid #000000; width:249px;"
                src="product_img/5.jpg" width="350" height="240"/>
                <a href = "###">
                <div class="txt"><h3>부산</h3>예약인원수17/25<br>가격 20,000원<br>★★★★★</div>
                </a>
              </section>
            </td>

            <td>
              <section class="hoverEffect">
                <img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
                <div class="txt"><h3>서울</h3>예약인원수23/25<br>가격 20,000원<br>★★★★★</div>
              </a>
              </section>
            </td>

            <td height="30">
              <section class="hoverEffect">
                <img style="border: 5px solid #000000; width:249px;"
                src="product_img/4.jpg" width="350" height="240"/>
                <a href = "###">
                <div class="txt"><h3>치악산</h3>예약인원수10/25<br>가격 20,000원<br>★★★★★</div>
              </a>
              </section>
            </td>
          </tr>
          <tr>
            <td><font size = "4">
                      <p><center>도착지:지리산 </p>
                      <p> 예약인원수 : 20/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:부산 </p>
                      <p> 예약인원수 : 17/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:서울 </p>
                      <p> 예약인원수 : 23/25 </center></font></p>
            </td>

            <td><font size = "4">
                      <p><center>도착지:치악산 </p>
                      <p> 예약인원수 : 10/25 </center></font></p>
            </td>

          </tr>
          <tr><td colspan="4"><br></td></tr>
          </table>
</div>

<br><br>

<a href="#" id="load">
<span class="content_add">
  <font color="white">더보기 <font size="5">+</font></font>
</span>
</a>

<br><br><br>

  <script>
    $(function(){
      $("div").slice(0,21).show();
      $("#load").click(function(e){
        e.preventDefault();
        $("div:hidden").slice(0,15).show();
        if($("div:hidden").length==0){
        }
      });
    });
  </script>
</body>
<%@ include file="/Contents/include_file(navi bar)/footer.jsp" %>
</html>