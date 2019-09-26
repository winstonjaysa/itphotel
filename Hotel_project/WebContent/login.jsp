<%@page import="com.lx.Beans.UserBean"%>
<%@page import="com.lx.Beans.TransManageBeans"%>
<%@page import="java.util.List"%>
<%@page import="com.lx.Dao.TransManageDao"%>
<%@page import="com.lx.Handler.TransManageHandler"%>
<%@page import="com.lx.Handler.UserHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/6bcee8e3da.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Login</title>
</head>
<body>
<%
	UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");
	
	
	if(session.getAttribute("currentSessionUser")!=null){
		response.sendRedirect("index.jsp");
	}
	
%>
	<%@include file="naviBar-user.jsp"%>

	
<div class="trpdiv">
	<span class="status-warning">
		<%
		if(request.getParameter("status")!=null&& request.getParameter("status").equals("wrongvalid")){
			%>
				Wrong username or password entered !
			<% 
		}
		else if(request.getParameter("status")!=null&& request.getParameter("status").equals("loginfirst")){
			%>
				You must login first ! 
			<% 
		}
		%>
	</span>
	<h2>Login</h2>
	<form action="UserHandler" method="post">
		<input type="hidden" name="action" value="login">
		<label>Username | Email</label>
		<input type="text" name="userName">
		<label>password</label>
		<input type="password" name="password">
		<button type="submit">Login</button>
	</form>
</div>
</body>
<script type="text/javascript">
	//document.getElementById("getUrl").value=window.location.href; 

	function functionAcc() {
		document.getElementById("accDropdown").classList.toggle("show");
	}
	window.onclick = function(event) {
		if (!event.target.matches('#acc-img')) {
			var dropdowns = document.getElementsByClassName("acc_ico-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
</script>
</html>