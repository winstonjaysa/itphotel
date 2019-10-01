<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/travel.css">
<link rel="stylesheet" href="css/room.css"> 
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/6bcee8e3da.js"></script>


<%
	UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");
	String uname=null;
	int uid=0; 
	
	if(session.getAttribute("currentSessionUser")!=null){
		uname=sessionCurrentBean.getUname();
		uid=sessionCurrentBean.getUid();
	}
%>
</head>
<body onresize="resizeNavi()">

<%@include file="naviBar-user.jsp"%>
<div class="main">
	<div class="roomCard">
		<div class="roomImg">
			<img src="img/Room/deluxe1.jpg">
		</div>
		<div class="roomForm">
			<h2 >Executive Room</h2>
			<div class="roomFeatures">
				<h3>Features</h3>
				
					<li>express check-in</li>
					<li>TV with DVD player</li>
					<li>Breakfast at the Executive Club Lounge</li>
					<li>Daily newspaper</li>
					<li>Free pressing of one suit/dress per night</li>
					<li>shoe shine service</li>
					<li>Internet Access</li>	
			</div>
			<form  action="ReservationHandler?action=resRoom" method="post" onsubmit="return confirmInsert()">
				<input type="hidden" name="reservation_type" value="1">
				<input type="hidden" name="uid" value="<%=uid%>">
				<input type="hidden" name="uname" value="<%=uname%>">
				<div class="selectDiv">
					<div class="selectCard" >
						<p>Type of room :</p>
						<select name="air_type">
							<option value="1">A/C</option>
							<option value="2">Non A/C</option>
						</select>
					</div>
						<!--  <input type="radio" name="air_type" value="2" />A/C
						<input type="radio" name="air_type" value="1" />Non A/C	
						 -->
					<div class="selectCard">
						<p>Package type(per day)</p>
						<select name="budget_package_type">
							<option value="1500">Rs-1500</option>
							<option value="1850">Rs-1850(only breakfast)</option>
							<option value="2500">Rs-2500(only lunch + dessert)</option>
							<option value="2500">Rs-2700(only breakfast + lunch & dessert)</option>
							<option value="3200">Rs-3200(Breakfast + Lunch &Dinner)</option>
						</select>
					</div>
				</div>
				<div class="selectDiv">
					<div class="selectCard">
						<p>Check-in</p>
						<input id="datefield1" type='date' name="check_in" min='1899-01-01' max='2022-07-01' onclick="dateGet()"></input>
					</div>
					<div class="selectCard">
						<p>Check-out</p>
						<input id="datefield2" type='date' name="check_out" min='1899-01-01' max='2022-07-01' onclick="dateGet()"></input>
					</div>
				</div>
				<div class="selectDiv">
					<div class="selectCard">
						<p>Adult</p>
						<input type="number" name="adults" max="5" min="0" >
					</div>
					<div class="selectCard">
						<p>Children</p>
						<input type="number" name="children" max="10" min="0">
					</div>
				</div>
						<!-- 	<li><input type="radio" name="budget_package_type" value="1500">Rs-1500</li>
							<li><input type="radio" name="budget_package_type" value="1850">
							Rs-1850(only breakfast)</li>
							<li><input type="radio" name="budget_package_type" value="2500">
							Rs-2500(only lunch + dessert)</li>
							<li><input type="radio" name="budget_package_type" value="2500">
							Rs-2700(only breakfast + lunch & dessert)</li>
							<li><input type="radio" name="budget_package_type" value="3200">
							Rs-3200(Breakfast + Lunch &Dinner)</li>
							 -->
					
						<button type="submit" name="submit">Book now</button>
					
			</form>
		</div>
	</div>
	<div class="roomCard roomCard-reverse" >
		<div class="roomForm">
			<h2 >Presidential Room</h2>
			<div class="roomFeatures">
				<h3>Features</h3>
					<li>express check-in</li>
					<li>Plasma TV with DVD player</li>
					<li>Breakfast at the Executive Club Lounge</li>
					<li>Daily newspaper</li>
					<li>Free pressing of one suit/dress per night</li>
					<li>shoe shine service</li>
					<li>Internet Access</li>	
			</div>
			<form  action="ReservationHandler?action=resRoom" method="post" onsubmit="return confirmInsert()">
				<input type="hidden" name="reservation_type" value="2">
				<input type="hidden" name="uid" value="<%=uid%>">
				<input type="hidden" name="uname" value="<%=uname%>">
				<div class="selectDiv">
					<div class="selectCard" >
						<p>Type of room :</p>
						<select name="air_type">
							<option value="1">A/C</option>
							<option value="2">Non A/C</option>
						</select>
					</div>
						<!--  <input type="radio" name="air_type" value="2" />A/C
						<input type="radio" name="air_type" value="1" />Non A/C	
						 -->
					<div class="selectCard">
						<p>Package type(per day)</p>
						<select name="budget_package_type">
							<option value="1500">Rs-1500</option>
							<option value="1850">Rs-1850(only breakfast)</option>
							<option value="2500">Rs-2500(only lunch + dessert)</option>
							<option value="2500">Rs-2700(only breakfast + lunch & dessert)</option>
							<option value="3200">Rs-3200(Breakfast + Lunch &Dinner)</option>
						</select>
					</div>
				</div>
				<div class="selectDiv">
					<div class="selectCard">
						<p>Check-in</p>
						<input id="datefield1" type='date' name="check_in" min='1899-01-01' max='2022-07-01' onclick="dateGet()"></input>
					</div>
					<div class="selectCard">
						<p>Check-out</p>
						<input id="datefield2" type='date' name="check_out" min='1899-01-01' max='2022-07-01' onclick="dateGet()"></input>
					</div>
				</div>
				<div class="selectDiv">
					<div class="selectCard">
						<p>Adult</p>
						<input type="number" name="adults" max="5" min="0" >
					</div>
					<div class="selectCard">
						<p>Children</p>
						<input type="number" name="children" max="10" min="0">
					</div>
				</div>
						<!-- 	<li><input type="radio" name="budget_package_type" value="1500">Rs-1500</li>
							<li><input type="radio" name="budget_package_type" value="1850">
							Rs-1850(only breakfast)</li>
							<li><input type="radio" name="budget_package_type" value="2500">
							Rs-2500(only lunch + dessert)</li>
							<li><input type="radio" name="budget_package_type" value="2500">
							Rs-2700(only breakfast + lunch & dessert)</li>
							<li><input type="radio" name="budget_package_type" value="3200">
							Rs-3200(Breakfast + Lunch &Dinner)</li>
							 -->
					
						<button type="submit" name="submit">Book now</button>
					
			</form>
		</div>
		<div class="roomImg">
			<img src="img/Room/ROOMS-Executive-Room-Twin_1920x10801.jpg">
		</div>
	</div>
	<div class="roomCard">
		<div class="roomImg">
			<img src="img/Room/deluxe1.jpg">
		</div>
		<div class="roomForm">
			<h2 >Executive Room</h2>
			<div class="roomFeatures">
				<h3>Features</h3>
				
					<li>express check-in</li>
					<li>TV with DVD player</li>
					<li>Breakfast at the Executive Club Lounge</li>
					<li>Daily newspaper</li>
					<li>Free pressing of one suit/dress per night</li>
					<li>shoe shine service</li>
					<li>Internet Access</li>	
			</div>
			<form  action="ReservationHandler?action=resRoom" method="post" onsubmit="return confirmInsert()">
				<input type="hidden" name="reservation_type" value="3">
				<input type="hidden" name="uid" value="<%=uid%>">
				<input type="hidden" name="uname" value="<%=uname%>">
				<div class="selectDiv">
					<div class="selectCard" >
						<p>Type of room :</p>
						<select name="air_type">
							<option value="1">A/C</option>
							<option value="2">Non A/C</option>
						</select>
					</div>
						<!--  <input type="radio" name="air_type" value="2" />A/C
						<input type="radio" name="air_type" value="1" />Non A/C	
						 -->
					<div class="selectCard">
						<p>Package type(per day)</p>
						<select name="budget_package_type">
							<option value="1500">Rs-1500</option>
							<option value="1850">Rs-1850(only breakfast)</option>
							<option value="2500">Rs-2500(only lunch + dessert)</option>
							<option value="2500">Rs-2700(only breakfast + lunch & dessert)</option>
							<option value="3200">Rs-3200(Breakfast + Lunch &Dinner)</option>
						</select>
					</div>
				</div>
				<div class="selectDiv">
					<div class="selectCard">
						<p>Check-in</p>
						<input id="datefield1" type='date' name="check_in" min='1899-01-01' max='2022-07-01' onclick="dateGet()"></input>
					</div>
					<div class="selectCard">
						<p>Check-out</p>
						<input id="datefield2" type='date' name="check_out" min='1899-01-01' max='2022-07-01' onclick="dateGet()"></input>
					</div>
				</div>
				<div class="selectDiv">
					<div class="selectCard">
						<p>Adult</p>
						<input type="number" name="adults" max="5" min="0" >
					</div>
					<div class="selectCard">
						<p>Children</p>
						<input type="number" name="children" max="10" min="0">
					</div>
				</div>
						<!-- 	<li><input type="radio" name="budget_package_type" value="1500">Rs-1500</li>
							<li><input type="radio" name="budget_package_type" value="1850">
							Rs-1850(only breakfast)</li>
							<li><input type="radio" name="budget_package_type" value="2500">
							Rs-2500(only lunch + dessert)</li>
							<li><input type="radio" name="budget_package_type" value="2500">
							Rs-2700(only breakfast + lunch & dessert)</li>
							<li><input type="radio" name="budget_package_type" value="3200">
							Rs-3200(Breakfast + Lunch &Dinner)</li>
							 -->
					
						<button type="submit" name="submit">Book now</button>
					
			</form>
		</div>
	</div>
