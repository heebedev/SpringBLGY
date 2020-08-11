<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"/>
<!DOCTYPE html>
<html>
<head>

<script>
		function clickFunc() {
			window.close();
		}

		/* 미입력 알럿 */
		function check() {
		  if(revProduct.productImage.value == "") {
		    alert("사진을 등록해 주세요.");
		    addProduct.productImage.focus();
		    return false;
		  }
		  else if(revProduct.title.value == "") {
		    alert("상품이름을 입력해 주세요.");
		    addProduct.title.focus();
		    return false;
		  } 
		  else if(revProduct.price.value == "") {
			    alert("가격을 입력해 주세요.");
			    addProduct.price.focus();
			    return false;
		  } 
		  else if(revProduct.date1.value == "") {
			    alert("대여 시작일을 입력해 주세요.");
			    addProduct.date1.focus();
			    return false;
		  } 
		  else if(revProduct.date2.value == "") {
			    alert("대여 종료일을 입력해 주세요.");
			    addProduct.date2focus();
			    return false;
		} 
		  else if(revProduct.hash.value == "") {
			    alert("상품을 홍보할 해시태그를 입력해 주세요.");
			    addProduct.hash.focus();
			    return false;
		} 
		  else if(revProduct.info.value == "") {
			    alert("상품을 소개를 입력해 주세요.");
			    addProduct.info.focus();
			    return false;
		} 
		 
		  else return true;
		}

</script>
<style>
	.prdCheck {
		border-radius: 8px;
		border: solid 2px Black;
		width: 200 px;
		height: 720 px;
	}
</style>
<meta charset="UTF-8">
<title>제품 정보 수정</title>
</head>
		<center>
	<h1><a class="home" href="Mainpage.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img src="resources/logo.png" alt="logo" height="130" width="240"></a></h1>
	
	<h3>내 상품 수정</h3>
	<form action="productRevision" method="post" enctype="Multipart/form-data" name="revProduct" onsubmit="return check()" >
		<table style="font-family: sans-serif; font-size: 12px">
			<tr>
				<td colspan="2">제목 : <input type="text" name="title" id="title" size="50" value="${pdDetail.title }"></td>
			</tr>
			<tr>
				<td colspan="2">가격 : <input type="number" name="price" id="price" size="50" value="${pdDetail.price }"> (원/일)</td>
			</tr>
			<tr>
				<td colspan="2"> </td>
			</tr>
			<tr>
				<td> 시작일 : <input type="date" name="date1" id="date1" value="${pdDetail.date1 }"></td>
				<td> 종료일 : <input type="date" name="date2" id="date2" value="${pdDetail.date2 }"></td>
			</tr>
		
			<tr>
				<td colspan="2"> </td>
			</tr>
			<tr>
				<td colspan="2">해시태그</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="3" cols="60" name="hash" id="hash" >${pdDetail.hash }</textarea></td>
			</tr>
			
			<tr>
				<td colspan="2"> </td>
			</tr>
			
			<tr>
				<td colspan="2">상세정보</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="15" cols="60" name="info" id="info" >${pdDetail.info }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="productImage"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" align="center"></td>
			</tr>
		</table>
		</center>
<input type = "hidden" name="prdseq" value="<%=request.getParameter("prdseq") %>">
<input type = "hidden" name="userseq" value=<jsp:getProperty property="userseq" name="userdata"/>>
<input type = "hidden" name="xaxis" value=<jsp:getProperty property="xaxis" name="userdata"/>>
<input type = "hidden" name="yaxis" value=<jsp:getProperty property="yaxis" name="userdata"/>>
	</form>
	<center>
	 <button onclick="history.back();">취소</button>
	</center>
	
</body>
</html>


