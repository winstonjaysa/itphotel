<%@page import="com.lx.Dao.ReservationDao"%>
<%@page import="com.lx.Beans.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/profile.css">
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
<meta charset="ISO-8859-1">
<title>Account</title>
</head>
<body>
	<%@include file="naviBar-user.jsp"%>
	<%
		int uid = 0;
		if (session.getAttribute("currentSessionUser") == null) {
			response.sendRedirect("index.jsp?status=status=loginfirst");

		} else if (session.getAttribute("currentSessionUser") != null) {
			UserBean userbean = (UserBean) session.getAttribute("currentSessionUser");
			uid = userbean.getUid();
		}
	%>
	<div class="leftPanel" id="navigation">
		<p>MAIN NAVIGATION</p>
		<a data-tab="#tab_1" data-tabCss="#panel_1">
			<div class="panel active" id="Panel_1">
				<i class="fa fa-car-side"></i> <span>Travel</span>
			</div>
		</a> <a data-tab="#tab_2" data-tabCss="#panel_2">
			<div class="panel" id="Panel_2">
				<i class="fas fa-tshirt"></i> <span>Laundry</span>
			</div>
		</a> <a data-tab="#tab_3" data-tabCss="#panel_3">
			<div class="panel" id="Panel_3">
				<i class="fas fa-hotel"></i> <span>Reservation</span>
			</div>
		</a> <a data-tab="#tab_4" data-tabCss="#panel_4">
			<div class="panel" id="Panel_4">
				<i class="fas fa-user-alt"></i> <span>Account</span>
			</div>
		</a>
	</div>
	<div class="mainDiv">
		<div id="tab_1" class="panel_main">
			<div class="travel_main_2">
				<div>
					<h3>Recent Ride</h3>
				</div>
				<table style="text-align: center;">
					<tr>
						<th>Request Id</th>
						<th>Destination</th>
						<th>Vehicle Type</th>
						<th>Request date</th>
						<th>Amount</th>
						<th>Confirm</th>
						<th></th>
					</tr>
					<%
					TransManageDao daoTravel = new TransManageDao();
					List<TransManageBeans> travelList = daoTravel.getUserTravelList(uid);
					
				if(travelList.size()>0 && session.getAttribute("currentSessionUser")!=null){
					for (TransManageBeans travel : travelList) {
				%>
					<tr id="<%=travel.getTid()%>">
						<td><%=travel.getTid()%></td>
						<td><%=travel.getDestination()%></td>
						<td><%=travel.getVehicle()%></td>
						<td><%=travel.getNeedDate()%></td>
						<td><%=travel.getCost()%></td>
						<%
						if (travel.getIsApproved() == 1) {
					%>
						<td class="success-td">Confirmed</td>
						<td>
							<div class="dropdown">
								<span class="drop_menu" id="dropdownMenuButton"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fa fa-ellipsis-v"></i>
								</span>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<button type="button" class=" btn dropdown-item"
										data-toggle="modal" data-target="#exampleModal"
										data-whatever="<%=travel.getTid()%>" disabled="disabled">Edit</button>
									<button type="button" class="btn dropdown-item"
										disabled="disabled">
										<a href="TransManageHandler?action=deleteReq&tid=<%=travel.getTid()%>">Del</a>
									</button>
								</div>
							</div>
						</td>
						<%
						}else if (travel.getIsApproved() == 2) {
					%>
						<td class="warning-td">Deny</td>
						<td>
							<div class="dropdown">
								<span class="drop_menu" id="dropdownMenuButton"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fa fa-ellipsis-v"></i>
								</span>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<button type="button" class=" btn dropdown-item"
										data-toggle="modal" data-target="#exampleModal"
										data-whatever="<%=travel.getTid()%>" disabled="disabled">Edit</button>
									<button type="button" class="btn dropdown-item"
										disabled="disabled">
										<a
											href="TransManageHandler?action=deleteReq&tid=<%=travel.getTid()%>">Del</a>
									</button>
									<button type="button" class="btn dropdown-item"
										data-toggle="modal"
										data-target="#MesssgeDialogBox<%=travel.getTid()%>"
										data-whatever="<%=travel.getTid()%>,<%=travel.getUid()%>">Message</button>
								</div>
							</div>
						</td>

						<div class="modal fade" id="MesssgeDialogBox<%=travel.getTid()%>"
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
									<div class="form_body">
										<form
											action="TransManageHandler?action=sendMessage&tid=<%=travel.getTid()%>&uid=<%=uid%>"
											method="post">
											<div class="form-group">
												<input type="hidden" value="travel.jsp" name="lastUrl">
												<label>message</label>
												<!--<textarea name="messageA" placeholder="send message to user"></textarea>  -->
												<textarea name="messageU"
													placeholder="send message to admin"></textarea>
												<button type="submit">Send</button>
											</div>
										</form>

									</div>
									<div class="messageListDiv" id="d1">
										<div class="messageListDiv_body " id="msList">
											<%
												List<TransManageBeans> msDisplay=daoTravel.getUserTravelMessageList(travel.getTid());
													for(TransManageBeans ms:msDisplay){
	
												if ((ms.getUserMessage()==null || ms.getUserMessage().isEmpty()) && (!ms.getAdminMessage().isEmpty() || ms.getAdminMessage()!=null)){
												%>
											<div class="form-group ">
												<div class="divclass1">
													<p><%=ms.getAdminMessage() %></p>
												</div>
											</div>
											<%
													}else if((ms.getAdminMessage()==null || ms.getAdminMessage().isEmpty()) && (!ms.getUserMessage().isEmpty() || ms.getUserMessage()!=null)){
												%>
											<div class="form-group ">
												<div class="divclass2">
													<p><%=ms.getUserMessage() %></p>
												</div>
											</div>
											<%
	
												}
											}
												%>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%
						} else {
					%>
						<td class="pending-td">Pending</td>
						<td>
							<div class="dropdown">
								<span class="drop_menu" id="dropdownMenuButton"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fa fa-ellipsis-v"></i>
								</span>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<button type="button" class=" btn dropdown-item"
										data-toggle="modal"
										data-target="#dropdown_menu<%=travel.getTid()%>"
										data-whatever="<%=travel.getTid()%>">Edit</button>
									<button type="button" class="btn dropdown-item">
										<a
											href="TransManageHandler?action=deleteReq&tid=<%=travel.getTid()%>">Del</a>
									</button>
								</div>
							</div>
						</td>
						<!-- <td><a href="EditTheTravel.jsp?tid=<%=travel.getTid()%>">Edit</a></td>  -->
						<!--
							Edit drop down menu
						 -->
						<div class="modal fade" id="dropdown_menu<%=travel.getTid()%>"
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
									<form action="TransManageHandler?tid=<%=travel.getTid()%>"
										method="post">
										<div class="form_body">
											<div class="form-group">
												<input type="hidden" value="editTravelReq" name="action">
												<input type="hidden" value="user-profile.jsp" name="lastUrl">
												<label>Destination </label><br> 
												<!-- <input type="text" name="destination" value="<%=travel.getDestination()%>"
													required="required">  -->
												<br>
												<select name="destination" id="dLocationEdit<%=travel.getTid()%>" onchange="funcDestinationEdit(<%=travel.getTid()%>)">
													<option>ArugamBay</option>
													<option>HortonPlace</option>
													<option>YalaPark</option>
													<option>Trincomalee</option>
											 	</select>
												 <label >Vehicle type</label>
												 <br>
												 <select name="vehicle" id="vehicleType" required>
													<option >Tuk</option>
													<option >Buddy</option>
													<option>Micro</option>
													<option>Mini</option>
													<option>Car</option>
													<option>Minivan</option>
													<option>Van</option>
													<option>Vip</option>
												</select>
												<label >Cost (lkr)</label>
												<br>
												<input type="text" name="travelCostEdit" id="travelCostEdit<%=travel.getTid()%>" placeholder="Cost" value="19750">
											</div>
											<div class="form-group">
												<label>Need date </label><br> <input type="date"
													name="needdate" value="<%=travel.getNeedDate()%>"
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
						%>
					</tr>
					<%
						}
						} else if (travelList.size() == 0 && session.getAttribute("currentSessionUser") != null) {
					%>
					<tr style="text-align: center">
						<td colspan="5"><h6>You don't have any requested ride
								yet.</h6></td>
					</tr>
					<%
						} else if (session.getAttribute("currentSessionUser") == null) {
					%>
					<tr style="text-align: center">
						<td colspan="5"><h6>You don't have any logging indices.</h6></td>
					</tr>
					<%
						}
					%>
				</table>

			</div>
		</div>
		<div id="tab_2" class="panel_main">
			<div class="travel_main_2">
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
						<td colspan="7"><h6>You don't have any requested laundry request yet.</h6></td>
					</tr>
					<%
				}
				%>
				</table>
			</div>
		</div>
		<div id="tab_3" class="panel_main">
			<div class="travel_main_2">
				<div>
					<h3>Recent Room Reservation</h3>
				</div>
				<table style="text-align: center;">
					<tr>
						<th>Rid</th>
						<th>Room type</th>
						<th>Package</th>
						<th>Check-in</th>
						<th>Check-out</th>
						<th>Adults</th>
						<th>Children</th>
						<th></th>
						<th></th>

					</tr>

					<%
					ReservationDao dao = new ReservationDao();
					List<ReservationBeans> resList = dao.displayUserReservationreq(0, uid);
				
				if(resList.size()>0 && session.getAttribute("currentSessionUser")!=null){
					for (ReservationBeans res : resList) {
				%>
					<tr id="<%=res.getRid()%>">
						<td><%=res.getRid()%></td>
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

						<td>
							<button class="btn dropdown-item" data-toggle="modal"
								data-target="#dropdown_menu<%=res.getRid()%>"
								data-whatever="<%=res.getRid()%>">Edit</button>
						</td>
						<td><a
							href="ReservationHandler?action=deleteReservationReq&rid=<%=res.getRid()%>">
								Delete </a> <!-- <button type="button" onclick="ReservationHandler?action=deleteReservationReq&rid=<%=res.getRid()%>">Delete</button> -->
						</td>
					</tr>
					<div class="modal fade" id="dropdown_menu<%=res.getRid()%>"
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
								<form action="ReservationHandler?rid=<%=res.getRid()%>"
									method="post">
									<div class="form_body">
										<div class="form-group">
											<input type="hidden" value="editReservationReq" name="action">
											<label>Budget_package_type</label><br> <input
												type="number" name="budget_package_type"
												value="<%=res.getBudget_package_type()%>"
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
		<div id="tab_4" class="panel_main">
			<div class="travel_main_2 proDiv">
				<div class="form-group imgChoose">
					<div class="imgDiv">
						<img src="user-propic.jsp?uid=<%=uid%>" alt="no image" >
					</div>
					<form action="UserHandler?action=UpdatePropic" method="post" enctype="multipart/form-data" >
						<div id="choose">
							<input type="file" id="real-file" name="propic" hidden="hidden" />
							<!-- <button type="button" id="custom-button1" >Change picture</button>  -->
							<div class="cameraRadiusDiv" id="custom-button1">
								<i class="fas fa-camera" ></i>
							</div>
						</div>
						<input type="hidden" name="uid" value="<%=uid%>"> 
						<button type="submit">Change picture</button>
					</form>
				</div>
				<%
					UserDao userDao = new UserDao();
					List<UserBean> userDetails = userDao.getUser(uid);
	
					for (UserBean res : userDetails) {
				%>
				<div class="form-group">
					<h5>Profile</h5>
					<br>
					<form action="UserHandler?action=editUser&uid=<%=uid %>" method="post">
						<div class="divDiv">
							<div class="form-group-details">
								<label>User name</label>
								<input type="text" name="uname" value="<%=res.getUname()%>">
							</div>
							<div class="form-group-details">
								<label>Role</label>
								<input type="text" name="reole" value="<%=res.getRole()%> <%if(res.getAdmin_role_type()!=null){ %> - <%=res.getAdmin_role_type() %> <%} %>" readonly="readonly">
							</div>
						</div>
						<div class="divDiv">
							<div class="form-group-details">
								<label>First name</label>
								<input type="text" name="fname" value="<%=res.getFname()%>">
							</div>
							<div class="form-group-details">
								<label>Last name</label>
								<input type="text" name="lname" value="<%=res.getLname()%>">
							</div>
						</div>
						<button type="submit">Save changes</button>
					</form>
				</div>
				<%
					}
				%>
				<div class="form-group">
					<h5 >Cancel Account</h5>
					<br>
					<p><span class="span-warning">Warning:</span> You will not be able to access your account data, your contacts or conversations after you confirm this action.</p>
					<button type="submit">Cancel Account</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
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
		lastSelectedTab = "#tab_4";
	}
	$(lastSelectedTab).fadeIn();

	
function funcDestinationEdit(parY) {
		
		var x=document.getElementById('dLocationEdit'+parY).value;	
		
		if(x=='ArugamBay'){
			document.getElementById('travelCostEdit'+parY).value=19750;
		}else if(x=='HortonPlace'){
			document.getElementById('travelCostEdit'+parY).value=11500;
		}else if(x=='YalaPark'){
			document.getElementById('travelCostEdit'+parY).value=13400;
		}else if(x=='Trincomalee'){
			document.getElementById('travelCostEdit'+parY).value=15850;
		}
		
	}
	
	
	
	
	const realFileBtn = document.getElementById("real-file");
	const customBtn = document.getElementById("custom-button1");
	const customTxt = document.getElementById("custom-text");

	customBtn.addEventListener("click", function() {
		realFileBtn.click();
	});

	realFileBtn.addEventListener("change", function() {
		if (realFileBtn.value) {
			customTxt.innerHTML = realFileBtn.value
					.match(/[\/\\]([\w\d\s\.\-\(\)]+)$/)[1];
		} else {
			customTxt.innerHTML = "No file chosen, yet.";
		}
	});
</script>
</html>