</div>

	<!-- 	<div class="cateDiv-2" style="display: none;">
	<form action="ReservationHandler" method="post">
		<input type="hidden" name="reservation_type" value="1">
		<input type="hidden" name="uid" value="<%=uid%>">
		<input type="hidden" name="uname" value="<%=uname%>">
		<table
			style="background-color: skyblue; margin-left: 40px; margin-left: 140px">
			<tr>
				<td><h2 style="color: green;">...JUST MAKE A BOOKING IN
						SECONDS...</h2></td>
			</tr>
			<tr>
				<td>* How long do you stay with us?</td>
				<td><input type="text" name="days"></td>
			</tr>
			<tr>
				<td>* What kind of room are you looking for? Mention below.</td>
			</tr>
			
				<tr>
					<td><input type="radio" name="Room_size_type"
						value="0">Smaller
						Room(Just for 2 person)</td>
				</tr>
				<tr>
					<td><input type="radio" name="Room_size_type" value="1">Family
						room</td>
				</tr>
			
			<tr>
				<td>* Your arrival date to our residence?</td>
				<td><input type="text" name="arrival_date"></td>
			</tr>
			<tr>
				<td>* How many rooms do you want to book?</td>
				<td><input type="text" name="rooms_count"></td>
			</tr>
			<tr>
				<td>* What type of room are you looking for?</td>
				<td><input type="radio" name="air_type" value="0" />Air
					Conditioned<input type="radio" name="air_type" value="1" />Non-Air
					Conditioned</td>
			</tr>
			<tr>
				<td>* Do you want mini bar facility? Mention it here by making
					"yes" or "no".</td>
				
				<td><input type="radio" name="mini_bar" value="0" /> Yes, I'm interested.<input type="radio" name="mini_bar" value="1" /> No,I don't want it.</td>
				
				
			</tr>
			<tr>
				<td>* Do you want to access our swimming pool ? Mention it..</td>
				<td><input type="radio" name="swimming_pool" value="0" /> Yes, I'm interested.<input type="radio" name="swimming_pool" value="1" /> No,I don't want it.</td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="BOOK"></td>
			</tr>
		</table>
	</form>
	
	
</div>

 -->
</body>
<script>
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

$("#navigation a").on("click", function(e) {
	e.preventDefault();

	var currTab = $(this).data("tab");
	sessionStorage.setItem("currentTab", currTab);
	$(".panel_main").hide();
	$(currTab).fadeIn();
});

var lastSelectedTab = sessionStorage.getItem("currentTab");
if (!lastSelectedTab) {
	lastSelectedTab = "#tab_1";
}
$(lastSelectedTab).fadeIn();


function dateGet(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("datefield").setAttribute("min", today);
}	

function confirmInsert(){
	
	var doIt=confirm('Do you want to insert the record?');
	  if(doIt){
		 return true;
	   	    }
	  else{
		return false;
	    }
}
</script>
</html>