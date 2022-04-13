<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!-- 
	 @author Mrudul Tora (0801IT191049)
	 @author Preetam Pratyush Pal (0801IT191059)
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Error</title>
<link rel="icon" type="image/x-icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0AD2r-cwoXE--HSypYTElKmTSLA5ljsU5Nm-6atGZ5rJcYJrMpi3itomljA2kOTEK5s&usqp=CAU">
</head>
<style>
h1 {
	color: white;
}

.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	color: white;
	text-align: center;
}

body {
	margin: 0;
	padding: 0;
	font-family: montserrat;
	background: linear-gradient(120deg, black 10%, #072A6C 70%);
	height: 100vh;
	overflow: hidden;
}

h2 {
	color: white;
}
</style>
<body>
	<center>
		<h1>Error</h1>
		<h2><%=request.getAttribute("error")%></h2>
	</center>
	<div class="footer">
		<p>©CookChef - Mrudul Tora and Preetam Pratyush Pal</p>
	</div>
</body>
</html>