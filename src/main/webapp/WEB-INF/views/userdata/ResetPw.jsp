<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
	<style type="text/css">
		input[type="submit"] {
		width: 300px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px; 
		}
		input[type="password"] {
		width: 260px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px; 
		}
	</style>
	<script type="text/javascript">
		function checkValue(){
			
			inputForm = eval("document.resetPw");
			
			if(!inputForm.pw1.value){
				alert("비밀번호를 입력하세요");	
				inputForm.pw1.focus();
				return false;
			}
			if(!inputForm.pw2.value){
				alert("비밀번호를 입력하세요");	
				inputForm.pw2.focus();
				return false;
			}
			if(inputForm.pw1.value !== inputForm.pw2.value){
				alert("비밀번호가 일치하지않습니다.");	
				inputForm.email.focus();
				return false;
			}
		}
	</script>
</head>
<body>
   <h2>빌릴꼬냥</h2>
        <form name="resetPw" method="post" action="./changePw.bill" onsubmit="return checkValue()">
			<input type="password" name="pw" id="userPw" placeholder="비밀번호"><br>
			<input type="password" name="pw2" id="userPwChk" placeholder="비밀번호 재입력"><br>
			<input type="hidden" name="email" value="${email}">
            <input type="submit" value="재설정"/>
        </form>
</body>
</html>