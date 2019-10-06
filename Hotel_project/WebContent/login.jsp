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
<link rel="stylesheet" href="css/log-reg.css">
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
<div class="reg-log-main-div">
	<div class="mainImgDiv">
			<img src="img/log-reg/rg_bg_1.jpg">
	</div>
	<div class="mainFormDiv mainFormDiv-log" >
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
				<form action="UserHandler" method="post" >
					<h2>Login</h2>
					<label style="font-size: 14px;margin-top: 10px;font-weight: 600;">Already have an account? <span ><a href="#">Login in.</a></span></label>
					
					<input type="hidden" name="action" value="login">

					<div class="trpdiv_form_div">
						<div class="trpdiv_form_group">
							<div class="trpdiv_form_info trpdiv_form_info-log">
								<label>Username | Email</label>
								<input type="text" name="userName">
							</div>
						</div>
					</div>
					<div class="trpdiv_form_div">
						<div class="trpdiv_form_group">
							<div class="trpdiv_form_info trpdiv_form_info-log">
								<label>password</label>
								<input type="password" name="password">
							</div>
						</div>
					</div>
					<div class="trpdiv_form_group">
							<div class="">
								<label class="container"> 
									<input type="checkbox" name="confirmEmailMessage" ><span class="checkmark"></span>
								</label>
									<span class="condition">Remember me.</span>
							</div>	
					</div>
					<input type="submit" value="Login">
				</form>
			</div>
		</div>
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