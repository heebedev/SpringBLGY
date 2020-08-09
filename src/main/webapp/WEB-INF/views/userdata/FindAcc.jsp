
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name = "viewport" content = "user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,
width=device-width" />
	<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
	<script type="text/javascript">
		function checkValue()
		{
			inputForm = eval("document.findid");
			if(!inputForm.name.value){
				alert("이름을 입력하세요");	
				inputForm.name.focus();
				return false;
			}
			else if(!inputForm.telno.value){
				alert("핸드폰번호를 입력하세요");	
				inputForm.telno.focus();
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
	<div id="wrap">
		<h2>빌릴꼬냥</h2>
        <form name="findid" method="post" action="./lookUpAcc.bill" onsubmit="return checkValue()">
  			<input type="text" name="name" placeholder="이름"><br>
			<input type="text" name="tel" placeholder="전화번호"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><br>
			<input type="submit" value="찾기">
        </form>
	</div>	
	
</body>
</html>