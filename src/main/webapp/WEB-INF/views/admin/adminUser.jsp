<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../../views/admin/layout/admin_menu.jsp"/>

<meta http-equiv="Content-Type"  charset="UTF-8">
<title>관리자 회원정보</title>

</head>
	<style>
		table {
			margin-top:10px;
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


	<!-- 페이징 -->
	<script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="adminUser.bill?nowPage=${paging.nowPage}&cntPerPage="+sel;
		}
	</script>


<body>

		<section>
			<h1>빌릴꼬냥 회원 관리</h1>
			<form action="adminusersearch.bill" method ="post">
				검색 선택: <select name = "selection">
							<option value="USERSEQ">회원번호</option>
							<option value="NAME">이름</option>
							<option value="NICKNAME">닉네임</option>
						</select>
					<input type="text" placeholder="회원번호, 이름, 닉네임 검색" name="adminUserSearchText">
					<input type="submit" value="검색" style="width: 40px; height: 30px; border-radius: 8px; color: white; background-color: black;">
			</form>
			<br>

	
	<!-- 페이징 -->
	<div>
	검색결과 : ${countUserList }	
	<div style="float: right;">
		
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> 
	</div>
	<!-- 페이징 옵션선택 끝 -->
			
			
			
			<table border="1">
				<tr style="background-color:#E2DFDF">
					<td>회원번호</td>
					<td>이름</td>
					<td>닉네임</td>
					<td>상품등록 수</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>

				<c:forEach items="${AdminUserList}" var="userList">
					<tr>
						<td>${userList.userseq}</td>
						<td>${userList.name}</td>
						<td>${userList.nickname}</td>
						<td>${userList.countPrd}</td>
						<td><a href = "adminuserview.bill?userseq=${userList.userseq}">수정</a></td>
						<td><a href = "adminuserdelete.bill?userseq=${userList.userseq}" onclick="return confirm_alert(this);">삭제</td>
					</tr>

				</c:forEach>
			</table>
			
			<br>
			
	<!-- 페이지번호매기기 -->
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="adminUser.bill?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="adminUser.bill?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="adminUser.bill?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
			
			
			
			
		
</section>


</body>

</html>