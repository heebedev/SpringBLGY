<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<script>
		function clickFunc() {
			window.close();
		}
</script>
<style>
	.commentCheck {
		border-radius: 8px;
		border: solid 2px Black;
		width:500px;
	}
</style>
<meta charset="UTF-8">
<title>댓글 수정</title>
</head>
<body>
	<div class="container" align="center">
	<div class="commentCheck" align="center" >
	<form action="commentRevDel" method="post" align="center">
		<input type="hidden" name="cmtseq" value="${cmtCheck.cmtseq}">
		<input type="hidden" name="cmtIntstate" value="0">
		<div class="cmtbox" style="width : 450px; height : 200px; margin-top:50px;" align="center">
		<textarea rows="5" cols="40" name="comment" style="border : 0; font-size: 15px; align:center; text-align: center;">${cmtCheck.comment}</textarea></div>
		<h5>입력 일자 : ${cmtCheck.insertdate}</h5>
		<input type="submit" value="수정">
	</form>
		 <button onclick="location.href='commentRevDel?cmtseq=${cmtCheck.cmtseq}&cmtIntstate=1'">삭제</button><br>
	</div>
	</div>
	<div align="center" style="margin-top : 20px;"><button onclick="clickFunc();">닫기</button></div> 
</body>
</html>