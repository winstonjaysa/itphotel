<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%
	int uid = 0;
	String uname=null;
	if (session.getAttribute("currentSessionUser") == null) {
		response.sendRedirect("index.jsp");
	} else if (session.getAttribute("currentSessionUser") != null) {
		UserBean userbean = (UserBean) session.getAttribute("currentSessionUser");
		uid = userbean.getUid();
		uname=userbean.getUname();
	}
%>
 <script src="validation/user-laundry.js"></script>
</head>
<%
	if(request.getParameter("status")!=null&& request.getParameter("status").equals("successReq")){
			%>
<body onload="notifyPopup()">
<%}else {%>
<body>
<%} %>
	<%@include file="naviBar-user.jsp"%>
	<br>
	<br>
	
	<section>
		<div class="popup-notification-pannel" id="popup-notification-pannel">
			<p>successfully. <i class="fas fa-check-circle"></i></p>
		</div>
		<div class="card-1">
			<div class="form-style">
			<div id="error_message"></div>
				<form onsubmit="return validate();" action="LaundryHandler" method="post">
					<input type="hidden" name="action" value="newLaundryRq">
					<input type="hidden" name="uid" value="<%=uid%>">
					<input type="hidden" name="uname" value="<%=uname%>">
					
					<h3>Add Laundry request Details</h3>
					
					
					<div class="form_item">
						<label>date</label> <input type="date" name="date">
					</div>
					<div class="form_item">
						<label>bag</label> 
						<input type="number" name="bag" id="bag" min="0" max="15">
					</div>
					<div class="form_item">
						<label>breaded skirt</label> 
						<input type="number" name="breaded-skirt" id="skirt" min="0" max="15"> <br>
						<br>
					</div>
					<div class="form_item">
						<label>items</label> 
						<input type="text" name="item" id="dis-items" readonly>
					</div>
					<div class="form_item">
						<label>total</label> 
						<input type="text" name="total" id="dis-tot" readonly>
					</div>
					<!-- <button type="submit">submit</button>  -->
					<input type="submit">
				</form>
			</div>
		</div>
	</section>
	
	<div class="travel_main_2" >
				<div>
					<h3>Recent Laundry Requests</h3>
				</div>
				<table style="text-align: center;">
					<tr>
						<th>Lid</th>
						<th>Item</th>
						<th>Date</th>
						<th>Price</th>
						<th>Bag</th>
						<th>Beaded Skirt</th>
						<th>Status</th>
						<th></th>
						<th></th>
					</tr>

					<%
					LaundryDao laundryDao = new LaundryDao();
					List<LaundryBeans> laundryList = laundryDao.getUserLaundryReq(uid);
					
				if(laundryList.size()>0 && session.getAttribute("currentSessionUser")!=null){
					for (LaundryBeans laundry : laundryList) {
				%>
					<tr id="<%=laundry.getLid()%>">

						<td><%=laundry.getLid()%></td>
						<td><%=laundry.getItem()%></td>
						<td><%=laundry.getDate()%></td>
						<td><%=laundry.getTotal()%></td>
						<td><%=laundry.getBag() %></td>
						<td><%=laundry.getBeaded_skirt() %></td>

						<% if(laundry.getStatus()==0){ %>
						<td class="pending-td">Pending</td>
						<%}else if(laundry.getStatus()==1){ %>
						<td class="success-td">finished</td>
						<%} else if(laundry.getStatus()==2){ %>
						<td class="warning-td">Deny</td>
						<%} %>
						<td><a
							href="LaundryHandler?action=deleteReq&lid=<%=laundry.getLid()%>">Delete</a></td>
						<td><button class="btn dropdown-item" data-toggle="modal"
								data-target="#dropdown_menu<%=laundry.getLid()%>"
								data-whatever="<%=laundry.getLid()%>">Edit</button></td>
					</tr>

					<div class="modal fade" id="dropdown_menu<%=laundry.getLid()%>"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Change</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<form action="LaundryHandler?lid=<%=laundry.getLid()%>"
									method="post">
									<div class="form_body">
										<div class="form-group">
											<input type="hidden" value="editLaundryReq" name="action">
											<input type="hidden" value="user-profile.jsp" name="lastUrl">
											<label>User Name</label><br> <input type="text"
												name="destination" value="<%=laundry.getUname()%>"
												required="required"><br>
										</div>
										<div class="form-group">
											<label>Need date </label><br> <input type="date"
												name="needdate" value="<%=laundry.getDate()%>"
												required="required"><br>
										</div>
										<div class="form-group">
											<label>Bag </label><br> <input type="text" name="bag"
												value="<%=laundry.getBag()%>" required="required"><br>
										</div>
										<div class="form-group">
											<label>Beaded Skirt</label><br> <input type="text"
												name="Beaded_skirt" value="<%=laundry.getBeaded_skirt()%>"
												required="required"><br>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Edit</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<%
					}
				} else if (laundryList.size() == 0 && session.getAttribute("currentSessionUser") != null) {
					%>
					<tr style="text-align: center">
						<td colspan="9"><h6>You don't have any requested laundry request yet.</h6></td>
					</tr>
				<%
				}
				%>
				</table>
			</div>
</body>
<script type="text/javascript">
	var first = document.getElementById('bag');
	var second = document.getElementById('skirt');
	var result1 = document.getElementById('dis-tot');
	var result2 = document.getElementById('dis-items');

	first.addEventListener("input", sum);
	second.addEventListener("input", sum);

	function sum() {

		var one = parseInt(first.value) || 0;
		var two = parseInt(second.value) || 0;

		var onetot = one * 10;
		var twotot = two * 20;
		var tot = one + two;
		var add = onetot + twotot;

		result1.value = add;
		result2.value = tot;
	}

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
	
	//window.onload = function(){
	function notifyPopup(){
		document.getElementById("popup-notification-pannel").style.opacity = 1;
		window.setTimeout(fadeout, 3000);
		}
	 
	function fadeout() {
		  document.getElementById('popup-notification-pannel').style.opacity = '0';
		}
</script>
</html>