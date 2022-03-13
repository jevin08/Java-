<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
	/* Carousel base class */
	.carousel {
	  margin-bottom: 4rem;
	}
	/* Since positioning the image, we need to help out the caption */
	.carousel-caption {
	  bottom: 3rem;
	  z-index: 10;
	}
	
	/* Declare heights because of positioning of img element */
	.carousel-item {
	  height: 32rem;
	}
	.carousel-item > img {
	  position: absolute;
	  top: 0;
	  left: 0;
	  min-width: 100%;
	  height: 32rem;
	}

</style>
</head>
<body>
	<%@ include file="container/header.jsp" %>
	
	<!-- Navbar fixed -->
	<nav class="sticky-top">
	  <ul class="nav navbar justify-content-center navbar-light bg-light">
		<li class="nav-item">
		  <a class="nav-link active" href="#">
			<button type="button" class="btn btn-secondary" data-bs-toggle="offcanvas" data-bs-target="#filter-area"
		aria-controls="filter-area">Filter</button>
		  </a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="#">
			<button type="button" class="btn btn-secondary" data-bs-toggle="offcanvas" data-bs-target="#sort-area"
		aria-controls="sort-area">Sort</button>
		  </a>
		</li>
	  </ul>
	</nav>
	
	<main>
		<section>
			<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
							<rect width="100%" height="100%" fill="#777" />
						</svg>
		
						<div class="container">
							<div class="carousel-caption text-start">
								<h1>Example headline.</h1>
								<p>Some representative placeholder content for the first slide of the carousel.</p>
								<p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
							<rect width="100%" height="100%" fill="#777" />
						</svg>
		
						<div class="container">
							<div class="carousel-caption">
								<h1>Another example headline.</h1>
								<p>Some representative placeholder content for the second slide of the carousel.</p>
								<p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
							<rect width="100%" height="100%" fill="#777" />
						</svg>
		
						<div class="container">
							<div class="carousel-caption text-end">
								<h1>One more for good measure.</h1>
								<p>Some representative placeholder content for the third slide of this carousel.</p>
								<p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</section>
		<section>
			<div class="album py-5 bg-light">
				<div class="container">
				  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				   	<% for(int i=0; i<5; i++){ %>
						<div class="col">
						  <div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				
							<div class="card-body">
							  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
							  <div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
								  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
								  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
								</div>
								<small class="text-muted">9 mins</small>
							  </div>
							 </div>
						   </div>
						 </div>
					  <% } %>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	
	<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="filter-area"
		aria-labelledby="filter-area-label">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Filter Products</h5>
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<!-- Main filtering -->
			
		</div>
	</div>
	
	<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="sort-area"
		aria-labelledby="sort-area-label">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Sort Product</h5>
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
		</div>
	</div>
	
	<%@ include file="container/popUp.jsp" %>
</body>
</html>