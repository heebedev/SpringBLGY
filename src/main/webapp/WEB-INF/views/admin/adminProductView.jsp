<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../../views/admin/layout/admin_menu.jsp"/>

<meta charset="UTF-8">
<title>관리자 상품정보 수정</title>

</head>

<body>

		<section>

			<h1 style="text-align: center;">"${AdminPrdUpdate.title}"상품 정보 수정</h1>

		
			<form action="adminproductmodify.bill" method="post">
				<table border="0">
					<tr>
						<td style="text-align: right;">상품번호</td>
						<td><input type="text" name="prdseq" size="5" readonly="readonly" value="${AdminPrdUpdate.prdseq}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">올린사람</td>
						<td><input type="text" name="uploaderseq" size="5" readonly="readonly" value="${AdminPrdUpdate.uploaderseq}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">상품명</td>
						<td><input type="text" name="newtitle" size="40" value="${AdminPrdUpdate.title}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">가격</td>
						<td><input type="text" name="newprice" size="40" value="${AdminPrdUpdate.price}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">대여 기간</td>
						<td><input type="date" name="newdate1" size="40" value="${AdminPrdUpdate.date1}"> ~ <input type="date" name="newdate2" size="40" value="${AdminPrdUpdate.date2}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">상품내용</td>
						<td><textarea rows="10" cols="50" name="newinfo"> ${AdminPrdUpdate.info}</textarea></td>
					</tr>
					<tr>
						<td style="text-align: right;">해시태그</td>
						<td><textarea rows="10" cols="50" name="newhash"> ${AdminPrdUpdate.hash}</textarea></td>
					</tr>
									
					<tr>
						<td colspan="2"><input type="submit" value="수정" onclick="return modify_confirm_alert(this);">
							&nbsp;&nbsp;&nbsp; <a href="adminproductlist.bill">목록보기</a> &nbsp;&nbsp;&nbsp;
							<a href="adminproductdelete.bill?prdseq=${AdminPrdUpdate.prdseq}" onclick="return confirm_alert(this);">삭제</a></td>
					</tr>

				</table>
			</form>

		</section>
	</div>

</body>

</html>