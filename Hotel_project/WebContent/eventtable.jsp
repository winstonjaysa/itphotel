<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.lx.Beans.eventBean"%>
<%@ page import="com.lx.Dao.eventDao"%>
<%@ page import="com.lx.Handler.EventHandler"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<!-- donen -->
<meta charset="utf-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

</style>


</head>
<body>

<%@include file="naviBar-user.jsp"%>
	<div class="leftPanel" id="navigation">
		<p>MAIN NAVIGATION</p>
		
		<a data-tab="#tab_1" data-tabCss="#panel_1">
			<div class="panel active" id="Panel_1">
				<i class="fas fa-chart-bar"></i><span>Event info</span>
			</div>
   </a>
	</div>
	
				<br>
				<div class="mainDiv">
		<div id="tab_1" class="panel_main">
			<section>
				<div class="card-1">
				
				<%
					eventDao dao = new eventDao();
					List<eventBean> eventList = dao.getAllEvent();
				%>
	
				
					<h3>Event Details</h3>
					<div class="searchbox-table">
						<input class="form-control" id="myInput" type="text" placeholder="Search..">
			 		</div>
	
	
					<table id="myTable" class="table-wrapper-scroll-y my-custom-scrollbar">
						<thead>
							    <tr class="table100-head">
							    
								<th class="column6">Age</th>
								<th class="column6">Position</th>
		                        <th class="column6">Hourly rate</th>
		                         <th class="column6">Fixed salary</th>
		
								<th class="column3">Edit</th>
								<th class="column6">Delete</th>
								
							</tr>
						</thead>
						<tbody>
		
								<%
									for (eventBean pb : eventList) {
								%>
							<tr id="<%=pb.getId()%>">	
									
								
								
								<td class="column6"><%=pb.getId()%></td>
								<td class="column6"><%=pb.getEvent()%></td>
								<td class="column6"><%=pb.getCost()%></td>
								<td class="column6"><%=pb.getNeeddate()%></td>
		
		
								<td class="column3">
									<button type="button" class=" btn dropdown-item" data-toggle="modal" data-target="#dropdown_menu<%=pb.getId()%>" data-whatever="<%=pb.getId()%>">Edit</button>
								</td>
								<td class="column6">
									<a href="EventHandler?action=delete&eventId=<%=pb.getId()%>" onclick="if(!(confirm('do you wish permanently delete this employee?'))) return false">
										Delete
									</a>
								</td>
								
								<div class="modal fade" id="dropdown_menu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">  
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								   	<div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Change</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
			    				    </div>
								      <form action="EmployeeHandler?propid="  method="post">
								     		<div class="form_body">
									         	<input type="hidden" value="edit" name="action">
												<div class="form-group">
													<label>Employee ID</label><br>
													<input type="number" name="pid" value="" required="required"><br>
												</div>
									     		<div class="form-group">
													 <label>Nic</label><br>
													 <input type="text" name="nic" value="" required="required"><br>
												</div>
												<div class="form-group">
													<label>Name</label><br>
													<input type="text" name="name" value="" required="required"><br>
												</div>
												<div class="form-group">
													<label>Address</label><br>
													<input type="text" name="address" value="" required="required"><br>
												</div>
												<div class="form-group">
													<label>Gender</label><br>
													<input type="text" name="gender" value="" required="required"><br>
												</div>
												<div class="form-group">
													<label>Age</label><br>
													<input type="number" name="age" value="" required="required"><br>
												</div>
												<div class="form-group">
													<label>Position</label><br>
													<input type="text" name="position" value="" required="required"><br>
												</div>
												<div class="form-group">
													<label>Hourlyrate</label><br>
													<input type="number" name="hourlyrate" value="" required="required"><br>
												</div>
												<div class="form-group">
													<label>Fixed salary</label><br>
													<input type="number" name="fixedsalary" value="" required="required"><br>
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
							</tr>
							<%
								}
								//}
							%>
		
						</tbody>
					</table>
				
					</div>
			</section>
		</div>
		</div>
		
		
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

</script>
		<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
		
		
		</body>
		</html>
		
				