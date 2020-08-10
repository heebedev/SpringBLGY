<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

	<!-- 헤더 -->
	<jsp:include page="../../views/header_none_banner.jsp"/>
	
	<!-- 메뉴 -->
	<jsp:include page="../../views/menu_mypage.jsp"/>
	
	<meta charset="UTF-8">
	
	<title>관심 상품 목록</title>

</head>

<body>

	<section>
		
		<table>
		
			<c:forEach items="${MyLikeList}" var="dto">
				<tr>
					<td style="width: 200px; height:200px; padding-left:30px; "><a href="./productDetail.bill?prdseq=${dto.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img src="http://119.207.169.213:8080/blgy/${dto.image1}" width= "200px" height="200px" style="border: solid gray 1px; border-radius:4px;"></a></td>
					<td style="width: 650px; height:200px; padding-right:50px;text-align:right; list-style-type:none;">${dto.title}<br><br>${dto.price}원</td>
				</tr>		
			</c:forEach>	
		</table>
	
	</section>

</body>

</html>