<%@page import="com.cookchef.dao.LoginSignUpDao"%>
<%@page import="com.cookchef.dao.RecipeDao"%>
<%@page import="com.cookchef.model.RecipeModel"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 
	 @author Mrudul Tora (0801IT191049)
	 @author Preetam Pratyush Pal (0801IT191059)
-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CookChef</title>
<link rel="icon" type="image/x-icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0AD2r-cwoXE--HSypYTElKmTSLA5ljsU5Nm-6atGZ5rJcYJrMpi3itomljA2kOTEK5s&usqp=CAU">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<style>
nav {
	background: linear-gradient(120deg, black 10%, #072A6C 70%);
}

.card {
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.2);
	padding: 5px;
	margin: 10px;
	text-align: center;
	background-color: #f1f1f1;
}

body {
	margin: 0;
	max-width: 100%;
	padding: 0;
	overflow-y: scroll;
	overflow-x: hidden;
}

a {
	color: inherit;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}
</style>
<body>

	<header>
		<nav class="navbar navbar-toggleable-md navbar-dark bg-faded">
			<div>
				<b> <a class="navbar-brand" href="#"> <img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0AD2r-cwoXE--HSypYTElKmTSLA5ljsU5Nm-6atGZ5rJcYJrMpi3itomljA2kOTEK5s&usqp=CAU"
						style="width: 50px; height: 50px;" /> CookChef
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

	<div class="row">

		<div class="container">
			<h3 class="text-center">List of Recipes</h3>
			<hr>
			<div class="container text-left">

				<a href="add-recipe.jsp" class="btn"
					style="background: linear-gradient(120deg, black 10%, #072A6C 70%);; color: white;">Add
					New Recipe</a>
			</div>
			<br>
			<%
			List<RecipeModel> list = new RecipeDao().getAllRecipes();
			int x = 0;
			for (RecipeModel rm : list) {
				String username = new LoginSignUpDao().getUserName(rm.getUserId());
				if (x % 3 == 0) {
			%>
			<div class="row">
				<%
				}
				%>
				<div class="col-4" style="width: 270px;">
					<a class="card" href="recipe-info.jsp?id=<%=rm.getId()%>"
						style="width: 270px; border-width: 1px; border-color: #072A6C;">
						<img src="images/<%=rm.getImageFileName()%>" alt="Food Image"
						style="width: 260px; height: 240px;">
						<div class="container">
							<h4 style="color: #072A6C;">
								<b><%=rm.getTitle()%></b>
							</h4>
							<p>
								Uploaded By:
								<%=username%>
							</p>
						</div>
					</a>
				</div>
				<%
				x++;
				if (x % 3 == 0) {
				%>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>
</body>
</html>