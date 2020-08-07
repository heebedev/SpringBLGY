<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>빌릴꼬냥?</title>
	<style type="text/css">
		body{			
			max-width:1000px;
			margin: 0 auto;
			
		}
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
			background-color: gray;
			color: blue;
			text-decoration:underline;
		}
		li a.home{
			background-color: black;
			color: white;
		}
		div.wrapper{
			display:table;
		}
		div.box{
			display:table-cell;
			vertical-align:middle;
		}
		
		
		input[type="text"] {
			width: 20%;
			height: 25px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
		input[type="date"] {
			width: 20%;
			height: 25px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
		select {
			width: 100px;
			height: 12px;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		}
	div.banner {position: relative; width: 100%; height: 210px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	div.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	div.banner ul li {float: left; width: 1000px; height: 210px; margin:0; padding:0;}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="./jquery-ui-1.12.1/jquery-ui.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

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
			});
		}
		
	}) ;
</script>
</head>

<body>

		<% if(request.getAttribute("userseq")!=null && (Integer.parseInt((request.getAttribute("userseq")).toString()) == -1 || Integer.parseInt((request.getAttribute("userseq")).toString()) == 0)){ %>
	<ul>
			<li><a class="home" href="mainForm.bill">홈</a></li>
			<ul style="float:right; list-style-type:none;">
			<li><a href="login.bill">로그인</a></li>
			<li><a href="signUp.bill">회원가입</a></li>
		</ul>
	</ul>
	
	<%}else{ %>
	<ul>
			<li><a class="home" href="mainForm.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>">홈</a></li>
			<ul style="float:right; list-style-type:none;">
			<li><a href="./MyProductList.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>"><jsp:getProperty property="nickname" name="userdata"/>의 페이지</a></li>
			<li><a href="logOut.bill">로그아웃</a></li>
			<li><a href="./AddProduct.bill">게시글 작성하기</a></li>
		</ul>
	</ul>
	<%} %>
	<center>
	<form action="searchAfter.bill"> 
	<h1 style= "text-align: center;"><a class="home" href="mainForm.bill?userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img alt="logo" src="resources/logo.png" height="130" width="240"></a></h1>
	<input type="text" placeholder ="상품명, 제품명, 지역명 입력" name="search">
	<input type="date" placeholder = "대여 시작일" name="date1" id="date1" />
	<input type="date" placeholder = "대여 만료일" name="date2" id="date2" />
	<input type="hidden" name="userseq" value ="<jsp:getProperty property="userseq" name="userdata"/>">
	<input type="submit" value="검색" style="width: 50px; height:40px; border-radius: 8px; color: white; background-color: black;">
	<select name="selectsearch" id="selectsearch" style="width:100px;height:40px; alignment:right; font-size:10pt;">
		<option value="최신순" selected =true>최신순</option>
		<option value="조회수순" >조회수순</option>
	</select>

	</center> 
	</form>
	<div class="banner">
			<ul>
				<li><img src="https://media.bunjang.co.kr/images/nocrop/471722706.jpg" width="100%" height="210px"></li>
				<li><img src="https://media.bunjang.co.kr/images/nocrop/465890574.jpg" width="100%" height="210px"></li>
				<li><img src="https://media.bunjang.co.kr/images/nocrop/415809298.jpg" width="100%" height="210px"></li>
				<li><img src="https://media.bunjang.co.kr/images/nocrop/472834031.jpg" width="100%" height="210px"></li>
			</ul>
	</div>
	<br><br><br><br>
	

	
	<c:forEach items="${SearchList}" var="SearchDTO"> <!-- var = 변수이름 -->
	<table style ="border: solid gray 1px; border-radius:8px; float: left; width: 500px; height:150px;">
			<tr>				
				<td rowspan="3" style="width: 200px;"><a href ="View.bill?prdseq=${SearchDTO.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>"><img src="${SearchDTO.image1}" width=150 height=150 style="border:solid silver 2px; border-radius:4px;"></a></td>										
				<td colspan="2" style="height:40px; font-size:1.5em;">${SearchDTO.title}</td>		
			</tr>
			<tr>
				<td style="width: 70px; font-size:0.8em;">대여가능일  </td>
				<td style="width: 100px; font-size:0.8em;">${SearchDTO.date1} ~</td>
				<td style="width: 100px; font-size:0.8em;">${SearchDTO.date2}</td>
			</tr>
			<tr>
				<td >${SearchDTO.price}원</td>
				<td style="font-size:0.8em;">조회수 ${SearchDTO.view}</td>
				<c:choose>
				<c:when test="${SearchDTO.liked eq 1}">
				<td><input type="button" value="❤️" onclick="window.open('Like.bill?prdseq=${SearchDTO.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>&liked2=${SearchDTO.liked}','팝업이름','width=1,height=1');" style="flat:right;border: none; background-color:white";></td>
				</c:when>
				<c:otherwise>
				<td><input type="button" value="🖤️" onclick="window.open('Like.bill?prdseq=${SearchDTO.prdseq}&userseq=<jsp:getProperty property="userseq" name="userdata"/>&liked2=${SearchDTO.liked}','팝업이름','width=1,height=1');" style="flat:right;border: none; background-color:white";></td>
				</c:otherwise>
				</c:choose>
			</tr>
	</table>
	</c:forEach>
	<br><br><br>
</body>
</html>