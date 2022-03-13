<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>furniture</title>
<style>
	.popup{
	position: absolute;
    width: 50%;
    top: 40%;
    left: 25%;
    z-index: 100;
    color: red;
    margin: 0;
    }
	.hide{
		visibility: hidden;
	}
</style>
</head>
<body>
  	<%
		String err = (String) session.getAttribute("error-message");
		String info = (String) session.getAttribute("info-message");
		String suc = (String) session.getAttribute("suc-sign-messege");
		session.setAttribute("error-message", null);
		session.setAttribute("info-message", null);
		session.setAttribute("suc-sign-messege", null);
	%>
	<div class="popup <% if(err==null&&info==null&&suc==null) out.print("hide"); %>">
	  <% if (err != null){ %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
			<%=err%>
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	  <% }else if(info != null){ %>
		<div class="alert info-info alert-dismissible fade show" role="alert">
			<%=info%>
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	  <% }else if(suc != null){ %>
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			<%=suc%>
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	  <% } %>
    </div>
</body>
</html>