<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/main.css">
<script src="validation/user-contactus.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/6bcee8e3da.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
/*	UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");
	String uname=null;
	int uid=0;
	if(session.getAttribute("currentSessionUser")==null){
		response.sendRedirect("index.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null){
		uname=sessionCurrentBean.getUname();
		uid=sessionCurrentBean.getUid();
	} */
%>
<%@include file="naviBar-user.jsp"%>

<div class="trpdiv customtrpdiv">
<div id="error_message"></div>
	<form action="ContactusHandler" method="post" onsubmit="return validate();">
		<input type="hidden" name="action" value="insert">
	<!-- 	<input type="hidden" name="uid" value="<%//uid%>">  
		<label>User name : <%//uname%></label> -->
		<label>User name</label>
		<input type="text" name="uname" id="uname">
		<br>
		<label>email</label>
		<input type="text" name="email" id="email">
		<label>subject</label>
		<!-- <input type="text" name="subject" id="subject">  -->
		<select name="subject" id="subject">
			<option >Travel</option>
			<option >Laundry</option>
			<option >Reservation</option>
			<option >Feedback</option>
			
			
		</select>
		<label>message</label>
		<input type="text" name="message" id="message">
		<label>date</label>
		<input type="date" name="date">
		
		<button type="submit">submit</button>
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