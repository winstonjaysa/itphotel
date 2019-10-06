<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.lx.Beans.*" %>
<%@page import="com.lx.Dao.ReservationDao" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/travel.css">
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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style type="text/css">
.summary{
	position:relative;
	display:flex;
	flex-wrap:wrap;
	width:100%;
	top:10px;
	left:50px;
	margin-bottom: 50px;
}
.summary section {
	display: flex;
	flex-wrap: wrap;
}
.ui-tabs-anchor {
	outline: none;
	width: 1200px;
	height: 800px;
}

.container canvas {
	height=320px;
}

.container {
	width: 420PX;
	height: 330px !important;
	padding: 15px;
	background: #f2f5fb;
	margin: 10px 10px;
}
.summary{
	position:relative;
	display:flex;
	flex-wrap:wrap;
	width:100%;
	top:10px;
	left:50px;
	margin-bottom: 50px;
}

.card{
	display:block;
	width: 200px;
	height: 70px;
	min-height: 70px;
	padding: 5px 10px;
	margin: 10px;
}
.card:nth-child(1){
	background: #f39c12;
}
.card:nth-child(2){
	background: #00a65a;
}
.card:nth-child(3){
	background: #dd4b39;
}
.card:nth-child(4){
	background: #00c0ef;
}
.card h6{
	color:white;
	margin: 4px 10px;
}
.card p{
	margin: 10px 10px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<% 
	ReservationDao dao_resv=new ReservationDao();
	UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");
	
	String uNAME2=null,uname=null;
	String uRole=null;
	int uid=0;
	
	if(session.getAttribute("currentSessionUser")==null){
		response.sendRedirect("index.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && !sessionCurrentBean.getRole().equals("admin")){
		response.sendRedirect("index.jsp");
	}
	else if((session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && (!sessionCurrentBean.getAdmin_role_type().equals("reservation") || sessionCurrentBean.getAdmin_role_type().equals(" ")))){
		response.sendRedirect("travel.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && sessionCurrentBean.getAdmin_role_type().equals("reservation")){
		//UserBean sss=(UserBean) session.getAttribute("currentSessionUser");
		uRole=sessionCurrentBean.getRole();
		uNAME2=sessionCurrentBean.getFname();
		uid=sessionCurrentBean.getUid();
		uname=sessionCurrentBean.getUname();
	}
	%>

	<%@include file="naviBar-user.jsp"%>
	<div class="leftPanel" id="navigation">
		<p>MAIN NAVIGATION</p>
		<a data-tab="#tab_1" data-tabCss="#panel_1">
			<div class="panel active" id="Panel_1">
				<i class="fas fa-hotel"></i> <span>Reservation</span>
			</div>
		</a> <a data-tab="#tab_2" data-tabCss="#panel_2">
			<div class="panel" id="Panel_2">
				<i class="fas fa-chart-bar"></i> <span>Report</span>
			</div>
		</a> 
		<a data-tab="#tab_3" data-tabCss="#panel_3">
			<div class="panel" id="Panel_3">
			<i class="fas fa-comments"></i>
			<span>Message</span>
		</div>
		</a>
	</div>
	<div class="mainDiv">
		<div id="tab_1" class="panel_main">
				<div class="travel_main_2">
					<div>
						<h3>Recent Room Reservation</h3>
					</div>
					<table style="text-align: center;">
					<tr>
						<th>Rid</th>
						<th>User</th>
						<th>Room type</th>
						<th>Package</th>
						<th>Check-in</th>
						<th>Check-out</th>
						<th>Adults</th>
						<th>Children</th>

					</tr>

					<%
					ReservationDao dao = new ReservationDao();
					List<ReservationBeans> resList = dao.displayAllReservationreq();
				
				if(resList.size()>0 && session.getAttribute("currentSessionUser")!=null){
					for (ReservationBeans res : resList) {
				%>
					<tr id="<%=res.getRid()%>">
						<td><%=res.getRid()%></td>
						<td><%=res.getUname()%></td>
						
						<%if(res.getReservation_type()==1){ %>
							<td>Executive</td>
						<%}else if(res.getReservation_type()==2){ %>
							<td>Presidential</td>
						<%} else if(res.getReservation_type()==3){ %>
							<td>Deluxe</td>
						<%} %>
						
						<td><%=res.getBudget_package_type()%></td>
						<td><%=res.getCheck_in()%></td>
						<td><%=res.getCheck_out()%></td>
						<td><%=res.getAdults()%></td>
						<td><%=res.getChildren()%></td>

						
					</tr>
					
					<%
						}
					} else if (resList.size() == 0 && session.getAttribute("currentSessionUser") != null) {
					%>
							<tr style="text-align: center">
								<td colspan="9"><h6>You don't have any requested Room Reservation yet.</h6></td>
							</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
		<div id="tab_2" class="panel_main">
			<div class="summary">
					<div class="card">
						<h6>Booked Room </h6>
						<p><%=dao.totReport() %></p>
					</div>
					<div class="card">
						<h6>Total Visitors</h6>
						<p><%=dao.totReport("total_visitors") %></p>
					</div>
					<div class="card">
						<h6>Total Children</h6>
						<p><%=dao.totReport("total_children") %></p>
					</div>
					<div class="card">
						<h6>Reservation</h6>
						<p></p>
					</div>
			</div>
			<div class="summary">
				 <div class="container">
					<input type="number" id="Executive" value="<%=dao.mostBookedRoom("Executive")%>" disabled hidden>
					<input type="number" id="Presidential" value="<%=dao.mostBookedRoom("Presidential")%>" disabled hidden>
					<input type="number" id="Deluxe" value="<%=dao.mostBookedRoom("Deluxe")%>" disabled hidden>
					
					
						<h4><span id="currentMonth"></span>Booked Room Type</h4>
						<canvas id="myChart" ></canvas>
				</div>  
			</div>
		</div>
		<div id="tab_3" class="panel_main">
			
		</div>
	</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script type="text/javascript">
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



var Executive = document.getElementById("Executive").value;
var Presidential = document.getElementById("Presidential").value;
var Deluxe = document.getElementById("Deluxe").value;

var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx,
		{
			type : 'bar',
			data : {
				labels : [ 'Executive', 'Presidential', 'Deluxe' ],
				datasets : [ {
					label : '# of Votes',
					data : [ Executive, Presidential, Deluxe],
					backgroundColor : [
					//'rgba(255, 99, 132, 0.2)',
					'rgba(204, 246, 228, 0.3)',
					//'rgba(54, 162, 235, 0.2)',
					'rgba(253, 230, 216, 0.3)',
					//'rgba(255, 206, 86, 0.2)',
					'rgba(253, 216, 239, 0.3)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [
					//'rgba(255, 99, 132, 1)',
					'rgba(38, 134, 78, 1)',
					//'rgba(54, 162, 235, 1)',
					'rgba(201, 102, 50, 1)',
					//'rgba(255, 206, 86, 1)',
					'rgba(222, 11, 142, 1)', 'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
</script>
</html>