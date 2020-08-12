<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userdata" class="com.springblgy.dto.UserDto" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보관함</title>
	<script type="text/JavaScript">
	
         function msgDetail(textseq, nick_send, nick_receive, message, insertdate) { 
               	var seq = textseq;
               	var send = nick_send;
               	var receive = nick_receive;
               	var msg = message;
               	var date = insertdate;
               	
               	document.getElementById("send").innerHTML = '보낸사람 : ' + send;
               	document.getElementById("receive").innerHTML = '받는사람 : ' + receive;
               	document.getElementById("message").innerHTML = msg;
               	document.getElementById("date").innerHTML = date;
     
        	}
    </script>
	
	<style>
	.item1 { grid-area: header1; height: 40px; width: 100%;}
	.item2 { grid-area: menu; height: 400px; }
	.item3 { grid-area: main; height: 410px; }
	.item4 { grid-area: footer; height: 40px; width: 100%; padding-top:10px;}
	.tablenick_send { grid-area: nicksend;}
	.tablenick_receive { grid-area: nickreceive;}
	.tabledate { grid-area: date;}
	.tablemessage { grid-area: message;}
	.detail_send { grid-area: detailsend; width:458px; font-weight: bold; text-align: left; padding-top:20px; padding-left:20px;}
	.detail_receive { grid-area: detailreceive; width:458px; font-weight: bold; text-align: left; padding-left:20px;}
	.detaildate { grid-area: detaildate; padding-top: 20px; width:458px; }
	.detailmessage { grid-area: detailmessage; width:450px; padding-left:15px; padding-top: 20px;}
	
	
	.grid-container {
	  display: grid;
	  grid-template-areas:
	    'header1 header1'
	    'menu main'
	    'footer footer';
	  grid-gap: 5px;
	  padding: 20px;
	  font-family: sans-serif;
	  width : 800px;
	  border: solid 2px black;
	  border-radius: 8px;
	  }
	
	.item2 {
	  display: grid;
	  grid-template-areas:
	    'nicksend nickreceive'
	    'message'
	    'date';
	  padding: 5px;
	  font-family: sans-serif;
	  overflow: scroll;
	  background-color: rgba(231, 235, 238, 100);
	  border-radius: 8px;
	  
	}
	
	.grid-container > div {
	  text-align: center;
	  font-size: 15px;
	}
	
	form {
		display: inline;
		vertical-align: middle;
	}
	
	.tablemessage {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 280px;
	}
	
	.tablenick_send {
	 float:left;
     font-weight: bold;
	}
	.tablenick_receive {
	 float:right;
     font-weight: bold;
	}

	.tabledate {
    float: right;
	}
	
	.messageTable {
    width: 280px;
    border-top:1px solid silver;
    border-bottom:1px solid silver;
    margin-bottom:5px;
    
	}
	.messageTable:active {
    background-color: silver;
    
	}
	</style>
</head>
<script type="text/javascript">
function validation(){
	var num = <%=userdata.getUserseq()%>+0;
	if(num==0){
		window.location.href = './loginRedirect';
	}
}
</script>

<body style="margin:auto;" onload="validation();">
<br><br>
<center>

<img src="resources/logo.png" alt="logo" height="130" width="240">

		<div class="grid-container">
		  <div class="item1">
		  	<div style="float: left; width: 50%;">
			  	<form action="message" method="post" align="left">
			  		<input type="hidden" value= "<jsp:getProperty property="userseq" name="userdata"/>" name="userseq" id="userseq">
					<input type="radio" name="selection" value="total" checked="checked">전체
					<input type="radio" name="selection" value="receive">받은 쪽지
					<input type="radio" name="selection" value="send">보낸 쪽지
					<input type="submit" value="확인">
			  	</form>
		  	</div>
		  	<div style="float: right; width: 50%;">
		  		<form action="message" method="post" align="right">
				<select name="search">
					<option value="nick_send">보낸 사람</option>
					<option value="nick_receive">받는 사람</option>
					<option value="message">내용</option>
				</select>
					<input type="text" width="100" name="searchText">
					<input type="submit" value="검색">
			  		<input type="hidden" value= "<jsp:getProperty property="userseq" name="userdata"/>" name="userseq" id="userseq">
		  		</form>
		  	</div>
		  </div>
		  <div class="item2">
				<c:forEach items="${msgList }" var="message">
					<div class="messageTable" onClick = "msgDetail(${message.textseq},'${message.nick_send}', '${message.nick_receive}', '${message.message}', '${message.date}')">
						<div class="tablenick_send" text-align="left">보낸 사람 : ${message.nick_send}</div>
						<div class="tablenick_receive" text-align="right">받는 사람 : ${message.nick_receive}</div>
						<div class="tablemessage">${message.message}</div>
						<div class="tabledate" text-align="right">${message.date}</div>
					</div>
				</c:forEach>
			</div>
		  <div class="item3">
			<div class="detailTable">
				<div id="send" class="detail_send" text-align="left"></div>
				<div id="receive" class="detail_receive" text-align="right"></div>
				<div id="message" class="detailmessage"></div>
				<div id="date" class="detaildate" text-align="right"></div>
			</div>
		  </div>  
		  <div class="item4">
		  
		  <a href="messageSend"><input type="button" value="새쪽지"></a>
		  <input type="button" value="닫기" onClick="window.close()"></div>
		</div>
</center>	


</body>
</html>