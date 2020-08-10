<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 상품 목록</title>
<style>
	body{			
		margin:auto;
		max-width:1000px;
		padding: auto;
		overflow: auto;
		
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
	
	.searchbox {
		width: 20%;
		height:20px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px; 
	}
	
		
</style>
</head>
<body>
	
	<% if(request.getAttribute("userseq")!= null && (Integer.parseInt((request.getAttribute("userseq")).toString()) == -1 || Integer.parseInt((request.getAttribute("userseq")).toString()) == 0)){ %>
	<ul>
			<li><a class="home" href="mainForm.bill">홈</a></li>
		<ul style="float:right; list-style-type:none;">
			<li><a href="login.bill">로그인</a></li>
			<li><a href="createAcc.bill">회원가입</a></li>
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
	<br><br>

</body>
</html>