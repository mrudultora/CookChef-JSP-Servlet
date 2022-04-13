<%@page import="com.cookchef.dao.LoginSignUpDao"%>
<%@page import="com.cookchef.dao.RecipeDao"%>
<%@page import="com.cookchef.model.RecipeModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- 
	 @author Mrudul Tora (0801IT191049)
	 @author Preetam Pratyush Pal (0801IT191059)
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {
	margin: 0;
	padding: 0;
	background: linear-gradient(120deg, black 10%, #072A6C 70%);
	height: 100vh;
	overflow-x: hidden;
	overflow-y: scroll;
}

h1 {
	text-align: center;
	color: #072A6C;
}

h3 {
	text-align: center;
	color: #072A6C;
}

p {
	font-size: 120%;
}

img {
	float: left;
}

b {
	color: #072A6C;
}

a {
	color: inherit;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

.card {
	overflow-x: hidden;
	overflow-y: hidden;
}

nav {
	background: linear-gradient(120deg, black 10%, #072A6C 70%);
}
</style>
<meta charset="ISO-8859-1">
<%
try {
	int id = Integer.parseInt(request.getParameter("id"));
	RecipeModel recipeModel = new RecipeDao().getRecipe(id);
	if (recipeModel == null) {
		throw new Exception();
	}
	String username = new LoginSignUpDao().getUserName(recipeModel.getUserId());
%>
<title><%=recipeModel.getTitle()%></title>
<link rel="icon" type="image/x-icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0AD2r-cwoXE--HSypYTElKmTSLA5ljsU5Nm-6atGZ5rJcYJrMpi3itomljA2kOTEK5s&usqp=CAU">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<nav class="navbar navbar-toggleable-md navbar-dark bg-faded">
			<div>
				<b> <a class="navbar-brand" href="#"> <img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0AD2r-cwoXE--HSypYTElKmTSLA5ljsU5Nm-6atGZ5rJcYJrMpi3itomljA2kOTEK5s&usqp=CAU"
						style="width: 50px; height: 50px; margin-right: 15px;" /> <%=recipeModel.getTitle()%>
				</a></b>
			</div>
			<ul class="navbar-nav ml-auto">
				<li>
					<%
					if (request.getSession().getAttribute("username") != null) {
						if (username.equals(request.getSession().getAttribute("username"))) {
					%> <a href="/CookChef/EditOrUpdate?action=edit&id=<%=id%>"
					style="color: white;" align="right">Edit</a><br> <a
					href="/CookChef/EditOrUpdate?action=delete&id=<%=id%>"
					style="color: white;">Delete</a> <%
 } else {
 %> <a href="#" style="color: white;" align="right"><%=request.getSession().getAttribute("username")%></a><br>
					<a href="/CookChef/Logout" style="color: white;">Logout</a> <%
 }
 } else {
 %> <a href="/CookChef/login.jsp" style="color: white;">Login</a> <%
 }
 %>
				</li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="card"
		style="margin: 20px; border-width: 3px; border-color: #072A6C;">
		<article style="padding: 15px;" charset="UTF-8">
			<img src="images/<%=recipeModel.getImageFileName()%>"
				alt="Food Image"
				style="margin: 10px; width: 300px; height: 300px; border: 2px solid #072A6C; padding: 2px">
			<p>
			<h1>
				<u><%=recipeModel.getTitle()%></u>
			</h1>
			<p>
				<b><u>Cooking Time:</u></b><br>
				<%=recipeModel.getCookingTime()%>
				minutes
			</p>
			<p>
				<b><u>Ingredients:</u></b><br>
				<%=recipeModel.getIngredients()%>
			</p>
			<p>
				<b><u>Recipe:</u></b><br>
				<%=recipeModel.getRecipe()%>
			</p>
			<p>
				<b><u>Uploaded By:</u></b><br>
				<%=username%>
			</p>
			</p>
		</article>
	</div>
</body>
<%
} catch (Exception e) {
request.setAttribute("error", "No such recipe id exists. Try Again!");
RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
rd.forward(request, response);
}
%>
</html>