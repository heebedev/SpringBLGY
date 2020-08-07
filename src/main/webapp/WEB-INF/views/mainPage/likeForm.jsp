<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script>
		function clickFunc() {
			window.opener.location.reload();
			window.close();
		}
	</script>
<title>Comment</title>
</head>
<body align="center">
	<%if(request.getAttribute("userseq")!=null && (Integer.parseInt((request.getAttribute("userseq")).toString()) == -1 || Integer.parseInt((request.getAttribute("userseq")).toString()) == 0)){
		%>
		<script>
			alert("로그인후 찜해주시기 바랍니다.");
			window.close();
	</script>
	<%}else{%>
		<script>
			window.opener.location.reload();
			window.close();
	</script>
	<%} %>
</body>
</html>