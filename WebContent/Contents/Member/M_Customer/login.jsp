<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="/Project/Contents/CSS/CSS_Member/loginstyle.css">
</head>
<body>
        <div class="box">
                <center><font size="7" class="google2">사용자 로그인</font></center>
                <br>
                <form>
                  <div class="inputBox">
                    <input type="text" name="text" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">ID</font></label>
                  </div>
                  <div class="inputBox">
                        <input type="password" name="password" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">Password</font></label>
                      </div>

                    <div class="inp_chk">
                      <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
                      <label for="keepLogin" class="lab_g">
                          <span class="img_top ico_check"></span>
                          <span class="txt_lab"><font size="5" class="google2">자동 로그인</font></span>
                      </label>
                      &nbsp; &nbsp; &nbsp; &nbsp;
                        <button class="button">로그인</button>
                </form>
              </div>
              <br>
          <table>
            <tr>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td><a href="/Project/Contents/Member/signup_select.jsp"><font size="4">회원가입</font></a></td>
              <td>&nbsp; | &nbsp; </td>
              <td><a href="#"><font size="3">아이디찾기</a></td>
              <td>&nbsp; | &nbsp;</td>
              <td><a href="#"><font size="3">비밀번호찾기</a></td>
            </tr>
          </table>
        </div>
</body>
</html>
