<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../../views/admin/layout/admin_menu.jsp"/>

<meta charset="UTF-8">
<title>관리자 회원정보 수정</title>

</head>

<body>

		<section>

			<h1 style="text-align: center;">"${AdminUserUpdate.nickname}"님의 정보 수정</h1>

		
			<form action="adminusermodify.bill" method="post">
				<table border="0">
					<tr>
						<td style="text-align: right;">회원번호</td>
						<td><input type="text" name="userseq" size="5" readonly="readonly" value="${AdminUserUpdate.userseq}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">이름</td>
						<td><input type="text" name="newname" size="40" value="${AdminUserUpdate.name}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">닉네임</td>
						<td><input type="text" name="newnickname" size="40" value="${AdminUserUpdate.nickname}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">패스워드</td>
						<td><input type="text" name="newpw" size="40" value="${AdminUserUpdate.pw}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">생년월일</td>
						<td><input type="text" name="newbirthdate" size="40" value="${AdminUserUpdate.birthdate}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">이메일</td>
						<td><input type="text" name="newemail" size="40" value="${AdminUserUpdate.email}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">전화번호</td>
						<td><input type="text" name="newtelno" size="40" value="${AdminUserUpdate.telno}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">주소검색</td>
						<td><input type="text" name="newaddress" size="40" value="${AdminUserUpdate.address}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">상세주소</td>
						<td><input type="text" name="newaddressdt" size="40" value="${AdminUserUpdate.addressdt}"></td>
					</tr>
					
				
					<tr>
						<td colspan="2"><input type="submit" value="수정" onclick="return modify_confirm_alert(this);">
							&nbsp;&nbsp;&nbsp; <a href="adminUser.bill">목록보기</a> &nbsp;&nbsp;&nbsp;
							<a href="adminuserdelete.bill?userseq=${AdminUserUpdate.userseq}" onclick="return confirm_alert(this);">삭제</a></td>
					</tr>

				</table>
			</form>

		</section>
	

</body>

</html>