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
<h1><a class="home" href="Mainpage.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img src="logo.png" alt="logo" height="130" width="240"></a></h1>
	
	<form action="actionAddedProduct.bill" method="post" enctype="multipart/form-data" name="addProduct" onsubmit="return check()" >
		<table>
			<tr>
				<td style="text-align: right;">title :</td>
				<td><input type="text" name="title" id="title" size="58" ></td>
			</tr>
			<tr>
				<td style="text-align: right;">price : </td>
				<td><input type="text" name="price" id="price"></td>
			</tr>
			<tr>
				<td style="text-align: right;">대여시작 :</td>
				<td> <input type="date" name="date1" id="date1"></td>
			</tr>
			<tr>
				<td style="text-align: right;">대여종료 :</td>
				<td><input type="date" name="date2" id="date2"></td>
			</tr>
			<tr>
				<td style="text-align: right;">해시태그 :</td>
				<td> <textarea rows="2" cols="50" name="hash" id="hash"></textarea></td>
			</tr>
			
			<tr>
				<td style="text-align: right;">상품소개 :</td>
				<td> <textarea rows="10" cols="50" name="info" id="info"></textarea></td>
			</tr>
			<tr>
				<td style="text-align: right;">사진 :</td>
				<td><input multiple="multiple" type="file" name="productImage">
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="상품등록"></td>
			</tr>
		</table>
		</center>
<input type = "hidden" name="userseq" value=<jsp:getProperty property="userseq" name="userdata"/>>
<input type = "hidden" name="xaxis" value=<jsp:getProperty property="xaxis" name="userdata"/>>
<input type = "hidden" name="yaxis" value=<jsp:getProperty property="yaxis" name="userdata"/>>
	</form>
	
</body>
</html>