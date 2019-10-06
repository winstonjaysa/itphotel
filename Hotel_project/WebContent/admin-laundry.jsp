<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.lx.Beans.*" %>
<%@page import="com.lx.Dao.LaundryDao" %>
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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
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
<title>Laundry Admin</title>
</head>
<body>
	<% 
	LaundryDao dao_Laundry=new LaundryDao();
	
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
	else if((session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && (!sessionCurrentBean.getAdmin_role_type().equals("laun") || sessionCurrentBean.getAdmin_role_type().equals(" ")))){
		response.sendRedirect("travel.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && sessionCurrentBean.getAdmin_role_type().equals("laun")){
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
				<i class="fas fa-tshirt"></i> <span>Laundry</span>
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
					<div class="searchbox-table" >
						<input class="form-control" id="myInput" type="text" placeholder="Search..">
					</div>
					<div style="margin-top: 30px">
						<h3>Recent Laundry Requests</h3>
					</div>
					<table style="text-align: center;">
					
						<tr>
							<th>Lid</td>
							<th>User</th>
							<th>date</th>
							<th>Items</th>
							<th>Price</th>
							<th>Status</th>
							<th></th>
							<th></th>
						</tr>
						<%
							LaundryDao dao = new LaundryDao();
							List<LaundryBeans> laundrylist = dao.getAllLaundryReq();
							for (LaundryBeans laundry : laundrylist) {
						%>
						<tbody id="t1">
							<tr id="<%=laundry.getLid()%>">
								<td><%=laundry.getLid()%></td>
								<td><%=laundry.getUname()%></td>
								<td><%=laundry.getDate()%></td>
								<td><%=laundry.getItem()%></td>
								<td><%=laundry.getTotal()%></td>
								<%
									if(laundry.getStatus()==0){ 
									%>
										<td class="pending-td">Pending</td>
								<%  }
									else if(laundry.getStatus()==1){ 
									%>
									<td class="success-td">Confirmed</td>
								<%  }
									else if(laundry.getStatus()==2){ 
									%>
									<td class="warning-td">Deny</td>
								<%
									}
								%>
								<td>
									
									<div class="dropdown">
			  							<span class="drop_menu" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						  					<i class="fa fa-ellipsis-v" ></i>
						  				</span>
										  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										    <a href="LaundryHandler?action=confirm&edit=conf&lid=<%=laundry.getLid()%>"><button type="button" class="btn dropdown-item">Confirm</button></a>
										    <a href="LaundryHandler?action=confirm&edit=deny&lid=<%=laundry.getLid()%>"><button type="button" class="btn dropdown-item">Deny</button></a>
										   </div>
									  
									</div>
									
								</td>
							</tr>
						</tbody>
						
						
						<%
							}
						%>
					</table>
				</div>
		</div>
	<div id="tab_2" class="panel_main">
		<div class="summary">
			<div class="card">
				<h6>Total Laundry Request </h6>
				<p><%=dao.totLaundryReq("totReq") %></p>
			</div>
			<div class="card">
				<h6>Total Items</h6>
				<p><%=dao.totLaundryReq("totItem") %></p>
			</div>
			<div class="card">
				<h6>Gross Profit</h6>
				<p>$ <%=dao.totLaundryReq("grossProfit") %></p>
			</div>
		</div>
		<div class="summary">
				 <div class="container">
					<input type="number" id="prog" value="<%=dao.chart(0)%>" disabled hidden>
					<input type="number" id="finish" value="<%=dao.chart(1)%>" disabled hidden>
					<input type="number" id="washing" value="<%=dao.chart(2)%>" disabled hidden>
					
						<h4><span id="currentMonth">month</span> Taxi request status</h4>
						<canvas id="myChart" ></canvas>
				</div>  
			</div>	
	</div>
	</div>
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
	
	
	

	$('#dropdown_menu').on('show.bs.modal', function (event){
		  var button = $(event.relatedTarget)
		  var recipient = button.data('whatever')
		  var modal = $(this)
		  modal.find('.modal-title').text('Send message to ' + recipient )
		  modal.find('.modal-body input').val(recipient)
		})

		
function confirmDel(id){
		
	var doIt=confirm('Do you want to delete the record?');
	  if(doIt){
			  document.location='payamenthandler?action=removerPayment&pid='+id;
		    }
	  else{

		    }
	}	
	
	
	$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#t1 tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	
	
	var prog = document.getElementById("prog").value;
	var washing = document.getElementById("washing").value;
	var finish = document.getElementById("finish").value;
	
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx,
			{
				type : 'bar',
				data : {
					labels : [ 'Progress', 'Washing', 'Finished' ],
					datasets : [ {
						label : '# of Votes',
						data : [ prog, washing, finish ],
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