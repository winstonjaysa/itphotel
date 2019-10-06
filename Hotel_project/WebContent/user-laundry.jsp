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
		<div class="popup-notification-pannel successColour" id="popup-notification-pannel">
			<p><%if(request.getParameter("message")!=null){ %>
				<%=request.getParameter("message") %> 
				<%} %>
				<i class="fas fa-cog"></i>
			</p>
		</div>
		<div class="card-1">
			<div class="form-style">
			<div id="error_message"></div>
				<form onsubmit="return confirm('Are you sure?')" action="LaundryHandler" method="post">
					<input type="hidden" name="action" value="newLaundryRq">
					<input type="hidden" name="uid" value="<%=uid%>">
					<input type="hidden" name="uname" value="<%=uname%>">
					
					<h3>Add Laundry request Details</h3>
					
					
					<div class="form_item">
						<label>date</label>
						<input id="datefield" type='date' name="date" min='1899-01-01' max='2022-07-01' onclick="dateGet()" required="required"></input>
					</div>
					<div class="form_item">
						<label>T-shirt </label><br> 
						<input type="number" name="tshirt" id="tshirt" value="0" min="0" max="15" required="required" ><br>
					</div>
					<div class="form_item">
						<label>Frock </label><br> 
						<input type="number" name="frock" id="frock" value="0" min="0" max="15" required="required"><br>
					</div>
					<div class="form_item">
						<label>Trousers </label><br> 
						<input type="number" name="trousers" id="trousers" value="0" min="0" max="15" required="required"><br>
					</div>
					<div class="form_item">
						<label>Jeans </label><br> 
						<input type="number" name="jeans" id="jeans" value="0" min="0" max="15" required="required"><br>
					</div>
					<div class="form_item">
						<label>bag</label> 
						<input type="number" name="bag" id="bag" min="0" max="15" value="0">
					</div>
					<div class="form_item">
						<label>breaded skirt</label> 
						<input type="number" name="breaded-skirt" id="skirt" min="0" max="15" value="0"> <br>
						<br>
					</div>
					<div class="form_item">
						<label>items</label> 
						<input type="text" name="item" id="dis-items" value="0" readonly>
					</div>
					<div class="form_item">
						<label>total</label> 
						<input type="text" name="total" id="dis-tot" value="0" readonly>
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
						<th>T-shirts</th>
						<th>Frock</th>
						<th>Trousers</th>
						<th>Jeans</th>
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
						<td><%=laundry.getTshirt() %></td>
						<td><%=laundry.getFrock() %></td>
						<td><%=laundry.getTrousers()%></td>
						<td><%=laundry.getJeans() %></td>
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
							href="LaundryHandler?action=deleteReq&lid=<%=laundry.getLid()%> " onclick="return confirm('Are you sure?')">Delete</a></td>
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
											<input type="hidden" value="user-laundry.jsp" name="lastUrl">
											<label>User Name</label><br> 
											<input type="text"
												name="destination" value="<%=laundry.getUname()%>"
												readonly="readonly"><br>
										</div>
									
										<div class="form-group">
											<label>T-shirt </label><br> <input type="text" name="tshirt"
												value="<%=laundry.getTshirt()%>" required="required" ><br>
										</div>
										<div class="form-group">
											<label>Frock </label><br> <input type="text" name="frock"
												value="<%=laundry.getFrock()%>" required="required"><br>
										</div>
										<div class="form-group">
											<label>Trousers </label><br> <input type="text" name="trousers"
												value="<%=laundry.getTrousers()%>" required="required"><br>
										</div>
										<div class="form-group">
											<label>Jeans </label><br> <input type="text" name="jeans"
												value="<%=laundry.getJeans()%>" required="required"><br>
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

//date picker range code
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


	var first = document.getElementById('bag');
	var second = document.getElementById('skirt');
	var three = document.getElementById('tshirt');
	var four = document.getElementById('frock');
	var five = document.getElementById('trousers');
	var six = document.getElementById('jeans');
	var result1 = document.getElementById('dis-tot');
	var result2 = document.getElementById('dis-items');

	first.addEventListener("input", sum);
	second.addEventListener("input", sum);
	three.addEventListener("input", sum);
	four.addEventListener("input", sum);
	five.addEventListener("input", sum);
	six.addEventListener("input", sum);

	function sum() {

		var one = parseInt(first.value) || 0;
		var two = parseInt(second.value) || 0;
		var it3 = parseInt(three.value) || 0;
		var it4 = parseInt(four.value) || 0;
		var it5 = parseInt(five.value) || 0;
		var it6 = parseInt(six.value) || 0;

		var onetot = one * 10;
		var twotot = two * 20;
		var it3tot = it3 * 5;
		var it4tot = it4 * 15;
		var it5tot = it5 * 30;
		var it6tot = it6 * 3;
		
		var tot = one + two+it3+it4+it5+it6;
		var add = onetot + twotot+it3tot+it4tot+it5tot+it6tot;

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