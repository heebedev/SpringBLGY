<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>

	.logoimg { grid-area: limg; }
	.copyright { grid-area: cr; vertical-align: middle;}
	
	.footer {
	  display: grid;
	  grid-template-areas:
	    'limg cr cr cr cr cr cr cr cr cr cr cr cr';
	  grid-gap: 5px;
	  font-family: sans-serif;
	  margin-left: 10px;
	  margin-bottom: 30px;
	  
	}

</style>

<body>

	<div class="footer" style="width:1000px">
		<div class="logoimg">
		<img alt="logo" src="resources/logo.png" height="80" width="130">
		</div>
		<div class="copyright">
		<br>
		<xmp><Copyright 2020. BLGY. ALL rights reserved.></xmp>
		</div>
	</div>
	
	
	
	


</body>
</html>