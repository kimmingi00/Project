<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
  <style>
    #button{ position:relative; border-top-left-radius: 36px;	border-top-right-radius: 36px;	border-bottom-left-radius: 36px;	border-bottom-right-radius: 36px;	margin-right:-4px;}
    #btn_group button{border: 1px solid white; background-color: rgba(0,0,0,0); color: white; padding:5px; z-index: 1; position: relative; top:320px; height: 80px; width:250px;}
    #btn_group button:hover{color:black; background-color: white;}
    body{background-color: #363636;}
  </style>

</head>

<body>
  <center>
        <div id = "btn_group">
              <a href="M_Customer/login.jsp"><button id = "button"><font size="5">&nbsp;  사용자 로그인 >>  &nbsp; </font></button></a>
                  <br><br>
              <a href="M_Business/b_login.jsp"><button id = "button"><font size="5">&nbsp;  사업자 로그인 >>  &nbsp; </font></button></a>
        </div>
  </center>
</body>

</html>