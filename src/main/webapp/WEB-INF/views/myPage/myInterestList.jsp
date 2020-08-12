<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

	<!-- 헤더 -->
	<jsp:include page="../../views/header_none_banner.jsp"/>
	<br><br><br><br>
	
	<!-- 메뉴 -->
	<jsp:include page="../../views/menu_mypage.jsp"/>
	
	<meta charset="UTF-8">
	
	<title>관심 상품 목록</title>

</head>
<script type="text/javascript">
function validation(){
	var num = <%=userdata.getUserseq()%>+0;
	if(num==0){
		window.location.href = './loginRedirect';
	}
}
</script>

<body onload="validation();">

	<section>
	<h2>&nbsp;&nbsp;&nbsp;&nbsp;관심 상품 목록</h2>
		<table>
			<c:forEach items="${MyLikeList}" var="dto">
				<tr>
					<td style="width: 200px; height:200px; padding-left:30px; ">
						<a href="./productDetail.bill?prdseq=${dto.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>">
						<img src="http://119.207.169.213:8080/blgy/${dto.image1}" width= "170px" height="170px" ></a>
					</td>
					<td style="width: 650px; height:200px; padding-right:50px; text-align:left; list-style-type:none;">
						<font size="4.5"><b>${dto.title}</b></font><br><br>
						${dto.price} 원/day<br><br>
						${dto.date1 } ~ ${dto.date2 }
					</td>
				
				</tr>		
			</c:forEach>	
		</table>
	
	</section>
	
	<jsp:include page="../../views/footer.jsp"/>

</body>

</html>