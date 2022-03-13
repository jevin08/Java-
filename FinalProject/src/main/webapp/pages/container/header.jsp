<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	boolean loginUser = Boolean.valueOf((String)session.getAttribute("loggedIn"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Furniture</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
		  <div class="collapse navbar-collapse" id="navbarScroll">
			<a class="navbar-brand" href="">Furniture</a>
			<ul class="navbar-nav me-auto my-2 my-lg-0 " style="--bs-scroll-height: 100px;">
			  <li class="nav-item">
				<a class="nav-link active" aria-current="page" href="">Home</a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="#">Sofa</a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="">Bed</a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="">Dining Table</a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="">Other</a>
			  </li>
			</ul>
			<form class="d-flex me-2" id="search-product">
			  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			  <button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		  </div>
		  		<div class="navbar" style="display:contents">
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					  </button>
		
		  	<%
				if(loginUser){
			%>
				<div class="d-flex dropdown dropstart text-end me-2 mt-1">
					<a href="#" class=" d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
						data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
						<span
							class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
					</a>
					<ul class="dropdown-menu text-small" style="z-index: 1030;" aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									class="bi bi-cart-fill" viewBox="0 0 16 16">
									<path
										d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
								</svg>
								<span
									class="position-relative top-0 start-6 translate-middle badge rounded-pill bg-danger">3</span>
								My Cart
							</a>
						</li>
						<li><a class="dropdown-item" href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									class="bi bi-gear-fill" viewBox="0 0 16 16">
									<path
										d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
								</svg> Settings</a></li>
						<li><a class="dropdown-item" href="profile">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									class="bi bi-person-fill" viewBox="0 0 16 16">
									<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
								</svg> Profile</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="logout">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
							<path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
		   			    </svg> Log out</a>
		   			</li>
					</ul>
				</div>

			<%
				}else{
			%>
			  <div class="text-end mt-1">
				<a class="" href="login"><button type="button" class="btn btn-outline-secondary me-2">Login</button></a>
				<a class=""	 href="signin"><button type="button" class="btn btn-warning">SignIn</button></a>
				<a class=""	 href="cart"><button type="button" class="btn btn-primary">Cart</button></a>
			  </div>

			<%
				}
			%>
			</div>
		</div>
	  </nav>
	
	<div class="modal" tabindex="-1" id="staticBackdrop">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Cart</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
		  <div class="modal-body">
		    <div class="container-fluid">
			  <div class="row">
			  	<div class="col">
	  	    		Product Name
			    </div>
			    <div class="col">
			    	Price
			   	</div>
			  </div>
			  <div class="row">
			    <div class="col">
			   		Product Name
			   	</div>
			   	<div class="col">
			   		Price
		    	</div>
		    </div>
		    <div class="row">
			    <div class="col">
			 		Product Name
			   	</div>
		    	<div class="col">
		    		Price
			   	</div>
			</div>
		   </div>
		  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>