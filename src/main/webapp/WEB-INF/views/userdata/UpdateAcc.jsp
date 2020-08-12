<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/JavaScript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=083074288060e279dca45e2827603ef8&libraries=services"></script>

<script type="text/javascript">

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
			input[type="password"] {
			width: 300px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
	</style>
<title>게인정보수정</title>
</head>
<body>
<h1 style= "text-align: center;"><a class="home" href="mainForm.bill"><img src="resources/logo.png" alt="logo" height="130" width="240"></a></h1>
<h1 align= "center">개인정보 입력</h1>
<form action="updateUserData.bill" name="form" id="form" method="post" onsubmit="return checkValue();">
	<div id="list"></div>
	<div id="callBackDiv">
		<table>
			<tr><td><input type="password" name=pw value="${userdata.pw}"></td></tr>
			<tr><td><input type ='text' name='telno' placeholder = '휴대전화'  value="${userdata.telno}" pattern="[0-9]{11}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" title = "11자리의 휴대전화번호를 입력해주세요."/></td></tr>
			<tr><td><input type="text" id="address" placeholder= '주소' name="address"  value="${userdata.address}" onclick="openDaumZipAddress();" readonly/></td></tr>
			<tr><td><input type="text" id="addressdt"  placeholder='상세주소'  value="${userdata.addressdt}" name="addressdt" /></td></tr>
			<!-- hidden -->
			<tr><td><input type="hidden" id="xaxis"  placeholder='위도'name="xaxis" value="${userdata.xaxis}" /></td></tr>
			<tr><td><input type="hidden" id="yaxis" placeholder='경도' name="yaxis"  value="${userdata.yaxis}" /></td></tr>
			<tr><td><input type="hidden" id="userseq" name="userseq"  value="${userdata.userseq}" /></td></tr>
		</table>
			<center>
			<input type="submit" value="수정하기">
			</center>
			
	</div>

</form>

</body>
</html>