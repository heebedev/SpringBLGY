<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../views/header_none_banner.jsp"/>
<style type="text/css">
	
</style>
</head>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<body>


	<br><br><br><br>
	
	<c:forEach items="${SearchList}" var="SearchDTO">
	<div id="table${SearchDTO.prdseq}">
<<<<<<< HEAD
	<table style ="margin:5px; border: solid gray 1px; border-radius:8px; float: left; width: 490px; height:150px;">
=======
	<table style ="border: solid gray 1px; border-radius:8px; float: left; width: 500px; height:150px; padding:15px;">
>>>>>>> 8a754e7716132fe20df96401ccd74d2fc5bea847
			<tr>
				<td rowspan="3" style="width: 200px;"><a href ="productDetail?prdseq=${SearchDTO.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img src="http://119.207.169.213:8080/blgy/${SearchDTO.image1}" width=150 height=150 style="border:solid silver 2px; border-radius:4px;"></a></td>										

				<td colspan="2" style="height:40px; font-size:1.5em;">${SearchDTO.title}</td>
				<%if(userdata.getUserseq()>0){ %>		
				<td  style="height:40px;">${SearchDTO.distance} km</td>	
				<%} %>	
			</tr>
			<tr>
				<td style="width: 70px; font-size:0.8em;">대여가능일  </td>
				<td colspan = 2 style=" width: 100px; font-size:0.8em;">${SearchDTO.date1} ~ ${SearchDTO.date2}</td>
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
			}
		}
	}
	
	</script>

	<jsp:include page="../../views/footer.jsp"/>

</body>
</html>
