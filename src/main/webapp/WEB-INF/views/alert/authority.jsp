<%@page import="com.springblgy.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>
<body style="margin: 50px;">
<form action="authorize.bill" method="post">
<h2>사용자확인</h2>
<input type="password" placeholder="비밀번호를 입력하세요." name="pw" style="width:300px; height:30px;border: solid black 2px; margin: 5px; border-radius:8px;">
<input type="hidden" name="userseq" value=<jsp:getProperty property="userseq" name="userdata"/>>
<input type="submit" value="확인" style="width:60px; height:40px;border: solid black 2px; margin: 5px; border-radius:8px;">
</form>
</body>
</html>