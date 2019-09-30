<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>


<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/travel.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/6bcee8e3da.js"></script>

</head>

<body>

<%@include file="naviBar-user.jsp" %>
<div class="main">

	<section>
		<div class="headTitle">
			<h2>Nearby Events</h2>
		</div>
		<div class="main_img_location_div">
			<div class="img_location">
				<img src="img/event/event1.jpg">
				<div class="details">
					<h2 >street</h2>
					<a href="#f1"><h4 id="ArugamBay" onclick="funcDestination('ArugamBay')">Booknow</h4></a>
				</div>
			</div>
			<div class="img_location">
				<img src="img/event/event2.jpg">
				<div class="details">
					<h2 >Lantern Festival</h2>
					<a href="#f1"><h4 onclick="funcDestination('HortonPlace')">Booknow</h4></a>
				</div>
			</div>
			<div class="img_location">
				<img src="img/event/event3.jpg">
				<div class="details">
					<h2 >Food Festival</h2>
					<a href="#f1"><h4 onclick="funcDestination('YalaPark')">Booknow</h4></a>
				</div>
			</div>
			<div class="img_location">
				<img src="img/event/event4.jpg">
				<div class="details">
					<h2 >Music Fest</h2>
					<a href="#f1"><h4 onclick="funcDestination('Trincomalee')">Booknow</h4></a>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="travel_main" id="f1">
			<div class="title_div">
				<h3>Find the Adventure of a lifetime</h3>
			</div>
			<div class="travel_req">
				<form action="EventHandler" method="post">
					<input type="hidden" name="action" value="insert" />
					
					<div class="find_item">
						<label >Event</label>
						<input type="text" name="Event" id="dLocation" placeholder="Destination" required >
	
					</div>
					<div class="find_item">
						<label >Cost (lkr)</label>
						<input type="number" name="cost1" id="travelCost" placeholder="Cost" required >
	
					</div>
					<div class="find_item">
						<label>Need Date </label>
						<input id="datefield" type='date' name="needdate1" min='1899-01-01' max='2022-07-01' onclick="dateGet()"></input>
						<!-- <input type="date" name="needdate" required="required" class="gg"> -->
					</div>
					<button type="submit">Arrange</button>
				</form>
			</div>
		</div>
	</section>


</body>




</html>