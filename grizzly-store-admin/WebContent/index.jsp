<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Grizzly Store</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="styles/main.css">
<link rel="stylesheet" href="styles/bootstrap.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script src="scripts/main.js"></script>
<script src="scripts/bootstrap.js"></script>
</head>
<body>
	<div class="container-fluid m">
		<div class="row align-items-center">
			<div class="col-6 mx-auto">
				<div class="text-center">
					<div class="col-12">
						<img src="images/logo.png" width="50%" />
					</div>
					<br>
					<h1 class="display-4 font-size-lg" id="grizzly">GRIZZLY STORE</h1>
					<hr style="height: 2px; border: none; background-color: lightgray;">
					<br>
					<form action="loginAction.jsp" class="form-group" method="post">
						<div class="lead col-4 mx-auto">
							<input type="text" placeholder="&nbsp;&nbsp;Username"
								class="form-control form-rounded" id="username" name="username" />
							<input type="password" placeholder="&nbsp;&nbsp;Password"
								class="form-control form-rounded" id="password" name="password" />
						</div>
						<br>
						<div class="lead col-6 mx-auto">
							<button type="submit" class="btn btn-secondary rounded-circle">
								<span style="color: black">Login</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

</html>