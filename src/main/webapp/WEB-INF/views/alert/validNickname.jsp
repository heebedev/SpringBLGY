<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script type="text/javascript">
window.opener.document.form.dup.value = "false";
window.opener.document.form.nickname.readOnly = "true";
alert( '사용가능한 닉네임 입니다.');
self.close();
</script>
</body>
</html>