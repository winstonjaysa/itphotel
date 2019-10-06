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
<script src="validation/reg.js"></script>
<title>Register</title>
</head>
<body>
	<%
		UserBean sessionCurrentBean = (UserBean) session.getAttribute("currentSessionUser");

		if (session.getAttribute("currentSessionUser") != null) {
			response.sendRedirect("index.jsp");
		}
	%>
	<%@include file="naviBar-user.jsp"%>

	<div class="reg-log-main-div">
		<div class="mainImgDiv">
			<img src="img/log-reg/rg_bg_1.jpg">
		</div>
		<div class="mainFormDiv mainFormDiv-reg">
			<div class="trpdiv">
				<div id="error_message"></div>
				<form action="UserHandler" method="post" onsubmit="return validate();">
					<h2>Registration</h2>
					<h6 style="font-size: 16px;font-weight: 300;">Sign up now to receive exclusive offers and promotions.<br>
						In order to receivethe best deals that are customized to your wants.
					</h6>
					<label style="font-size: 14px;margin-top: 10px;font-weight: 600;">Already have an account? <span ><a href="#">Login in.</a></span></label>
					<div id="error_message"></div>
				
					<input type="hidden" name="action" value="register">
					<div class="trpdiv_form_div">
						<div class="trpdiv_form_group">
							<div class="trpdiv_form_info trpdiv_form_info-reg">
							<label>firstName </label>
							<input type="text" name="fname" id="fname" placeholder="First name"> 
							</div>
							<div class="trpdiv_form_info trpdiv_form_info-reg">
							<label>lastName </label> 
							<input type="text" name="lname" id="lname" placeholder="Last name">
							</div>
						</div>
						<div class="trpdiv_form_group">
							<div class="trpdiv_form_info trpdiv_form_info-reg">
							<label>User Name </label> 
							<input type="text" name="uname" id="uname" placeholder="User name">
							</div>
							<div class="trpdiv_form_info trpdiv_form_info-reg"> 
							<label>Password</label> 
							<input type="password" name="pwd" id="pwd" placeholder="Password">
							</div>
						</div>	
						<div class="trpdiv_form_group">
							<div class="trpdiv_form_info trpdiv_form_info-reg">
							<label>Email</label> 
							<input type="text" name="email" id="email" placeholder="Email"> 
							</div>
							<div class="trpdiv_form_info trpdiv_form_info-reg">
							<label>Phone Number</label> 
							<input type="text" name="phone" id="phone" placeholder="Tele-phone"> 
							</div>
						</div>
						<div class="trpdiv_form_group">
							<div class="">
								<label class="container"> 
									<input type="checkbox" name="confirmEmailMessage" ><span class="checkmark"></span>
								</label>
									<span class="condition">Yes,I want to receive emails.</span>
							</div>	
						</div>
						<div class="trpdiv_form_group">
							<div>
								<label class="container"> 
									<input type="checkbox" name="confirmEmailMessage" ><span class="checkmark"></span>
								</label>
									<span class="condition">I agree to the 
															<span ><a href="#">Terms</a></span>,
															<span ><a href="#">Privacy Policy</a></span> and 
															<span ><a href="#">Fees</a></span>.
															
									</span>
							</div>	
						</div>
					</div>
					<input type="submit" value="Sign Up">
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