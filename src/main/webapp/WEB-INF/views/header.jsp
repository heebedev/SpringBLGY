<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/JavaScript">
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
	}); 
</script>
<script type="text/javascript">
	function checkvalue(){
	var distance = document.getElementById("str_distance");
	distance.innerHTML = document.getElementById("distance").value+' km';
	}
</script>
<style>
	body{			
		margin:auto;
		max-width:1000px;
		padding: auto;
		
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
		background-color: silver;
		color: purple;
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
		
		
	.search {
		width: 20%;
		height: 25px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px; 
	}
	.date1 {
		width: 20%;
		height: 25px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px;
	 
	}
	
	.date2 {
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
	
	.searchbox {
		width: 200px;
		height:20px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px; 
	}
	div.banner {position: relative; width: 100%; height: 210px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	div.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	div.banner ul li {float: left; width: 1000px; height: 210px; margin:0; padding:0;}
</style>
</head>
<body>
	
	<% int userseq = 0; 
	userseq = userdata.getUserseq();
	if(userseq == 0){ %>
	<ul>
			<li><a class="home" href="mainForm.bill">홈</a></li>
		<ul style="float:right; list-style-type:none;">
			<li><a href="login.bill">로그인</a></li>
			<li><a href="signUp.bill">회원가입</a></li>
		</ul>
	</ul>
	
	<%}else{ %>
	<ul>

			<li><a class="home" href="mainForm.bill">홈</a></li>
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
	<input type="text" class="search" placeholder ="상품명, 제품명, 지역명 입력" name="search">
	<input type="date" class="date1" placeholder = "대여 시작일" name="date1" id="date1" />
	<input type="date" class="date2" placeholder = "대여 만료일" name="date2" id="date2" />
	<input type="hidden" name="userseq" value ="<jsp:getProperty property="userseq" name="userdata"/>">
	<input type="hidden" name="xaxis" value ="<jsp:getProperty property="xaxis" name="userdata"/>">
	<input type="hidden" name="yaxis" value ="<jsp:getProperty property="yaxis" name="userdata"/>">
	<select name="selectsearch" id="selectsearch" style="width:125px;height:40px; alignment:right; font-size:10pt;">
		<option value="P.INSERTDATE" selected =true>최신순</option>
		<option value="P.INSERTDATE DESC" >최신역순</option>
		<option value="P.VIEW" >조회역순</option>
		<option value="P.VIEW DESC" >조회수순</option>
		<option value="P.TITLE" >이름순</option>
		<option value="P.TITLE DESC" >이름 역순</option>
		<% if(userseq > 0){ %>
		<option value="DISTANCE" >가까운 거리순</option>
		<%}%>
	</select>
	<input type="submit" value="검색" style="width: 50px; height:40px; border-radius: 8px; color: white; background-color: black;">
	<br>
	<% if(userseq > 0){ %>
	<table style="float: right; height:25px">
	<td>
	<span id = "str_distance">50 km</span>
	<br>
	<input type="range" id="distance" name="distance" min="10" max="100" onchange="checkvalue();" style="width:150px;height:40px; alignment:right; font-size:10pt;">
	</td>
	</table>
	<%} %>
	</center> 
	</form>
	<center>
	
		<div class="banner" >
			<ul>
				<li><img src="https://media.bunjang.co.kr/images/nocrop/471722706.jpg" width="100%" height="210px"></li>
				<li><img src="https://media.bunjang.co.kr/images/nocrop/465890574.jpg" width="100%" height="210px"></li>
				<li><img src="https://media.bunjang.co.kr/images/nocrop/415809298.jpg" width="100%" height="210px"></li>
				<li><img src="https://media.bunjang.co.kr/images/nocrop/472834031.jpg" width="100%" height="210px"></li>
			</ul>
		</div>
	</center>
	

</body>
</html>