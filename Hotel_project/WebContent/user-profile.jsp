<%@page import="com.lx.Dao.ReservationDao"%>
<%@page import="com.lx.Beans.*"%>
<%@page import="java.util.*"%>
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
	<div class="main">
		<div class="travel_main_2">
			<table style="text-align: center;">
				<tr>
					<th>Uid</th>
					<th>Uname</th>
					<th>Budget package type</th>

				</tr>

				<%
				ReservationDao dao = new ReservationDao();
				List<ReservationBeans> resList = dao.displayUserReservationreq(0, uid);

				for (ReservationBeans res : resList) {
			%>
				<tr>
					<td><%=res.getUid()%></td>
					<td><%=res.getUname()%></td>
					<td><%=res.getBudget_package_type()%></td>
				</tr>
				<%
				}
			%>
			</table>

		</div>

		<div class="travel_main_2" id="ltable">
			<div>
				<h3>Recent Laundry Requests</h3>
			</div>
			<table style="text-align: center;">
				<tr>
					<th>Lid</th>
					<th>Uid</th>
					<th>Uname</th>
					<th>Item</th>
					<th>Date</th>
					<th>Total</th>
					<th>Bag</th>
					<th>Beaded Skirt</th>
					<th></th>
				</tr>

				<%
				LaundryDao laundryDao = new LaundryDao();
				List<LaundryBeans> laundryList = laundryDao.getUserLaundryReq(uid);

				for (LaundryBeans laundry : laundryList) {
			%>
				<tr id="<%=laundry.getLid()%>">

					<td><%=laundry.getLid()%></td>
					<td><%=laundry.getUid()%></td>
					<td><%=laundry.getUname()%></td>
					<td><%=laundry.getItem()%></td>
					<td><%=laundry.getDate()%></td>
					<td><%=laundry.getTotal()%></td>
					<td><%=laundry.getBag() %></td>
					<td><%=laundry.getBeaded_skirt() %></td>
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
			%>
			</table>
		</div>

		<div class="travel_main_2">
			<div>
				<h3>Recent Ride</h3>
			</div>
			<table style="text-align: center;">
				<tr>
					<th>Request Id</th>
					<th>Destination</th>
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
									<a
										href="TransManageHandler?action=deleteReq&tid=<%=travel.getTid()%>">Del</a>
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
											<textarea name="messageU" placeholder="send message to admin"></textarea>
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
											<label>Destination </label><br> <input type="text"
												name="destination" value="<%=travel.getDestination()%>"
												required="required"><br>
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
		lastSelectedTab = "#tab_1";
	}
	$(lastSelectedTab).fadeIn();
</script>
</html>