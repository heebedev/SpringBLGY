<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 상품 목록</title>

	<style type="text/css">
		body{			
			max-width:1000px;
			padding: auto;
			overflow: auto;
			margin: auto;
		}
		div.page {
			border: 1px solid gray;
			overflow: auto;
		}
	
		header{ border: 1px solid gray; }
		ul {
			background-color: white;
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		li { float: left; }
		li a {
			display: block;
			background-color: white;
			color: #000000;
			padding: 8px;
			text-decoration: none;
			text-align: center;
			font-weight: bold;
		}
		li a:hover:not(.current) {
			background-color: silver;
			color: purple;
			text-decoration:underline;
		}
		li a.home{
			background-color: black;
			color: white;
		}
		input[type="date"] {
			width: 20%;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
		input[type="text"] {
			width: 20%;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
		input[type="button"] {
			width: 148px;
			text-align: center;
			padding: 10px 20px; 
			margin:0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
		div.page nav {
			width: 150px;
			float: left;
		}
		
		div.page nav ul {
			background-color: white;
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}

		div.page nav li a {
			display: block;
			background-color: white;
			color: black;
			text-decoration: none;
			text-align: center;
			font-weight: bold;
		}
		
		div.page nav li a input[type="button"]:hover {
			background-color: gray;
			color: white;
			text-decoration:underline;
		}	
		
		
		section {
			border: 1px solid gray;
			margin-left: 150px;
		}
		footer{ border: 1px solid gray; }
	</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/JavaScript">
	function goPopup(){
		var pop = window.open("./authority.bill","pop","width=500,height=400, scrollbars=yes, resizable=yes"); 
	}
	function textPopup(){
		var myseq = document.getElementById('myseq').value;
		window.open("./message.bill?selection=total&myseq="+myseq, "text","width=850; height=550;");	
	}
</script>

</head>

<body>
<div class="page">
		<header>
			<input type="hidden" value= "<jsp:getProperty property="userseq" name="userdata"/>" name="myseq" id="myseq">
	

			<form action="search.bill">
			<ul>
					<li><a class="home" href="mainpage2.bill">홈</a></li>
				<ul style="float:right; list-style-type:none;">
					<li><a href="./MyProductList.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>"><jsp:getProperty property="nickname" name="userdata"/>의 페이지</a></li>
					<li><a href="logOut.bill">로그아웃</a></li>
					<li><a href="AddProduct.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>&xaxis=<jsp:getProperty property="xaxis" name="userdata"/>&yaxis=<jsp:getProperty property="yaxis" name="userdata"/>">게시글 작성하기</a></li>
				</ul>
			</ul>
			<center>
			<h1 style= "text-align: center;"><a class="home" href="mainpage2.bill"><img src="logo.png" alt="logo" height="130" width="240"></a></h1>
			<input type="text" placeholder ="상품명, 제품명, 지역명 입력" name="search">
			<input type="date" placeholder = "대여 시작일" name="date" id="date1" size="12"/>
			<input type="date" placeholder = "대여 만료일" name="date" id="date2" size="12"/>
			<input type="submit" value="검색" style="width: 50px; height:40px; border-radius: 8px; color: white; background-color: black;">
			</center>
			</form>
		</header>

		<nav>
			<ul>
				<li><a><input type="button" value="개인정보수정" onclick="goPopup();"></a></li>
				<li><a href="./MyProductList.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>"><input type="button" value="등록 상품 목록" style="background-color: brown; color:white;"></a></li>
				<li><a href="./MyborrowList.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>"><input type="button" value="대여 상품 목록"></a></li>
				<li><a href="./MyInterestList.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>"><input type="button" value="관심 상품 목록"></a></li>
				<li><a><input type="button" value="쪽지함" onclick="textPopup();"></a></li>
			</ul>
		</nav>
		
		
		
		<section>
		
		<table>
		
		<c:forEach items="${MyProductList}" var="dto">
		<tr>
			<td style="width: 200px; height:200px; padding-left:30px; "><a href="./productDetail.bill?prdseq=${dto.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img src="${dto.image1}" width= "200px" height="200px" style="border: solid gray 1px; border-radius:4px;"></a></td>
			<td style="width: 650px; height:200px; padding-right:50px;text-align:right; list-style-type:none;">${dto.title}<br><br>${dto.price}원</td>
		</tr>
		
		</c:forEach>	
		</table>
	
		</section>
</div>

</body>

</html>