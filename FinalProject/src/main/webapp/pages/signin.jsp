<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<% 
	final int AGE_LIMIT = 12;
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	date.setYear(date.getYear()-AGE_LIMIT);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.form-control{
	width: 95%;
	margin-left: 10px;
	margin-right: 15px;
}
</style>

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
		<form class="container rounded border border-primary w-100 d-flex" action="validateSignin" method="Post">
			<div class="left col w-50 p-3">
				<div class="row pt-2">
					<label for="uname" class="form-label">User name</label>
					<input type="text" class="form-control" name="uname" id="uname" placeholder="Enter User Name here" aria-describedby="nameHelp" required>
					<div id="nameHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a user name.</div>
				</div>
				<div class="row pt-2">
					<label for="email" class="form-label">Email</label>
					<input type="email" class="form-control" name="email" id="email" placeholder="Enter Email Address here" aria-describedby="emailHelp" required>
					<div id="emailHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a email id.</div>
				</div>
				<div class="row pt-2">
					<label for="upass" class="form-label">Password</label>
					<input type="password" class="form-control" name="password" id="password" placeholder="Enter Password here" aria-describedby="passHelp"  required>
					<div id="passHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a Password.</div>
				</div>
				<div class="row pt-2">
					<label for="uconfirmpass" class="form-label">Confirm Password</label>
					<input type="password" class="form-control" name="confirm-password" id="confirm-password" placeholder="Reenter Password here" aria-describedby="confirm-passHelp"  required>
					<div id="confirm-passHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a confirm password.</div>
				</div>
				<div class="py-2">
					<label>Already have account? </label>
					<a href="login">Login</a>
				</div>
			</div>
			<div class="right col w-50 p-3">
				<div class="row pt-2">
					<label for="fname" class="form-label">First Name</label>
					<input type="text" class="form-control" name="fname" id="fname" placeholder="Enter First Name here" aria-describedby="fNameHelp" required>
					<div id="fNameHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a first name.</div>
				</div>
				<div class="row pt-2">
					<label for="lname" class="form-label">Last Name</label>
					<input type="text" class="form-control" name="lname" id="lname" placeholder="Enter Last Name here" aria-describedby="lNameHelp" required>
					<div id="lNameHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a last name.</div>
				</div>
				<div class="row pt-2">
					<label for="phone" class="form-label">Primary phone number</label>
					<input type="text" class="form-control" name="phone" id="phone" placeholder="Enter Primary Phone Number here" aria-describedby="phoneHelp" required>
					<div id="phoneHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a primary phone number.</div>
				</div>
				<div class="row pt-2">
					<label for="sec-phone" class="form-label">Secondary phone number</label>
					<input type="text" class="form-control" name="sec-phone" id="sec-phone" placeholder="Enter Secondary Phone number here" aria-describedby="secPhoneHelp" required>
					<div id="secPhoneHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a secondary phone number name.</div>
				</div>
				<div class="row pt-2">
					<label for="bdate" class="form-label">Birth Date</label>
					<input type="date" min=0 class="form-control" name="bdate" id="bdate" placeholder="Enter Birth Date here" aria-describedby="bDateHelp" max="<%= (new SimpleDateFormat("yyyy-MM-dd")).format(date) %>" required>
					<div id="bDateHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a birth date.</div>
				</div>
				<div class="pt-2">
					<button type="submit" class="btn btn-primary">SignIn</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	<%@ include file="container/popUp.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>