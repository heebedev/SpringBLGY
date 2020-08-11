<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/JavaScript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=083074288060e279dca45e2827603ef8&libraries=services"></script>

<script type="text/javascript">

<%
request.setCharacterEncoding("UTF-8");
String email="";
String nickname="";
String password="";
email=request.getParameter("email");
nickname=request.getParameter("nickname");
password=request.getParameter("pw");
%>

function openDaumZipAddress() {
	new daum.Postcode({
		oncomplete:function(data) {
			document.getElementById('address').value = data.address;
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch(data.address, function(result, status) {
				document.getElementById('xaxis').value = result[0].x;
				document.getElementById('yaxis').value = result[0].y;

			});    
		}
	}).open();
}
</script>

<script type="text/javascript">
function goPopup(){
	var nickname = document.getElementById('nickname').value;
	var pop_title = "nicknameCheck";
	var pop = window.open("./checkNickname.bill?nickname="+nickname,"pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
</script>

<script type="text/javascript">
function emailCheck(){
	inputForm = eval("document.form");
	if(!inputForm.nickname.value){
		alert("닉네임을 입력해주세요.");	
		inputForm.nickname.focus();
		return false;
	}
	else{
		goPopup();
	}
}
</script>

<script type="text/javascript">
function onload(){
	var email = <%=email%>
	if (email == null){
		alert("잘못된 접근입니다.")
		window.location.href = './login.bill';
	}
}
</script>

<script type="text/javascript">
function checkValue(){
	inputForm = eval("document.form");
	
	if(!inputForm.address.value){
		alert("주소를 입력해주세요.");	
		return false;
	}
	if(!inputForm.telno.value){
		alert("휴대전화를 입력해주세요.");	
		return false;
	}
	if(inputForm.dup.value == "true"){
		alert("이미 사용 중인 닉네임입니다. \n 이메일 중복확인을 해주세요.");	
		inputForm.email.focus();
		return false;
	}
	if(!inputForm.dup.value){
		alert("닉네임 중복 확인을 해주세요.");	
		inputForm.email.focus();
		return false;
	}
}
</script>
	<style type="text/css">
			body{			
			max-width:350px;
			margin: 0 auto;
		}
			input[type="text"] {
			width: 300px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
			input[type="date"] {
			width: 220px;
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
			input[type="button"] {
			width: 80px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
	</style>
<title>회원가입</title>
</head>
<body onload = "onload();">
<h1 style= "text-align: center;"><a class="home" href="mainForm.bill"><img src="resources/logo.png" alt="logo" height="130" width="240"></a></h1>
<h1 align= "center">개인정보 입력</h1>
<form action="uploadUserData.bill" name="form" id="form" method="post" onsubmit="return checkValue();">
	<div id="list"></div>
	<div id="callBackDiv">
		<table>
			<tr><td><input type ='text' name='email' placeholder = '이메일' id='email' value="<%=email%>" readonly/></td></tr>
			<tr><td><input type ='text' name='name' placeholder = '이름' id='name'></td></tr>
			<tr><td><input type ='text' style = 'width:220px' width="240px"id = "nickname" name='nickname' placeholder = '닉네임'value="<%=nickname%>"><input type = "button" value="중복확인" onclick="emailCheck();"></td></tr>
			<tr><td><b style="color: gray;"> 생년월일 </b><input type = "date" name = "birthdate"> </td></tr>
			<tr><td><input type ='text' name='telno' placeholder = '휴대전화' pattern="[0-9]{11}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" title = "11자리의 휴대전화번호를 입력해주세요."/></td></tr>
			<tr><td><input type="text" id="address" placeholder= '주소' name="address" onclick="openDaumZipAddress();" readonly/></td></tr>
			<tr><td><input type="text" id="addressdt"  placeholder='상세주소' name="addressdt" /></td></tr>
			
			
			<!-- hidden -->
			<tr><td><input type="hidden" id="xaxis"  placeholder='위도'name="xaxis" /></td></tr>
			<tr><td><input type="hidden" id="yaxis" placeholder='경도' name="yaxis" /></td></tr>
			<tr><td><input type='hidden' name='pw' placeholder = '비밀번호' value="<%=password%>"></td></tr>
			<tr><td><input type ='hidden' name='dup' id='dup'></td></tr>
		</table>
			<center>
			<input type="submit" value="가입하기">
			</center>
			
	</div>

</form>

</body>
</html>