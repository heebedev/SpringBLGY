<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<style>
	.commentCheck {
		border-radius: 8px;
		border: solid 2px Black;
		width:500px;
	}
	
	
	input {
			width: 100%;
			padding: 10px 10px;
			margin: 5px 0;
			box-sizing: border-box;
		}
	
</style>
<script>

/* 미입력 알럿 */
function check() {
  if(addProduct.productImage.value == "") {
    alert("사진을 등록해 주세요.");
    addProduct.productImage.focus();
    return false;
  }
  else if(addProduct.title.value == "") {
    alert("상품이름을 입력해 주세요.");
    addProduct.title.focus();
    return false;
  } 
  else if(addProduct.price.value == "") {
	    alert("가격을 입력해 주세요.");
	    addProduct.price.focus();
	    return false;
  } 
  else if(addProduct.date1.value == "") {
	    alert("대여 시작일을 입력해 주세요.");
	    addProduct.date1.focus();
	    return false;
  } 
  else if(addProduct.date2.value == "") {
	    alert("대여 종료일을 입력해 주세요.");
	    addProduct.date2focus();
	    return false;
} 
  else if(addProduct.hash.value == "") {
	    alert("상품을 홍보할 해시태그를 입력해 주세요.");
	    addProduct.hash.focus();
	    return false;
} 
  else if(addProduct.info.value == "") {
	    alert("상품을 소개를 입력해 주세요.");
	    addProduct.info.focus();
	    return false;
} 
 
  else return true;
}
</script>


</head>
<body>
<center>
<h1><a class="home" href="mainForm.bill"><img src="resources/logo.png" alt="logo" height="130" width="240"></a></h1>
	
	<h3>내 상품 등록</h3>
	<form action="actionAddedProduct.bill" method="post" enctype="Multipart/form-data" name="addProduct" onsubmit="return check()" >
		<table>
			<tr>
				<td colspan="2"><input type="text" name="title" id="title" placeholder="상품 제목을 입력해 주세요."></td>
			</tr>
			<tr>
				<td colspan="2"><input type="number" name="price" id="price" placeholder="가격을 입력해 주세요(가격/일)."></td>
			</tr>
			
			<tr>
				<td colspan="2">대여 시작일과 종료일을 선택해 주세요.</td>
			</tr>
			
			<tr>
				<td> <input type="date" name="date1" id="date1"></td>
				<td> <input type="date" name="date2" id="date2"></td>
			</tr>
		
			<tr>
				<td colspan="2"><textarea rows="3" cols="60" name="hash" id="hash" placeholder="해시태그를 입력해 주세요."></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2"> <textarea rows="15" cols="60" name="info" id="info" placeholder="내용을 입력하세요."></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="productImage"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" align="center"></td>
			</tr>
		</table>
		</center>
<input type = "hidden" name="userseq" value=<jsp:getProperty property="userseq" name="userdata"/>>
<input type = "hidden" name="xaxis" value=<jsp:getProperty property="xaxis" name="userdata"/>>
<input type = "hidden" name="yaxis" value=<jsp:getProperty property="yaxis" name="userdata"/>>
	</form>
	
<jsp:include page="../../views/footer.jsp"/>
</body>
</html>