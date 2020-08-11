<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../../views/admin/layout/admin_menu.jsp"/>

<meta charset="UTF-8">
<title>관리자 상품관리 검색</title>

	<style>
		table {
			border-collapse: collapse;
			width: 100%;
		}
		th, td {
			padding: 8px;
			border: 1px solid;
			text-align: center;
		}
		tr:hover { background-color: #F5F5F5; }
	</style>
	
</head>

<body>



		<section>
			<h1>빌릴꼬냥 상품 관리</h1>
			<form action="adminproductsearch.bill" method ="post">
				검색 선택: <select name = "selection">
							<option value="PRDSEQ">상품번호</option>
							<option value="TITLE">상품명</option>
							<option value="NICKNAME">등록회원</option>
						</select>
					<input type="text" placeholder="상품번호, 상품명, 등록회원 검색" name="adminProductSearchText" style="width: 200px">
					<input type="submit" value="검색" style="width: 40px; height: 30px; border-radius: 8px; color: white; background-color: black;">
			</form>
			<br>

			<table border="1">
			
				<tr style="background-color:#E2DFDF">
					<td>상품번호</td>
					<td>사진</td>
					<td>상품명</td>
					<td>가격</td>
					<td>대여기간</td>
					<td>등록회원닉네임</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>

				<c:forEach items="${AdminProductSearchList}" var="productSearchList">
					<tr>
						<td>${productSearchList.prdseq}</td>
						<td><img src="http://119.207.169.213:8080/blgy/${productSearchList.image1}" width= "80px" height="80px"></a></td>
						<td>${productSearchList.title}</td>
						<td>${productSearchList.price}</td>
						<td>${productSearchList.date1}<br>&nbsp;&nbsp;~${productSearchList.date2}</td>
						<td>${productSearchList.nickname}</td>
						<td><a href = "adminproductview.bill?prdseq=${productSearchList.prdseq}">수정</a></td>
						<td><a href = "adminproductdelete.bill?prdseq=${productSearchList.prdseq}" onclick="return confirm_alert(this);">삭제</td>
					</tr>

				</c:forEach>
			</table>
		
		</section>


</body>

</html>