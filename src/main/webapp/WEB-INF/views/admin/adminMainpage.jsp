<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>

	<style type="text/css">
		body{			
			width:1000px;
			margin:auto;
			padding: auto;
			overflow: auto;
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
		input[type="text"] {
			width: 40%;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
		div.page nav {
			width: 150px;
			float: left;
		}
		
		div.page nav ul {
			background-color: black;
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}

		div.page nav li a {
			display: block;
			background-color: black;
			color: white;
			padding: 8px;
			text-decoration: none;
			text-align: center;
			font-weight: bold;
		}
		
		div.page nav li a:hover {
			color: purple;
			text-decoration:underline;
		}	
		
		
		section {
			border: 1px solid gray;
			margin-left: 150px;
		}
		footer{ border: 1px solid gray; }
	</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script language="JavaScript">
	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();
		var $bannerHeight = $banner.children().outerHeight();
		var $length = $banner.children().length;
		var rollingId;

		rollingId = setInterval(function() { rollingStart(); }, 5000);
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() {
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				$(this).find("li:first").remove();
				$(this).css("left", 0);
				setInterval() >= {
				}, 5000;
			});
		}
	}); 
</script>

</head>

<body>
<div class="page" align="center">
		<header>
			<ul>
					<li><a class="home" href="./adminmain.bill">홈</a></li> 
					<li><a class="home" href="./Mainpage.bill">빌릴꼬양</a></li>
				<ul style="float:right; list-style-type:none;">
					<li><a href="logOut.bill">로그아웃</a></li>
				</ul>
			</ul>
				
		</header>

		<nav>
				<ul>
				<li><a href="./adminUser.bill">회원 관리</a></li>
				<li><a href="./adminproductlist.bill">상품 관리</a></li>
				<!-- <li><a href="./adminborrow.bill">대여 관리</a></li> -->
			</ul>
		</nav>
		
		
		
		<section>
		
		<h1 style="text-align: center;">Today's 빌릴꼬냥</h1>
		<table>
		<tr>
		<td width="200">
		<h3 style="text-align: center;">회원 가입<br><br>${adminMainCountUser }건</h3>
		</td>
		<td width="200">
			<h3 style="text-align: center;">상품 등록<br><br>${adminMainCountProduct }건</h3></td>
		<td width="200"><h3 style="text-align: center;">상품 대여<br><br>${adminMainCountBorrow }건</h3></td>
		</tr>
		</table>
	
		</section>
</div>

</body>

</html>