<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script>
		function cancelFunc() {
			window.close();
		}
	</script>
<title>게시물 삭제</title>
</head>
<body align="center">
	<h3>정말로 삭제하시겠습니까?</h3>
	<button onclick="location.href='productDelete?prdseq=<%=request.getParameter("prdseq")%>&userseq=<%=request.getParameter("userseq")%>'">확인</button> <br><br>
	
	<button onclick="cancelFunc();">취소</button>
</body>
</html>