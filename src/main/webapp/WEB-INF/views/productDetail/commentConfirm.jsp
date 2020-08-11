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
	<h3>댓글이 ${cmtstate } 되었습니다.</h3>
	<button onclick="clickFunc();">확인</button>
</body>
</html>