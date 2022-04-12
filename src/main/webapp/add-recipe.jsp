<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 
	 @author Mrudul Tora (0801IT191049)
	 @author Preetam Pratyush Pal (0801IT191059)
-->
<html>
<head>
<title>CookChef - Add Recipe</title>
<link rel="icon" type="image/x-icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0AD2r-cwoXE--HSypYTElKmTSLA5ljsU5Nm-6atGZ5rJcYJrMpi3itomljA2kOTEK5s&usqp=CAU">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<style>
body {
	margin: 0;
	padding: 0;
	background: linear-gradient(120deg, black 10%, #072A6C 70%);
	height: 100vh;
	overflow: hidden;
}

nav {
	background: linear-gradient(60deg, black 20%, #072A6C 90%);
}

label {
	display: inline-block;
	float: left;
	clear: left;
	width: 150px;
	text-align: left;
}

input {
	display: inline-block;
	float: left;
}

.vertical-center {
	margin: 0;
	position: absolute;
	right: 50%;
}
</style>
<body>
	<%
	if (request.getSession().getAttribute("username") == null) {
		response.sendRedirect("/CookChef/login.jsp");
	}
	%>
	<header>
		<nav class="navbar navbar-toggleable-md navbar-dark bg-faded">
			<div>
				<b> <a class="navbar-brand" href="#"> <img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0AD2r-cwoXE--HSypYTElKmTSLA5ljsU5Nm-6atGZ5rJcYJrMpi3itomljA2kOTEK5s&usqp=CAU"
						style="width: 50px; height: 50px;" /> Add Recipe
				</a></b>
			</div>
			<ul class="navbar-nav ml-auto">
				<li>
					<%
					if (request.getSession().getAttribute("username") != null) {
					%> <a href="#" style="color: white;" align="right"><%=request.getSession().getAttribute("username")%></a><br>
					<a href="/CookChef/Logout" style="color: white;">Logout</a> <%
 } else {
 %> <a href="/CookChef/login.jsp" style="color: white;">Login</a> <%
 }
 %>
				</li>
			</ul>

		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card"
			style="background-color: white; border-radius: 10px;">
			<div class="card-body">
				<form action="AddDetails" method="post"
					enctype="multipart/form-data">
					<label><b>Title: </b></label><input type="text" name="title"
						required style="width: 400px; border: 1px solid black;"><br>
					<br> <label><b>Cooking Time: (in minutes)</b></label> <input
						type="number" name="cooking-time"
						style="width: 400px; border: 1px solid black;" required><br>
					<br> <label><b>Recipe:</b></label>
					<textarea name="recipe"
						style="height: 200px; width: 400px; border: 1px solid black;"
						required></textarea>
					<br> <br> <label><b>Ingredients:</b></label>
					<textarea name="ingredients"
						style="height: 150px; width: 400px; border: 1px solid black;"
						required></textarea>
					<br> <br> <label><b>Select Image:</b></label> <input
						type="file" name="image" accept="image/*" required><br>
					<br> <input class="vertical-center" type="submit"
						value="Submit" name="submit"
						style="background: linear-gradient(120deg, black 20%, #072A6C 90%); color: white; width: 100px;">
				</form>
			</div>
		</div>
	</div>
</body>
</html>