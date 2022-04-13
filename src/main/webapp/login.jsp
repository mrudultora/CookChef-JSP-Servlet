<!DOCTYPE html>
<html>
<!-- 
	 @author Mrudul Tora (0801IT191049)
	 @author Preetam Pratyush Pal (0801IT191059)
-->
<title>CookChef - Login</title>
<head>
<link rel="icon" type="image/x-icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh0AD2r-cwoXE--HSypYTElKmTSLA5ljsU5Nm-6atGZ5rJcYJrMpi3itomljA2kOTEK5s&usqp=CAU">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />


<style>
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

nav {
	background: linear-gradient(60deg, black 20%, #072A6C 90%);
}

.center {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	background: white;
	border-radius: 10px;
}

.center h1 {
	text-align: center;
	padding: 0 0 20px 0;
	border-bottom: 1px solid silver;
}

.center h2 {
	text-align: center;
	padding: 0 0 20px 0;
	border-bottom: 1px solid silver;
}

.center form {
	padding: 0 40px;
	box-sizing: border-box;
}

form .txt_field {
	position: relative;
	border-bottom: 2px solid #adadad;
	margin: 30px 0;
}

.txt_field input {
	width: 100%;
	padding: 0 5px;
	height: 40px;
	font-size: 16px;
	border: none;
	background: none;
	outline: none;
}

input[type="submit"] {
	width: 100%;
	height: 50px;
	border: 1px solid;
	background: linear-gradient(120deg, black 10%, #072A6C 70%);
	border-radius: 25px;
	font-size: 18px;
	color: #e9f4fb;
	font-weight: 700;
	cursor: pointer;
	overflow: none;
}

input[type="submit"]:hover {
	border-color: #2691d9;
	transition: .5s;
}

.signup_link {
	margin: 30px 0;
	text-align: center;
	font-size: 16px;
	color: blackc;
}

.signup_link a {
	color: blue;
	text-decoration: none;
}

.signup_link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<%
	if (request.getSession().getAttribute("username") != null) {
		response.sendRedirect("/CookChef/recipe-list.jsp");
	}
	%>
	<main class="page">
		<div class="center">
			<h2>CookChef - Login</h2>
			<form action="LoginDetails" method="post">
				<div class="txt_field">
					<input type="text" required placeholder="Username" name="username">
				</div>
				<div class="txt_field">
					<input type="password" required placeholder="Password"
						name="password">
				</div>
				<input type="submit" value="Login">
				<div class="signup_link">
					Not a member? <a href="signup.jsp">Sign Up</a>
				</div>
			</form>
		</div>
	</main>
	<div class="footer">
		<p>©CookChef - Mrudul Tora and Preetam Pratyush Pal</p>
	</div>
</body>

</html>