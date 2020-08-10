<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../views/header.jsp"/>
</head>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<body>


	<br><br><br><br>
	
	<c:forEach items="${SearchList}" var="SearchDTO"> <!-- var = 변수이름 -->
	<div id="table${SearchDTO.prdseq}">
	<table style ="border: solid gray 1px; border-radius:8px; float: left; width: 500px; height:150px;">
			<tr>
				<td rowspan="3" style="width: 200px;"><a href ="productDetail?prdseq=${SearchDTO.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img src="${SearchDTO.image1}" width=150 height=150 style="border:solid silver 2px; border-radius:4px;"></a></td>										

				<td colspan="2" style="height:40px; font-size:1.5em;">${SearchDTO.title}</td>		
			</tr>
			<tr>
				<td style="width: 70px; font-size:0.8em;">대여가능일  </td>
				<td style="width: 100px; font-size:0.8em;">${SearchDTO.date1} ~</td>
				<td style="width: 100px; font-size:0.8em;">${SearchDTO.date2}</td>
			</tr>
			<tr>
				<td >${SearchDTO.price}원</td>
				<td style="font-size:0.8em;">조회수 ${SearchDTO.view}</td>
				<c:choose>
			<c:when test="${SearchDTO.liked eq 1}">
				<td><input  type="button" id="likeBtn${SearchDTO.prdseq}" value="❤️" onclick="like(${SearchDTO.prdseq}, <jsp:getProperty property="userseq" name="userdata"/>, this)" style="flat:right;border: none; background-color:white"></td>
				</c:when>
				<c:otherwise>
				<td><input  type="button" id="likeBtn${SearchDTO.prdseq}" value="🖤️" onclick="like(${SearchDTO.prdseq}, <jsp:getProperty property="userseq" name="userdata"/>, this)" style="flat:right;border: none; background-color:white"></td>
				</c:otherwise>
				</c:choose>
			</tr>
	</table>
	</div>
	</c:forEach>
	<br><br><br>

	<script>
		
	function like(prdseq, userseq, likeBtn) {		
		console.log(prdseq);
		console.log(userseq);
		
		if(userseq == "" || userseq == 0 || userseq == null){
			
			alert("로그인후 이용 가능합니다.");
		}else{
		$.ajax({
			url : "like.bill",
			type : "GET",
			dataType : "text", 
			data : {
				prdseq : prdseq,
				userseq : userseq
			},
			success:function (args) {
			}, 
			error:function (e) {
				console.log(e);
			}
		});
		
		if (likeBtn.value == "❤️") {
			$("#likeBtn" + prdseq).val("🖤");
		} else {
			$("#likeBtn" + prdseq).val("❤️");
			}ß
		}
	}
	
	</script>
</body>
</html>


