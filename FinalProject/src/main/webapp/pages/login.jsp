<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarScroll">
				<a class="navbar-brand" href="./">Furniture</a>
				<ul class="navbar-nav me-auto my-2 my-lg-0 "
					style="-bs-scroll-height: 100px;">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="./">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="./">Sofa</a></li>
					<li class="nav-item"><a class="nav-link" href="./">Bed</a></li>
					<li class="nav-item"><a class="nav-link" href="./">Dining
							Table</a></li>
					<li class="nav-item"><a class="nav-link" href="./">Other</a></li>
				</ul>
				<form class="d-flex me-2" action="./" id="search-product">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
			<div class="navbar" style="display: contents">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarScroll"
					aria-controls="navbarScroll" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="text-end mt-1">
					<a class="" href="login">
						<button type="button" class="btn btn-outline-secondary me-2">Login</button>
					</a>
					<a class="" href="signin">
						<button type="button" class="btn btn-warning">SignIn</button>
					</a>
				</div>
			</div>
		</div>
	</nav>


	<div class="global-container">
		<div class="d-flex justify-content-center py-5">
			<form class="rounded border border-primary p-3 w-25" action="validateLogin" method="Post">
				<div class="mb-4">
					<label for="uname" class="form-label">User name</label>
					 <input type="text" class="form-control" name="uname" id="uname" aria-describedby="nameHelp" required>
					<div id="nameHelp" class="form-text"></div>
				</div>
				<div class="mb-4">
					<label for="upass" class="form-label">Password</label>
					<input type="password" class="form-control" name="password" id="password" required>
				</div>
				<button type="submit" class="btn btn-primary">Login</button>
				<label>Don't have account? </label>
				<a href="signin">SignIn</a>
			</form>
		</div>
	</div>
	<%@ include file="container/popUp.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>