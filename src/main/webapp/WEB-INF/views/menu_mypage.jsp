<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>마이페이지 메뉴</title>
	
	<style>
		
		/* 네비게이션 메뉴  */
		nav {
			width: 150px;
			float: left;
		}
		
		nav ul {
			background-color: black;
			width:150px;
			list-style-type: none;
			margin: 0;
			padding-right: 10px;
		}

		nav li a {
			display: block;
			background-color: black;
			color: #ffffff;
			text-align: center;
			text-decoration: none;
			font-weight: bold;
			width: 150px;
		}
		
		nav li a.current {
			background-color: #D5D1CF;
			color: black;
			
		}
		nav li a:hover:not(.current) {
			background-color: gray;
			color: white;
			text-decoration:underline;
		}
		
		/* 섹션나눔  */
		section {
			border: 1px solid gray;
			margin-left: 160px;
		}
		
		
		
	</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/JavaScript">

	/* 개인정보수정 새창 */
	function goPopup(){
		var pop = window.open("./authority.bill","pop","width=500,height=400, scrollbars=yes, resizable=yes"); 
	}
</script>
<script  type="text/JavaScript">
	/* 쪽지함 새창 */
	function textPopup(){
		var title = "text";
		window.open("", title ,"width=900; height=800;");
		var popup = document.post_footer;
		popup.target = title;
		popup.action = "message.bill";
		popup.submit();
	}
	
</script>

</head>

<body>
	<nav>
		<ul>
			<li><a onclick="goPopup();">개인 정보 수정</a></li>
			<li><a onclick="document.getElementById('mpl').submit();">등록 상품 목록</a></li>
			<li><a onclick="document.getElementById('mbl').submit();">대여 상품 목록</a></li>
			<li><a onclick="document.getElementById('mil').submit();">관심 상품 목록</a></li>
			<li><a onclick="textPopup();">쪽지함</a></li>
		</ul>
	</nav>
	<form name="post_footer" id="post_footer" method="post">
	<input type="hidden" name="userseq" id ="userseq" value="<%=userdata.getUserseq()%>">
	<input type="hidden" name="selection" id ="selection" value="total">
	</form>
	<form name="mpl" id="mpl" action="MyProductList.bill" method="post">
	<input type="hidden" name="userseq" id ="userseq" value="<%=userdata.getUserseq()%>">
	</form>
	<form name="mbl" id="mbl" action="MyBorrowList.bill" method="post">
	<input type="hidden" name="userseq" id ="userseq" value="<%=userdata.getUserseq()%>">
	</form>
	<form name="mil" id="mil" action="MyInterestList.bill" method="post">
	<input type="hidden" name="userseq" id ="userseq" value="<%=userdata.getUserseq()%>">
	</form>
	
		
</body>

</html>