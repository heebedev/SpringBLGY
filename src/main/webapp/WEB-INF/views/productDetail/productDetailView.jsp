<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"/>
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
</script>
<script>
	function borrowAct(prdseq, userseq, sdate, edate) {
		
		if(userseq == "" || userseq == 0 || userseq == null){
			
			alert("로그인후 이용 가능합니다.");
		}else{
		$.ajax({
			url : "borrow",
			type : "GET",
			dataType : "text", 
			data : {
				prdseq : prdseq.value,
				userseq : userseq,
				date1 : sdate.value,
				date2 : edate.value
			},
			success:function (args) {
				location.reload();
			}, 
			error:function (e) {
				console.log(e);
			}
		});
		}	
	}
	function borrowDelete(prdseq, userseq, rentseq) {
		
			$.ajax({
				url : "borrowDelete",
				type : "GET",
				dataType : "text", 
				data : {
					prdseq : prdseq.value,
					userseq : userseq,
					rentseq : rentseq
				},	
				success:function (args) {
					location.reload();
				}, 	
				error:function (e) {
					console.log(e);
				}
			});
			}	
		
</script>
<script>
	function cmtAdd() { 
		var gsWin = window.open("about:blank", "COMMENT");
		var cmtfrm = document.cmtform;
		cmtfrm.action = "commentAdd.bill";
		cmtfrm.target = "COMMENT";
		cmtfrm.submit();
	}
	
	function like(prdseq, userseq, likeBtn) {		
		console.log(prdseq);
		console.log(userseq);
		
		if(userseq == "" || userseq == 0 || userseq == null){
			
			alert("로그인후 이용 가능합니다.");
		}else{
		$.ajax({
			url : "like.bill",
			type : "GET",
			dataType : "text", 
			data : {
				prdseq : prdseq,
				userseq : userseq
			},
			success:function (args) {
			}, 
			error:function (e) {
				console.log(e);
			}
		});
		
		if (likeBtn.value == "❤️") {
			$("#likeBtn" + prdseq).val("🖤");
		} else {
			$("#likeBtn" + prdseq).val("❤️");
			}
		}
	}
	
</script>


<style> /* produt Detail style */

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
      left: 500px;
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

	.prdDetail {
		border: solid 2px black;
		border-radius: 8px;
		margin: auto;
		font-family: sans-serif;
		width:1000px;
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
	
	.startDatePick {
		font-size: 18px;
		border-right: solid 1px silver;
		font-weight: bold;
		padding: 10px 20px; 

	}
	
	.endDatePick {
		font-size: 18px;
		font-weight: bold;
		padding: 10px 20px; 

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
		width:1000px;
		
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
		width:1000px;
		
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
	
	

	<jsp:include page="../../views/header_none_banner.jsp"/>
	
	<br><br><br><br><br>
	
	<div class="prdDetail">
		<div class="title">
			<h2>${pdDetail.title}</h2>
				<div class="dropdown">
				  <button onclick="myFunction()" class="dropbtn" style=" height:30px; border-radius: 8px; background-color: rgba(231, 235, 238, 100);">${pdDetail.nickname}</button>
				  <div id="myDropdown" class="dropdown-content">
				    <a href="ProductList.bill?userseq=${pdDetail.uploaderseq}" onclick="window.open(this.href,'${pdDetail.nickname}의 정보','width=1000, height=1000'); return false;">사용자 정보</a>
				    <a href="messageSend?nickname=${pdDetail.nickname}" onclick="window.open(this.href,'${pdDetail.nickname}에게 쪽지 보내기','width=850, height=600'); return false;">쪽지 보내기</a>
				  </div>
				</div>
		</div>
		<div class="details">
			<h4>${pdDetail.hash }</h4>
			<h5>${pdDetail.date1} ~ ${pdDetail.date2}</h5>
		</div>
		<div class="detailInfo">
			<div class="prImage"><img src="http://119.207.169.213:8080/blgy/${pdDetail.image1 }" width="400" height="400"></div>
			<div class="infoText">${pdDetail.info}</div>
			<div class="borrow">
				<div class="brwHead">
					<div class="price">${pdDetail.price } 원 / 일</div>
					<div class="etcInfo">
					<c:choose>
			<c:when test="${pdDetail.liked eq 1}">
				<td><input  type="button" id="likeBtn${pdDetail.prdseq}" value="❤️" onclick="like(${pdDetail.prdseq}, <jsp:getProperty property="userseq" name="userdata"/>, this)" style="flat:right;border: none; background-color:white"></td>
				</c:when>
				<c:otherwise>
				<td><input  type="button" id="likeBtn${pdDetail.prdseq}" value="🖤️" onclick="like(${pdDetail.prdseq}, <jsp:getProperty property="userseq" name="userdata"/>, this)" style="flat:right;border: none; background-color:white"></td>
				</c:otherwise>
				</c:choose> / ${pdDetail.view }</div>
				</div>
				<form name="brwform" action="" method="post">
				<div class="date">
					<div class="startDatePick">시작</div>
					<div class="sdatekeyin"><input type="date" placeholder="yyyy-mm-dd" value="2019-09-22" min="${pdDetail.date1}" max="${pdDetail.date2}" name="sdate" id="sdate" >
					</div>
					<div class="endDatePick">끝</div>
					<div class="edatekeyin"><input type="date" placeholder="yyyy-mm-dd" value="2019-09-22" min="${pdDetail.date1}" max="${pdDetail.date2}" name="edate" id="edate">
					</div>
				</div>
					<INPUT type="hidden" name="brprdseq" value="<%=request.getParameter("prdseq")%>" id="prdseq">
					<INPUT type="hidden" name="userseq" value=<jsp:getProperty property="userseq" name="userdata"/>>
				<div class="brwBtn">
					<input type="button" value="빌리기" onclick="borrowAct(prdseq, <jsp:getProperty property="userseq" name="userdata"/>, sdate, edate)" style="width: 100px; height:30px; border:solid 1px silver; border-radius: 8px; background-color: white;" />
					
				</div>
				</form>
			</div>
		</div>
		<table  style ="width: 1000px; height:50px; padding:15px; text-align:center; padding:20px;">
				<tr>
					<th>대여한사람</th>
					<th>대여 시작일</th>
					<th/>
					<th>대여 마감일</th>
				</tr>
				<c:forEach items="${borrowList}" var="borrow">
				<tr>
					<td>${borrow.nickname}</td>
					<td>${borrow.date1}</td>
					<td>~</td>
					<td>${borrow.date2}</td>
					<c:if test="${borrow.usercheck eq 1}">
					<td><input type="button" value="빌리기취소" onclick="borrowDelete(prdseq, <jsp:getProperty property="userseq" name="userdata"/>, ${borrow.rentseq})" style="width: 100px; height:30px; border:solid 1px silver; border-radius: 8px; background-color: white;" /></td>
					</c:if>				
				</tr>
				</c:forEach>
		</table>
			
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