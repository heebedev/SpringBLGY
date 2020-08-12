<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지보내기</title>
<style>
.item1 { 
	height: 250px;
	width: 400px;
	align: center;
	font-family: sans-serif;
	border-radius: 8px;
    border: solid 2px Black;
    vertical-align: middle;
   
   }
   
   .receive {
   	margin-top : 20px;
   	margin-left : 20px;
   	margin-bottom : 20px;

   
   }
   
   .contextTitle {
   	border-top: 1px dashed black;
   	vertical-align: middle;
   
   }
   .msgContext {
   	margin-top : 5px;
   	vertical-align: middle;

   }
</style>

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
	<h1 style= "text-align: center;"><a class="home" href="Mainpage.bill"><img src="resources/logo.png" alt="logo" height="130" width="240"></a></h1>
	<div class="container" align="center">
	<div class="item1" align="center">
		<form action="messageSendAfter" method="post" text-align = "center">
			<div width="400px" align="left" class="receive" > 받는 사람 : 
				<c:choose>
			      <c:when test="${not empty param.nickname}">
			        <input type="text" class="nick_receive" name="nickname" value=<%= request.getParameter("nickname") %> readonly="readonly" style="width:250px;">
			      </c:when>
			      <c:otherwise>
			         <input type="text" class="nick_receive" name="nickname" placeholder ="닉네임을 입력해주세요." style="width:250px;">
			      </c:otherwise>
			    </c:choose>
			</div>
			<div class="contextTitle"> <br>메세지 입력 </div>
			<div width="400px" style="vertical-align: center" class="msgContext">
			<textarea rows="8" cols="40" name="message" style="border: none;"></textarea>
			</div>
			<input type="hidden" name="userseq" value=<jsp:getProperty property="userseq" name="userdata"/>>		
	</div>
		<div width="400px" style="margin-top:20px;"  ><input type="submit" value="보내기"> </div>
		</form>
	</div>

</body>
</html>