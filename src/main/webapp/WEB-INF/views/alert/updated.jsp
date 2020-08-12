<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Not Found</title>
</head>
<body>
<script>
window.opener.location = '/controller/logOut.bill';
self.close();
alert("정보 등록이 완료되었습니다. \n 재로그인 해주시기 바랍니다.");
</script>
</body>
</html>