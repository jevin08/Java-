<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
   List<String>	colors = new ArrayList();
   colors.add("Red");
   colors.add("Pink");
   colors.add("Yellow");
   colors.add("white");

%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Add Product</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		@media (min-width: 576px) {
			.modal-dialog {
				max-width: 100% !important;
			}
		}

		table,
		tr,
		td,
		th {
			text-align: center;
		}

		.preview_img {
			max-width: 300px;
			max-height: 300px;
		}
	</style>
</head>

<body>
	<%@ include file="container/header.jsp" %>
	<div class="container d-flex justify-content-center py-5 row">
		<form class="rounded border border-primary p-3" action="" method="POST" enctype="multipart/form-data">
			<table id="myTable" class="table table-striped table-hover table-sm container">
				<tr>
					<th style="text-align:center"><b>URL/File</b></th>
					<th style="text-align:center"><b>Upload images</b></th>
					<th style="text-align:center"><b>Color</b></th>
				</tr>
			</table>
			<button class="btn btn-primary" onclick="addRow()">Add</button>
			<div class="col-12">
				<label for="name" class="form-label">Product Name</label>
				<input type="text" class="form-control" name="pname" id="pname" aria-describedby="pNameHelp" required>
				<div id="pNameHelp" class="form-text"></div>
				<div class="invalid-feedback">Please enter a product name.</div>
			</div>
			<div class="col-12">
				<label for="discription" class="form-label">Product Description</label>
				<textarea class="form-control" name="pdiscription" id="pdiscription" aria-describedby="pDiscHelp"
					required></textarea>
				<div id="pDiscHelp" class="form-text"></div>
				<div class="invalid-feedback">Please enter a product description.</div>
			</div>
			<div class="col-12">
				<label for="price" class="form-label">Product Price</label>
				<input type="number" step="0.01" min=0 class="form-control" name="price" id="price"
					aria-describedby="pPriceHelp" required>
				<div id="pPriceHelp" class="form-text"></div>
				<div class="invalid-feedback">Please enter a product price.</div>
			</div>
			<button type="submit" class="btn btn-primary col-12 mt-2">Add Product</button>
		</form>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<!-- Vertically centered modal -->
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-dialog" style="max-width: 90%!important; width:auto">
				<div class="modal-content bg-transparent">
					<div class="modal-header border-bottom-0 btn-secondary" data-bs-dismiss="modal" aria-label="Close">
						<svg xmlns="http://www.w3.org/2000/svg" role="button" width="24" height="24" fill="currentColor"
							class="bi bi-arrows-angle-contract" viewBox="0 0 16 16">
							<path fill-rule="evenodd"
								d="M.172 15.828a.5.5 0 0 0 .707 0l4.096-4.096V14.5a.5.5 0 1 0 1 0v-3.975a.5.5 0 0 0-.5-.5H1.5a.5.5 0 0 0 0 1h2.768L.172 15.121a.5.5 0 0 0 0 .707zM15.828.172a.5.5 0 0 0-.707 0l-4.096 4.096V1.5a.5.5 0 1 0-1 0v3.975a.5.5 0 0 0 .5.5H14.5a.5.5 0 0 0 0-1h-2.768L15.828.879a.5.5 0 0 0 0-.707z" />
						</svg>
					</div>
					<div class="modal-body">
						<img id="model-image1" width="100%" height="100%" />
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="container/popUp.jsp" %>
	<script type="text/javascript">
		let index = 0;
		let colorOption = '<select id="selct-clr" class="form-select"><option selected>Select color</option> <% for(int i=0; i<colors.size(); i++){ %><option value="<%= colors.get(i) %>"><%= colors.get(i) %></option><% } %> </select>';
		//'<option selected>Select color</option><option value=""></option>';
		function photoChange(This) {
			var reader = new FileReader();
			if (This.files[0].type.indexOf("image") == -1) {
				alert("Invalid Type");
				$("#image1").attr("src", "blank");
				$("#image1").hide();
				$('#photo1').wrap('<form>').closest('form').get(0).reset();
				$('#photo1').unwrap();
				return false;
			}
			reader.onload = function (e) {
				// get loaded data and render thumbnail.
				document.getElementById("model-image1").src = e.target.result;
			};
			// read the image file as a data URL.
			reader.readAsDataURL(This.files[0]);
		};

		function urlChange(This) {
			console.log(This.value);
			document.getElementById("model-image1").src = This.value;
		}

		function changeFormat(This) {
			let index = This.id.replace("format", "");
			let photoDivId = "photo-div" + index;
			val = This.value;
			// val==1 then its is url
			if (val == 1) {
				document.getElementById(photoDivId).innerHTML = `<input type="url" name="url${index}" id="url${index}" onchange="urlChange(this)">`;
			} else {
				document.getElementById(photoDivId).innerHTML = `<input type="file" name="photo${index}" id="photo${index}" accept="image/*" onchange="photoChange(this)">`;
			}
		}

		function addRow() {
			index++;
			let containt = `<tr><td><select name="format${index}" id="format${index}" onchange="changeFormat(this)"><option value="0">File</option><option value="1">URL</option></select></td><td><div class="d-flex"><div id="photo-div${index}"><input type="file" name="photo${index}" class="p-1" id="photo${index}" accept="image/*"></div><button type="button" class="btn" id="photo-btn${index}" data-bs-toggle="modal"onclick="showModel(this)"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor"class="bi bi-arrows-angle-expand" viewBox="0 0 16 16"><path fill-rule="evenodd"d="M5.828 10.172a.5.5 0 0 0-.707 0l-4.096 4.096V11.5a.5.5 0 0 0-1 0v3.975a.5.5 0 0 0 .5.5H4.5a.5.5 0 0 0 0-1H1.732l4.096-4.096a.5.5 0 0 0 0-.707zm4.344-4.344a.5.5 0 0 0 .707 0l4.096-4.096V4.5a.5.5 0 1 0 1 0V.525a.5.5 0 0 0-.5-.5H11.5a.5.5 0 0 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 0 .707z" /></svg></button><button type="button" class="btn" id="delete-btn${index}" onclick="deleteRow(this);"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="text-danger bi bi-x-lg" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/><path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/></svg></button></div></td><td><select class="form-select${index}" >${colorOption}</select></td></tr>`;
			let tbody = document.createElement('tbody');
			tbody.setAttribute('id', 'tbody-' + index);
			tbody.innerHTML = containt;
			document.getElementById("myTable").appendChild(tbody);
		}

		addRow();

		function deleteRow(This) {
			if (confirm("Do you realy wan't to delete this ?")) {
				let index = This.id.replace("delete-btn", "");
				document.getElementById("myTable").removeChild(document.getElementById(`tbody-${index}`));
			}
		}

		function showModel(This) {
			console.log(This.id);
			let index = This.id.replace("photo-btn", "");
			let photoId = "photo" + index;
			let urlId = "url" + index;
			if (document.getElementById(urlId) != null) {
				if (document.getElementById(urlId).value == "") {
					return;
				}
				$("#staticBackdrop").modal("show");
				return;
			}
			if (document.getElementById(photoId).files.length == 0) {
				$("#staticBackdrop").modal("hide");
				return;
			}
			photoChange(document.getElementById(photoId));
			$("#staticBackdrop").modal("show");
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>