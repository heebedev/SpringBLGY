<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name = "viewport" content = "user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,
width=device-width" />
	<title>비밀번호 재설정</title>
	<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
	<script type="text/javascript">
		function checkValue(){
			inputForm = eval("document.findPw");
			if(!inputForm.email.value){
				alert("이메일을 입력하세요");	
				inputForm.email.focus();
				return false;
			}
			if(!inputForm.telno.value){
				alert("휴대전화번호를 입력하세요");	
				inputForm.email.focus();
				return false;
			}
		}
	</script>
	<style type="text/css">
		input[type="submit"] {
		width: 300px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px; 
		}
		input[type="text"] {
		width: 300px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px; 
		}
	</style>
</head>
<body>
            <h2>빌릴꼬냥</h2>
        <form name="findPw" method="get" action="./lookUpPw.bill" onsubmit="return checkValue()">
			<input type="text" name="email" placeholder="이메일"><br>
			<input type="text" name="telno" placeholder="전화번호"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><br>
            <input type="submit" value="확인"/>
        </form>
</body>
</html>