<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name = "viewport" content = "user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,
width=device-width" />
<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src = "//developers.kakao.com/sdk/js/kakao.js"></script>
    <%
        request.setCharacterEncoding("UTF-8"); 
    %>
    <title>로그인 화면</title>
    <script type="text/javascript">
        function checkValue(){
            inputForm = eval("document.loginInfo");
            if(!inputForm.email.value){
                alert("이메일을 입력하세요");    
                inputForm.email.focus();
                return false;
            }else if(!inputForm.pwd.value){
                alert("비밀번호를 입력하세요");    
                inputForm.pwd.focus();
                return false;
            }
        } 
        function AccPopup(){
        	var pop = window.open("./FindAcc.bill","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
        }
        function PwPopup(){
        	var pop = window.open("./FindPw.bill","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
        }
    </script>
 <style type="text/css">
			body{			
			max-width:350px;
			margin: 0 auto;
		}
			input[type="text"] {
			width: 100%;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px;
		}
			input[type="password"] {
			width: 100%;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
			input[type="submit"] {
			width: 170px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
			input[type="button"] {
			width: 170px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
 </style>
</head>
<body>
    <div id="wrap">
        <form name="loginInfo" method="post" action="./checkUser.bill" 
                onsubmit="return checkValue()">
            	<h1 style= "text-align: center;"><a class="home" href="mainForm.bill"><img src="resources/logo.png" alt="logo" height="130" width="240"></a></h1>
 				이메일<br>
 				<input type="text" name="email" maxlength="50"><br>
           		비밀번호<br>
           		<input type="password" name="pw" maxlength="50"><br>
	         	<input type="submit" value="로그인"/> <a href="./createAcc.bill"><input type="button" value="회원가입"></a><br>
				<input type="button" value="아이디 찾기" onclick="AccPopup()">
				<input type="button" value="비밀번호 재설정" onclick="PwPopup()">
        </form>  
        <center><a id="kakao-login-btn"></a></center>
		<a href="http://developers.kakao.com/logout"></a><br>
		<script type='text/javascript'>
		Kakao.init('e3540743b0ce3fee601d9c43b8d8bab6'); 
		Kakao.Auth.createLoginButton({ 		
		    container: '#kakao-login-btn',
		    success: function(authObj) { 
		           Kakao.API.request({
		               url: '/v2/user/me',
		              	success: function(res) {	         		
							  var id = res.id;
							  var email = res.kakao_account.email;
							  var nickname = res.properties.nickname;
							  window.location.href = './pass_kakaoUser.bill?email='+email;
		              	} 
		                 })	     
		               },
		               fail: function(error) {
		                 alert(JSON.stringify(error));
		               }
		             });
		</script>
    </div>    
</body>
</html>


