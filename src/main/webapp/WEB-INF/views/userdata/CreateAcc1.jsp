<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name = "viewport" content = "user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,
	width=device-width" />
	<script type="text/javascript">
	
	function goPopup(){
		var email = document.getElementById('email').value;
		var pop_title = "emailCheck";
		var pop = window.open("./checkEmail.bill?email="+email,"pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

	}
	function emailCheck(){
		
		inputForm = eval("document.info");
		var emailVal = inputForm.email.value

		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(!emailVal){
			alert("이메일을 입력해주세요.");	
			inputForm.email.focus();
			return false;
		}else if(emailVal.match(regExp) != null){	
			goPopup();
		}
		else{
			alert("이메일 형식이 올바르지 않습니다.");
			inputForm.email.focus();
			return false;
		}
	}
	function checkValue(){
		inputForm = eval("document.info");
		if(inputForm.pw.value !== inputForm.pw2.value){
			alert("비밀번호를 확인해주세요.");	
			inputForm.pw.focus();
			return false;
		}else if(inputForm.pw.value.length<8){
			alert("비밀번호를 8글자 이상 입력해주세요.");	
			inputForm.email.focus();
			return false;
		}else if(inputForm.dup.value == "true"){
			alert("이미 사용 중인 이메일입니다. \n 이메일 중복확인을 해주세요.");	
			inputForm.email.focus();
			return false;
		}else if(!inputForm.dup.value ){
			alert("이메일 중복 확인을 해주세요.");	
			inputForm.email.focus();
			return false;
		}else{
			return true;
		}
	}
	</script>
	<style type="text/css">
			body{			
			max-width:350px;
			margin: 0 auto;
		}
			input[type="text"] {
			width: 237px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
			input[type="password"] {
			width: 300px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
			input[type="submit"] {
			width: 300px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
	</style>
	<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
	<script src = "//developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<h1 style= "text-align: center;"><a class="home" href="mainForm.bill"><img src="resources/logo.png" alt="logo" height="130" width="240"></a></h1>
	<form action ="createAcc2.bill" name="info" id="info" method="post" onsubmit="return checkValue()">
	<input type ='text' name='email' placeholder = '이메일' id='email'>
	<input type ='button' name='duplicate'value='중복체크' style="width:58px; height: 38px; border-radius:8px;" onClick="emailCheck();">
	<br>
	<div>
	<input type="password" id="userPw" name="pw" placeholder="비밀번호"/><br>
	<input type="password" id="userPwChk" name="pw2" placeholder="비밀번호 확인"/><br>
	<font id="chkNotice" size="2"></font><br>
	</div>
	<input type ='hidden' name='nickname' placeholder = '닉네임' id='nickname'>
	<input type ='hidden' name='dup' id='dup'>
	
	<center>
	<a id="kakaoSignin"></a><br>
	<input type ='submit' value= '다음'>
	</center>
	
	<script type='text/javascript'> 
	Kakao.init('e3540743b0ce3fee601d9c43b8d8bab6'); 
	Kakao.Auth.createLoginButton({ 
	    container: '#kakaoSignin', 
	    success: function(authObj) { 
	           Kakao.API.request({
	               url: '/v2/user/me',
	              	success: function(res) {
						  var email = res.kakao_account.email;
						  var nickname = res.properties.nickname;
						  
						  document.getElementById("email").value=email;
						  document.getElementById("name").value=nickname;
	
						  
						  $('body').append(html)
						  
	                   } 
	                 })
	               },
	               fail: function(error) {
	                 alert(JSON.stringify(error));
	               }
	             });
	</script>
	<script type='text/javascript'> 
	$(function(){
	    $('#userPw').keyup(function(){
	      $('#chkNotice').html('');
	    });

	    $('#userPwChk').keyup(function(){

	        if($('#userPw').val() != $('#userPwChk').val()){
	          $('#chkNotice').html('비밀번호 일치하지 않음');
	          $('#chkNotice').attr('color', 'red');
	        } else{
	          $('#chkNotice').html('비밀번호 일치함');
	          $('#chkNotice').attr('color', 'blue');
	        }

	    });
	});
	</script>
	</form>
	<br>
</body>
</html>