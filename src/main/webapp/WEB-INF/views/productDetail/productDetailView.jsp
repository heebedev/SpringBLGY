<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="userdata" class="com.blgy.dto.UserDto" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function myFunction() {
		  document.getElementById("myDropdown").classList.toggle("show");
		}
	
	window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn')) {
	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
	
	function borrowAct() {
		var gsWin = window.open("about:blank", "BORROW",  'width=500, height=500');
		var brwfrm = document.brwform;
		brwfrm.action = "borrow.bill";
		brwfrm.target = "BORROW";
		brwfrm.submit();
		
	}
	
	function cmtAdd() { 
		var gsWin = window.open("about:blank", "COMMENT");
		var cmtfrm = document.cmtform;
		cmtfrm.action = "commentAdd.bill";
		cmtfrm.target = "COMMENT";
		cmtfrm.submit();
		
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
	
	div.search{		
	}
	div.logo{
	}
	div.posts{
	}
	div.posts-items{
	}
	div.posts-items-title{
	}
	.searchbox {
		width: 20%;
		height:20px;
		padding: 10px 20px; 
		margin:5px 0;			
		border: solid 2px black;
		border-radius: 8px; 
	}
	div.banner {position: relative; width: 100%; height: 210px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	div.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	div.banner ul li {float: left; width: 1000px; height: 210px; margin:0; padding:0;}
	
	.search {
	  text-align: center;
	}
	.dropbtn {
	  font-size: 16px;
	  cursor: pointer;
	}
	 
	.dropdown {
	  position: relative;
	}
	 
	.dropdown-content {
	  display: none;
	  position: relative;
	  top: -20px;
      left: 450px;
      width: 120px;
	  overflow: auto;
	  box-shadow: 0px 8px 8px 0px rgba(0,0,0,0.2);
	  background-color: white;
	}
	 
	.dropdown-content a {
	  color: black;
	  text-decoration: none;
	  font-family : sans-serif;
	  display: block;
	}
	 
	.dropdown a:hover {background-color: #ddd;}
	 
	.show {display: block;}
	
</style>
<style> /* produt Detail style */

	.prdDetail {
		border: solid 2px black;
		border-radius: 8px;
		margin: auto;
		font-family: sans-serif;
		width:860px;
	}
	
	.title {
		text-align: center;
	}
	
	.prImage { grid-area: prImg; height: 400px; width: 400px; background-color: rgba(231, 235, 238, 100); margin-left: 50px;}
	.infoText { grid-area: ifText; height: 230px; }
	.borrow { grid-area: borrow; }
	 
	.detailInfo {
	  display: grid;
	  grid-template-areas:
	    'prImg ifText'
	    'prImg borrow';
	  grid-gap: 5px;
	  font-family: sans-serif;
	  text-align: center;
	  margin-top : 20px;
	  margin-bottom : 20px;
	}
	
	.infoText {
		margin-top: 20px;
		margin-right: 50px;
	}
	
	.borrow {
		border: solid 1px silver;
		border-radius: 8px; 
		margin-right: 50px;
	}
	
	
	.details {
	  margin-left: 50px;
	}
	
	.startDate { grid-area: sd; }
	.endDate { grid-area: ed; }
	.sdatekeyin { grid-area: sdkey; }
	.edatekeyin { grid-area: edkey; }


 	.brwHead {
		display : flex;
		flex-direction: row;
		margin-top:10px;
		width : 94%;
		pedding: 20px;
		
	}
	
	.price {
		flex: 1;
		margin-top:5px;
		
		
	}
	
	.etcInfo {
		flex: 1;
	
	}
 	.date {
 		display: grid;
	  	grid-template-areas:
	    'sd ed'
	    'sdkey edkey';
		border: solid 1px silver;
		border-radius: 5px;
		margin: 10px 2px 10px 2px;
		
	}
	
	.startDate {
		font-size: 18px;
		border-right: solid 1px silver;
		font-weight: bold;

	}
	
	.endDate {
		font-size: 18px;
		font-weight: bold;

	}
	
	.sdatekeyin {
		font-size: 15px;
		border-right: solid 1px silver;
	}
	.edatekeyin {
		font-size: 15px;
	}
	
	.brwBtn {
		margin-top: 15px;
	}
	
	

</style>
<style> /* comment style  */

	.comment {
		margin:auto;
		border: solid 2px black;
		border-radius: 8px;
		font-family: sans-serif;
		width:860px;
		
	}
	
	.commentTable {
		display : flex;
		flex-direction: row;
		margin : 5px;
		margin-left: 20px;
		width : 90%;
	}
	
	.cmtNick {
		flex: 1;
		font-weight: bold;
		flex-basis: 15%;
	}
	
	.cmtText {
		flex: 1;
		flex-basis: 50%;
	}
	
	.cmtDate {
		flex: 1;
		flex-basis: 20%;
	}
	
	.cmtRev {
		flex: 1;
		flex-basis: 5%;
	}
	
	.cmtBtn {
		font-size: 8;
		border:0;
		background-color: white;
	}
	
	.cmtDel {
		flex: 1;
		flex-basis: 5%;
	}
	
	.cmtTxt {
		border-radius: 8px;
		border-top: solid 1px silver;
		vertical-align: middle;
		width:85%;
		height:30px;
		overflow:visible;
		text-overflow:ellipsis;
		margin-left : 20px;
	}

</style>
<style> /* 목록 수정 삭제 style */
	
	.prdFooter {
		display : flex;
		flex-direction: row;
		justify-content: flex-end;
		margin:auto;
		pedding: 20px;
		font-size: 20px;
		font-family: sans-serif;
		width:860px;
		
	}
	
	.list {
		flex: 0 1;
		flex-basis: 20px;
		
	}
	
	.prdRev {
		flex: 0 1;
		flex-basis: 20px;
	
	}
	
	.prdDel {
		flex: 0 1;
		flex-basis: 20px;
	}


</style>


<meta charset="UTF-8">
<title>빌릴꼬냥? 상품 세부정보당</title>
</head>
<body>
	
	<jsp:include page="../../views/header.jsp"/>
	
	<div class="prdDetail">
		<div class="title">
			<h2>${pdDetail.title}</h2>
				<div class="dropdown">
				  <button onclick="myFunction()" class="dropbtn" style=" height:30px; border-radius: 8px; background-color: rgba(231, 235, 238, 100);">${pdDetail.nickname}</button>
				  <div id="myDropdown" class="dropdown-content">
				    <a href="ProductList.bill?userseq=${pdDetail.uploaderseq}" onclick="window.open(this.href,'${pdDetail.nickname}의 정보','width=1000, height=1000'); return false;">사용자 정보</a>
				    <a href="dm.bill?nickname=${pdDetail.nickname}" onclick="window.open(this.href,'${pdDetail.nickname}에게 쪽지 보내기','width=850, height=600'); return false;">쪽지 보내기</a>
				  </div>
				</div>
		</div>
		<div class="details">
			<h4>${pdDetail.hash }</h4>
			<h5>${pdDetail.date1} ~ ${pdDetail.date2}</h5>
		</div>
		<div class="detailInfo">
			<div class="prImage"><img src="${pdDetail.image1}" width="400" height="400"></div>
			<div class="infoText">${pdDetail.info}</div>
			<div class="borrow">
				<div class="brwHead">
					<div class="price">${pdDetail.price } 원 / 일</div>
					<div class="etcInfo">${like} / ${pdDetail.view }</div>
				</div>
				<form name="brwform" action="" method="post">
				<div class="date">
					<div class="startDate">시작</div>
					<div class="sdatekeyin"><input type="date" placeholder="yyyy-mm-dd" name="sdate">
					</div>
					<div class="endDate">끝</div>
					<div class="edatekeyin"><input type="date" placeholder="yyyy-mm-dd" name="edate">
					</div>
				</div>
					<INPUT type="hidden" name="brprdseq" value="<%=request.getParameter("prdseq")%>">
					<INPUT type="hidden" name="userseq" value=<jsp:getProperty property="userseq" name="userdata"/>>
				<div class="brwBtn">
					<input type="button" value="빌리기" onclick="borrowAct();" style="width: 100px; height:30px; border:solid 1px silver; border-radius: 8px; background-color: white;" />
				</div>
				</form>
			</div>
		</div>
	</div> 
	<br><br>
	<div class="comment">
		
			<div class="commentList">
				<c:forEach items="${cmtDetail }" var="cmt">
					<div class="commentTable">
						<div class="cmtNick" >${cmt.nickname} </div>
						<div class="cmtText" style="word-break:break-all">${cmt.comment} </div>
						<div class="cmtDate" >${cmt.insertdate} </div>
						<div class="cmtRev" >
							<c:if test="${cmt.userCheck eq 1}"><input type="button" class="cmtBtn" value="수정/삭제" onclick="window.open('commentCheck.bill?cmtseq=${cmt.cmtseq}','팝업이름','width=500,height=500');" >
							</c:if><!-- !!!!!!!!!!!!!!!!!!10 대신에 나의 userseq 받아오게!!!!!!!!!! -->
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="commentAdd">
				<form name="cmtform" action="" method="post" >
					<INPUT type="hidden" name="prdseq" value="<%=request.getParameter("prdseq")%>">
					<INPUT type="hidden" name="myseq" value=<jsp:getProperty property="userseq" name="userdata"/>> <!-- !!!!!!!!!!!!!!!!!!10 대신에 나의 userseq !!!!!!!!!! -->
					<div class="cmtAdd" style="margin-top:10px; margin-bottom:10px;">
						<input type="text" class="cmtTxt" name="cmtTxt" style="border-radius: 8px; border-top: solid 1px silver; vertical-align: middle;">
						<input type="button" value="등록" onclick="cmtAdd();" style="width: 60px; height:30px; border:solid 1px silver; border-radius: 8px; margin-left:20px; background-color: white;">
					</div>
				</form>
			</div>
	</div>


	<div class="prdFooter"> 
		<div class="list">
				<input type="button" value="목록" onclick="location.href='javascript:history.back()'" >
			</div>
		<c:if test="${pdDetail.uploaderCheck eq 1}">
			
			<div class="prdRev">
				<input type="button" value="수정" onclick="location.href='prdCheck.bill?prdseq=<%=request.getParameter("prdseq")%>'" >
			</div>
			<div class="prdDel">
				<input type="button" value="삭제" onclick="window.open('prdDel.bill?prdseq=<%=request.getParameter("prdseq")%>','게시물 삭제','width=500,height=500');" >
			</div>
		</c:if>
	
	</div>
</body>
</html>