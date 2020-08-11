<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../views/header.jsp"/>
</head>
<body>
		<br><br><br><br>
		<h2 style="color:gray;">최신 게시글</h2>
			<table style ="width: 1000px;">
					<%for(int i=0; i<=3; i++){ %>
					<tr height="300">
				<c:forEach items="${MainList}" var="MainDTO" begin="<%=4*i%>" end="<%=4*i+3%>" step="1"> <!-- var = 변수이름 -->
						<td width="250" align="center" style="top-margin:50px;"><a style="text-decoration: none; color:gray; font-size:20px;"href ="productDetail?prdseq=${MainDTO.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img src="http://119.207.169.213:8080/blgy/${MainDTO.image1}" height="200" width="200" style="margin-left:auto; margin-right:auto; border:solid silver 1px; border-radius:4px;"><br>${MainDTO.title}</a><br>${MainDTO.price}원<br></td>										
				</c:forEach>
					</tr>
					<%}%>
			</table>
<jsp:include page="../../views/footer.jsp"/>
</body>
</html>