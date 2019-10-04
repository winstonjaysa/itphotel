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
<script src="validation/reg.js"></script>
<title>Register</title>
</head>
<body>
<%
	UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");

	if(session.getAttribute("currentSessionUser")!=null){
		response.sendRedirect("index.jsp");
	}
%>
	<%@include file="naviBar-user.jsp"%>


	<div class="trpdiv customtrpdiv" style="width: 830px;">
	<div id="error_message"></div>
		<form action="UserHandler" method="post" onsubmit="return validate();">
			<h2>Register</h2>
			<div id="error_message"></div>
			<input type="hidden" name="action" value="register"> 
			<div class="trpdiv_form_div" >
				<div style="padding: 10px;">
					<label>User Name </label>
					<input type="text" name="uname" id="uname">
					<label>Password</label>
					<input type="text" name="pwd" id="pwd">
				</div>
				<div style="padding: 10px;">
					<label>Phone Number</label>
					<input type="text" name = "phone" id="phone">
					<label>Email</label>
					<input type="text" name = "email" id="email">
					<label>firstName </label>
					<input type="text" name="fname" id="fname">
					<label>lastName </label>
					<input type="text" name="lname" id="lname">
				</div>
			</div>
			<input type="submit" value="Register">
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