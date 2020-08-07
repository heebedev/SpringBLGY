<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품정보 수정</title>

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
		/* input[type="text"] {
			width: 40%;
			padding: 10px 20px; 
			margin:5px 0;			
			border: solid 2px black;
			border-radius: 8px; 
		} */
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


<script type="text/javascript">
function confirm_alert(node) {
    return confirm("정말로 삭제하시겠습니까?");
}

function modify_confirm_alert(node) {
    return confirm("상품 정보 수정 완료!");
}


</script>
</head>

<body>
<div class="page" align="center">
		<header>
			<ul>
					<li><a class="home" href="/adminmain.bill">홈</a></li>
				<ul style="float:right; list-style-type:none;">
					<li><a href="logOut.bill">로그아웃</a></li>
				</ul>
			</ul>
				
		</header>

		<nav>
				<ul>
				<li><a href="./adminUser.bill">회원 관리</a></li>
				<li><a href="./adminproductlist.bill">상품 관리</a></li>
				<!-- <li><a href="./adminborrowlist.bill">대여 관리</a></li> -->
			</ul>
		</nav>



		<section>

			<h1 style="text-align: center;">"${AdminPrdUpdate.title}"상품 정보 수정</h1>

		
			<form action="adminproductmodify.bill" method="post">
				<table border="0">
					<tr>
						<td style="text-align: right;">상품번호</td>
						<td><input type="text" name="prdseq" size="5" readonly="readonly" value="${AdminPrdUpdate.prdseq}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">올린사람</td>
						<td><input type="text" name="uploaderseq" size="5" readonly="readonly" value="${AdminPrdUpdate.uploaderseq}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">상품명</td>
						<td><input type="text" name="newtitle" size="40" value="${AdminPrdUpdate.title}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">가격</td>
						<td><input type="text" name="newprice" size="40" value="${AdminPrdUpdate.price}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">대여 기간</td>
						<td><input type="date" name="newdate1" size="40" value="${AdminPrdUpdate.date1}"> ~ <input type="date" name="newdate2" size="40" value="${AdminPrdUpdate.date2}"></td>
					</tr>
					<tr>
						<td style="text-align: right;">상품내용</td>
						<td><textarea rows="10" cols="50" name="newinfo"> ${AdminPrdUpdate.info}</textarea></td>
					</tr>
					<tr>
						<td style="text-align: right;">해시태그</td>
						<td><textarea rows="10" cols="50" name="newhash"> ${AdminPrdUpdate.hash}</textarea></td>
					</tr>
									
					<tr>
						<td colspan="2"><input type="submit" value="수정" onclick="return modify_confirm_alert(this);">
							&nbsp;&nbsp;&nbsp; <a href="adminproductlist.bill">목록보기</a> &nbsp;&nbsp;&nbsp;
							<a href="adminproductdelete.bill?prdseq=${AdminPrdUpdate.prdseq}" onclick="return confirm_alert(this);">삭제</a></td>
					</tr>

				</table>
			</form>

		</section>
	</div>

</body>

</html>