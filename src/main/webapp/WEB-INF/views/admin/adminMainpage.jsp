<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../../views/admin/layout/admin_menu.jsp"/>

<meta charset="UTF-8">
<title>관리자 메인 페이지</title>


</head>
<script type="text/javascript">
function validation(){
	var num = <%=request.getParameter("validation")%>+0;
	if(num==0){
		alert("잘못된 접근입니다.");
		window.location.href = './login.bill';
	}
}
</script>
<body onload="validation();">
	<section >
		<div align="center">
		<h1 style="text-align: center;">Today's 빌릴꼬냥</h1>
			<table>
				<tr>
					<td width="200">
						<h3 style="text-align: center;">회원 가입<br><br>${adminMainCountUser }건</h3>
					</td>
					<td width="200">
						<h3 style="text-align: center;">상품 등록<br><br>${adminMainCountProduct }건</h3></td>
					<td width="200"><h3 style="text-align: center;">상품 대여<br><br>${adminMainCountBorrow }건</h3>
					</td>
				</tr>
			</table>
		</div>
	</section>

</body>

</html>