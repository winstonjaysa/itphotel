<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.lx.Beans.ContactUsBeans"%>
<%@ page import="com.lx.Dao.contactUsDao"%>
<%@ page import="com.lx.Handler.ContactusHandler"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="validation.js"></script>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/6bcee8e3da.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
	height: 500px;
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
<title>admin-contactUs</title>
</head>
<body>
<%
	contactUsDao dao = new contactUsDao();
	UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");	

	String uNAME2=null;
	String uRole=null;

	if(session.getAttribute("currentSessionUser")==null){
		response.sendRedirect("index.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && !sessionCurrentBean.getRole().equals("admin")){
		response.sendRedirect("index.jsp");
	}
	else if((session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && (!sessionCurrentBean.getAdmin_role_type().equals("cont") || sessionCurrentBean.getAdmin_role_type().equals(" ")))){
		response.sendRedirect("index.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && sessionCurrentBean.getAdmin_role_type().equals("cont") ){
	//UserBean sss=(UserBean) session.getAttribute("currentSessionUser");
	uRole=sessionCurrentBean.getRole();
	uNAME2=sessionCurrentBean.getFname();
} 
%>
<%@include file="naviBar-user.jsp"%>
<div class="leftPanel" id="navigation">
		<p>MAIN NAVIGATION</p>
		<a data-tab="#tab_1" data-tabCss="#panel_1">
			<div class="panel active" id="Panel_1">
				<i class="fas fa-comments"></i><span>Messages( User )</span>
			</div>
		</a> <a data-tab="#tab_2" data-tabCss="#panel_2">
			<div class="panel" id="Panel_2">
				<i class="fas fa-comment-dots"></i><span>Messages( Admin ) </span>
			</div>
		</a> <a data-tab="#tab_3" data-tabCss="#panel_3">
			<div class="panel" id="Panel_3">
				<i class="fas fa-cogs"></i> <span>Change</span>
			</div>
		</a>
		<a data-tab="#tab_4" data-tabCss="#panel_4">
		<div class="panel" id="Panel_4">
			<i class="fas fa-chart-bar"></i>
			<span>Summary</span>
		</div>
	</a>
</div>
<div class="mainDiv">
		<div id="tab_1" class="panel_main">
			<%
				List<ContactUsBeans> userContactList = dao.getAllUsersContact();
			%>
			
			<table id="myTable" style="text-align: center;">
				<tr>	
					<th>User id</th>
					<th>User name</th>
					<th>Date</th>
					<th>Email</th>
					<th>Subject</th>
					<th>Mesaage</th>
				<tr>
				<tbody>
					<%
						for(ContactUsBeans cb:userContactList){
					%>
					<tr id="<%=cb.getUid()%>">
						<td><%=cb.getUid() %></td>
						<td><%=cb.getUname() %></td>
						<td><%=cb.getDate() %></td>
						<td><%=cb.getEmail() %></td>
						<td><%=cb.getSubject()%></td>
						<td><%=cb.getMessage()%></td>
						
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div id="tab_2" class="panel_main">
			
			<%
				List<ContactUsBeans> adminContactList = dao.getAdminsContactMeassages(0);
			%>
			
			<table id="myTable2" style="text-align: center;width: 800px">
				<tbody>
					<tr>
						<th>Admin</th>
						<th>Message</th>
						<th></th>
					</tr>
					<%
						for(ContactUsBeans cb2:adminContactList){
					%>
					<tr id="<%=cb2.getCid()%>">
						<td><%=cb2.getUname() %></td>
						<td style="text-align: left;"><%=cb2.getInbox()%></td>
						<td><a href="ContactusHandler?action=delete&cid=<%=cb2.getCid()%>" onclick="return confirm('Are you sure you want to delete this message?')">delete</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div id="tab_3" class="panel_main">
			<h3 style="margin-top: 40px !important;">Add Feedback</h3>
			<div class="con-admin-form">
				<form action="ContactusHandler?action=addFeedback" method="post" onsubmit="return confirmInsert()">
					<label>Feedback</label>
					<input type="text" name="description" >
					<label>Name</label>
					<input type="text" name="feedName">
					<button type="submit" >submit</button>
				</form>
			</div>
			<div class="admin-table">
				<h3>Feedback</h3>
				<table id="myTable2" style="text-align: center;margin-bottom: 80px;">
				<tr>	
					<th>Fid</th>
					<th>Description</th>
					<th>Name</th>
					<th></th>
					<th></th>
					
				<tr>
				<tbody>
					<%
						List<ContactUsBeans> feedback = dao.getFeedback();
						for(ContactUsBeans cb:feedback){
					%>
					<tr id="<%=cb.getFid()%>">
						<td><%=cb.getFid() %></td>
						<td class="admin-td-max-width"><%=cb.getDescription() %></td>
						<td><%=cb.getFeedName() %></td>
						<td><button type="button" class=" btn dropdown-item" data-toggle="modal" data-target="#dropdown_menu<%=cb.getFid()%>" data-whatever="<%=cb.getFid()%>">Edit</button></td>
						<td><a href="ContactusHandler?action=removeFeedback&fid=<%=cb.getFid()%>" onclick="return confirm('Are you sure you want to delete this feedback?')">Delete</a></td>
						
					</tr>
					<div class="modal fade" id="dropdown_menu<%=cb.getFid()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">  
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						   	<div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Change</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
	    				    </div>
						      <form action="ContactusHandler?action=editFeedback&fid=<%=cb.getFid()%>"  method="post">
						     		<div class="form_body">
							     		<div class="form-group">
							         		 <input type="hidden" value="editPayment" name="action">
											 <label>Feedback </label><br>
											 <input type="text" name="description" value="<%=cb.getDescription()%>" required="required"><br>
										</div>
										<div class="form-group">
											<label>Name </label><br>
											<input type="text" name="feedName" value="<%=cb.getFeedName()%>" required="required"><br>
										</div>
						     		</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Edit</button>
										</div>
						       </form>
						    </div>
						  </div>
					</div>
					<%
						}
					%>
				</tbody>
			</table>
			</div>
		</div>
		<div id="tab_4" class="panel_main">
			<div class="summary">
				<section>
					<div class="card">
						<h6>Total Feedback </h6>
						<p><%=dao.totFeedbacks() %></p>
					</div>
					<div class="card">
						<h6>Gross profit </h6>
						<p></p>
					</div>
					<div class="card">
						<h6>Total Requests </h6>
						<p></p>
					</div>
					<div class="card">
						<h6>Unread messages </h6>
						<p></p>
					</div>
				</section>
			</div>
			<div class="summary">
				 <div class="container">
					<input type="number" id="feedback" value="<%=dao.reportChart("Feedback")%>" disabled hidden>
					<input type="number" id="laundry" value="<%=dao.reportChart("Laundry")%>" disabled hidden>
					<input type="number" id="travel" value="<%=dao.reportChart("Travel")%>" disabled hidden>
					<input type="number" id="reservation" value="<%=dao.reportChart("Reservation")%>" disabled hidden>
					
					
						<h4><span id="currentMonth">month</span> Taxi request status</h4>
						<canvas id="myChart" height="320px"></canvas>
				</div>  
			</div>			
		</div>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
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

function confirmInsert(){
	
	var doIt=confirm('Do you want to insert the record?');
	  if(doIt){
		 return true;
	   	    }
	  else{
		return false;
	    }
}
	
	
	var feedback = document.getElementById("feedback").value;
	var laundry = document.getElementById("laundry").value;
	var travel = document.getElementById("travel").value;
	var reservation = document.getElementById("reservation").value;
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx,
			{
				type : 'bar',
				data : {
					labels : [ 'feedback', 'laundry', 'travel','reservation' ],
					datasets : [ {
						label : '# of Votes',
						data : [ feedback, laundry, travel,reservation ],
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