<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<input type="hidden" name="userseq" id="userseq" value=<jsp:getProperty property="userseq" name="userdata"/>>
</form>
<script>
window.location.href = './MyProductList.bill?userseq='+document.getElementById('userseq').value;
</script>
</body>
</html>