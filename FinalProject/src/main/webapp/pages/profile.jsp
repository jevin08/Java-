<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.btn-file {
		position: relative;
		overflow: hidden;
	}

	.btn-file input[type=file] {
		position: absolute;
		top: 0;
		right: 0;
		min-width: 100%;
		min-height: 100%;
		font-size: 100px;
		text-align: right;
		filter: alpha(opacity=0);
		opacity: 0;
		outline: none;
		background: white;
		cursor: inherit;
		display: block;
	}

	#photo-svg {
		display: none;
		position: absolute;
		transform: translate(-50%, -50%);
		opacity: 50%;
		top: 50%;
		left: 50%;
	}
</style>
</head>
<body>
	<%@ include file="container/header.jsp" %>	
	<% 
		final int AGE_LIMIT = 12;
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		date.setYear(date.getYear()-AGE_LIMIT);
		String profile="./ProfileImages/default.jpg";
	%>
	<div class="global-container">
		<div class="d-flex justify-content-center py-5">
		<form class="container rounded border border-primary w-100 d-flex" action="validateUpdate" method="Post">
			<div class="left col w-50 p-3">
				<div class="col-12 text-center">
					<a id="profileLink" href="<%= profile %>" onmouseover="onHover();" onmouseout="offHover();">
						<span class="btn btn-default btn-file">
							<img id="profileImg" src="<%= profile %>" style="width:150px; height:150px; border-radius:50%" alt="Profile Photo" />
							<svg id="photo-svg" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
								<path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
								<path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z" />
							</svg>
							<input id="upload-img" oninput="readUrl(this);" type="file">
						</span>
					</a>
					<div id="profileHelp" class="form-text"></div>
					<div class="invalid-feedback">Please upload profile photo.</div>
				</div>

				<div class="row pt-2">
					<label for="email" class="form-label">Email</label>
					<input type="email" class="form-control" name="email" value="${customer.getEmail()}" id="email" placeholder="Enter Email Address here" aria-describedby="emailHelp" required>
					<div id="emailHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a email id.</div>
				</div>
			</div>
			<div class="right col w-50 p-3">
				<div class="row pt-2">
					<label for="fname" class="form-label">First Name</label>
					<input type="text" class="form-control" name="fname" id="fname" value="${customer.fanme}" placeholder="Enter First Name here" aria-describedby="fNameHelp" required>
					<div id="fNameHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a first name.</div>
				</div>
				<div class="row pt-2">
					<label for="lname" class="form-label">Last Name</label>
					<input type="text" class="form-control" name="lname" id="lname" value="${lname}" placeholder="Enter Last Name here" aria-describedby="lNameHelp" required>
					<div id="lNameHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a last name.</div>
				</div>
				<div class="row pt-2">
					<label for="phone" class="form-label">Primary phone number</label>
					<input type="text" class="form-control" name="phone" id="phone" value="${phone}" placeholder="Enter Primary Phone Number here" aria-describedby="phoneHelp" required>
					<div id="phoneHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a primary phone number.</div>
				</div>
				<div class="row pt-2">
					<label for="sec-phone" class="form-label">Secondary phone number</label>
					<input type="text" class="form-control" name="sec-phone" id="sec-phone" value="${secPhone}" placeholder="Enter Secondary Phone number here" aria-describedby="secPhoneHelp" required>
					<div id="secPhoneHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a secondary phone number name.</div>
				</div>
				<div class="row pt-2">
					<label for="bdate" class="form-label">Birth Date</label>
					<input type="date" min=0 class="form-control" name="bdate" id="bdate" value="${bdate}" placeholder="Enter Birth Date here" aria-describedby="bDateHelp" max="<%= (new SimpleDateFormat("yyyy-MM-dd")).format(date) %>" required>
					<div id="bDateHelp" class="form-text"></div>
					<div class="invalid-feedback">Please enter a birth date.</div>
				</div>
				<div class="pt-2">
					<button type="submit" class="btn btn-primary">Update</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	<%@ include file="container/popUp.jsp" %>
	<script>
		function onHover() {
			document.querySelector("#photo-svg").style.display = "block";
		}
		function offHover() {
			document.querySelector("#photo-svg").style.display = "none";
		}
		function readUrl(path) {
			console.log("before if");
			if (path.files && path.files[0]) {
				console.log("before fileread");
				var reader = new FileReader();
				reader.onload = function (e) {
					console.log("before editing");
					$('#profileImg').attr('src', e.target.result).width(150).height(150);
				};
				console.log("before render");
				reader.readAsDataURL(path.files[0]);
			}

		}
	</script>
</body>
</html>