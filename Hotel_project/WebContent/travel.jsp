<%@page import="com.lx.Beans.TransManageBeans"%>
<%@page import="com.lx.Beans.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="com.lx.Dao.TransManageDao"%>
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
<title>Travel</title>

<%
	String username=null;
	String firstname=null;
	int uid=0;
	//if(session.getAttribute("currentSessionUser")==null){
	//	response.sendRedirect("login.jsp?status=loginfirst");
	//}
	//else
		UserBean userbean=(UserBean) session.getAttribute("currentSessionUser");
	
		if(session.getAttribute("currentSessionUser")!=null){
	 	username=userbean.getUname();
		firstname=userbean.getFname();
		uid=userbean.getUid();
	}
%>
</head>
<body >

<%@include file="naviBar-user.jsp" %>
<div class="main">

	<section >
		<div class="headTitle">
			<h2>Popular destinations in 2019</h2>
		</div>
		<div class="main_img_location_div">
			<div class="img_location">
				<img src="img/travel_pg/special_3.jpg">
				<div class="details">
					<h2 >ArugamBay</h2>
					<a href="#f1"><h4 id="ArugamBay" onclick="funcDestination('ArugamBay')">Pick</h4></a>
				</div>
			</div>
			<div class="img_location">
				<img src="img/travel_pg/special_1.jpg">
				<div class="details">
					<h2 >HortonPlace</h2>
					<a href="#f1"><h4 onclick="funcDestination('HortonPlace')">Pick</h4></a>
				</div>
			</div>
			<div class="img_location">
				<img src="img/travel_pg/special_2.jpg">
				<div class="details">
					<h2 >YalaPark</h2>
					<a href="#f1"><h4 onclick="funcDestination('YalaPark')">Pick</h4></a>
				</div>
			</div>
			<div class="img_location">
				<img src="img/travel_pg/special_4.jpg">
				<div class="details">
					<h2 >Trincomalee</h2>
					<a href="#f1"><h4 onclick="funcDestination('Trincomalee')">Pick</h4></a>
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
				<form action="TransManageHandler" method="post" onsubmit="return confirmInsert()">
					<input type="hidden" name="action" value="newTravel">
					<input type="hidden" name="uid" value="<%=uid%>">
					<input type="hidden" name="uname" value="<%=username%>">
					
					<div class="find_item">
						<label >Destination</label>
						<input type="text" name="destination" id="dLocation" placeholder="Destination" required >
	
					</div>
					<div class="find_item">
						<label >Cost (lkr)</label>
						<input type="text" name="cost" id="travelCost" placeholder="Cost" required >
	
					</div>
					<div class="find_item">
						<label>Need Date </label>
						<input id="datefield" type='date' name="needdate" min='1899-01-01' max='2022-07-01' onclick="dateGet()"></input>
						<!-- <input type="date" name="needdate" required="required" class="gg"> -->
					</div>
					<button type="submit">Arrange</button>
				</form>
			</div>
		</div>
	</section>
	<div class="travel_main_2" id="recentRideTable" >
		<div>
			<h3>Recent Ride</h3>
		</div>
		<table style="text-align: center;" >
			<tr>
				<th>Request Id</th>
				<th>Destination</th>
				<th>Request date</th>
				<th>Amount</th>
				<th>Confirm</th>
				<th></th>
			</tr>
			<%
				TransManageDao dao = new TransManageDao();
				List<TransManageBeans> travelList = dao.getUserTravelList(uid);
				
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
  							<span class="drop_menu" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  					<i class="fa fa-ellipsis-v" ></i>
			  				</span>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							    <button type="button" class=" btn dropdown-item" data-toggle="modal" data-target="#exampleModal" data-whatever="<%=travel.getTid()%>" disabled="disabled">Edit</button>
							    <button type="button" class="btn dropdown-item" disabled="disabled"><a href="TransManageHandler?action=deleteReq&tid=<%=travel.getTid()%>" >Del</a></button>
							  </div>
						</div>
					</td>
				<%
					}else if (travel.getIsApproved() == 2) {
				%>
					<td class="warning-td">Deny</td>
					<td>
						<div class="dropdown">
  							<span class="drop_menu" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  					<i class="fa fa-ellipsis-v" ></i>
			  				</span>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							    <button type="button" class=" btn dropdown-item" data-toggle="modal" data-target="#exampleModal" data-whatever="<%=travel.getTid()%>" disabled="disabled">Edit</button>
							    <button type="button" class="btn dropdown-item" disabled="disabled"><a href="TransManageHandler?action=deleteReq&tid=<%=travel.getTid()%>">Del</a></button>
							    <button type="button" class="btn dropdown-item" data-toggle="modal" data-target="#MesssgeDialogBox<%=travel.getTid()%>" data-whatever="<%=travel.getTid()%>,<%=travel.getUid()%>">Message</button>
							  </div>
						</div>
					</td>

					<div class="modal fade" id="MesssgeDialogBox<%=travel.getTid()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >

						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						   	<div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Change</h5>

						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
	    				    </div>
									<div class="form_body">
	    		 		  			 	<form action="TransManageHandler?action=sendMessage&tid=<%=travel.getTid()%>&uid=<%=uid%>" method="post">
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
											List<TransManageBeans> msDisplay=dao.getUserTravelMessageList(travel.getTid());
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
					<td >
						<div class="dropdown">
  							<span class="drop_menu" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  					<i class="fa fa-ellipsis-v" ></i>
			  				</span>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							    <button type="button" class=" btn dropdown-item" data-toggle="modal" data-target="#dropdown_menu<%=travel.getTid()%>" data-whatever="<%=travel.getTid()%>">Edit</button>
							    <button type="button" class="btn dropdown-item"><a href="TransManageHandler?action=deleteReq&tid=<%=travel.getTid()%>">Del</a></button>
							    <button type="button" class="btn dropdown-item" onclick="confirmDel(<%=travel.getTid()%>)">Del 2</button>
							  </div>
						</div>
					</td>
					<!-- <td><a href="EditTheTravel.jsp?tid=<%=travel.getTid()%>">Edit</a></td>  -->
					<!--
						Edit drop down menu
					 -->
				 	<div class="modal fade" id="dropdown_menu<%=travel.getTid()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">  
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						   	<div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Change</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
	    				    </div>
						      <form action="TransManageHandler?tid=<%=travel.getTid()%>"  method="post">
						     		<div class="form_body">
							     		<div class="form-group">
							         		 <input type="hidden" value="editTravelReq" name="action">
											 <label>Destination </label><br>
											 <input type="text" name="destination" value="<%=travel.getDestination()%>" required="required"><br>
										</div>
										<div class="form-group">
											<label>Need date </label><br>
											<input type="date" name="needdate" value="<%=travel.getNeedDate()%>" required="required"><br>
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
			</tr>
			<%
				}
			}else if(travelList.size()==0 && session.getAttribute("currentSessionUser")!=null){
			%>
				<tr style="text-align: center">
					<td colspan="5"><h6>You don't have any requested ride yet.</h6></td>
				</tr>
			<%
			}else if(session.getAttribute("currentSessionUser")==null){
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


$('#dropdown_menu').on('show.bs.modal', function (event){
	  var button = $(event.relatedTarget)
	  var recipient = button.data('whatever')
	  var modal = $(this)
	  modal.find('.modal-title').text('Send message to ' + recipient )
	  modal.find('.modal-body input').val(recipient)
	})

/* ********** */
	/* javascript for showing the bottom of the div content with overflow hidden */

	document.getElementById("msList").scrollTop = document.getElementById("msList").scrollHeight;

	/* ****** */

	function funcDestination(parX) {
		
		document.getElementById('dLocation').value=parX;	
		
		var x=parX;
		if(x=='ArugamBay'){
			document.getElementById('travelCost').value=19750;
		}else if(x=='HortonPlace'){
			document.getElementById('travelCost').value=11500;
		}else if(x=='YalaPark'){
			document.getElementById('travelCost').value=13400;
		}else if(x=='Trincomalee'){
			document.getElementById('travelCost').value=15850;
		}
		
	}
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

function confirmDel(id){
	
	var doIt=confirm('Do you want to delete the record?');
	  if(doIt){
		  document.location='TransManageHandler?action=deleteReq&tid='+id;
	   
	    }
	  else{

	    }
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
/* 
	var id2=document.getElementById('id2');

	id2.onclick=myfunctionAru;

	function myfunctionAru(){
		var name=this.getAttribute('data-name');
		document.getElementById('dl').innerHTML=name;
		document.getElementById('dlText').value=name;
	}

	var button = document.getElementById('button');

	button.onclick = myfunction1;

	function myfunction1() {
	  var name = this.getAttribute('data-name');
	  alert(name);}
	
	

function myFunction() {
		var x=12;
		  document.getElementById("dLocation").innerHTML = x;
		}

*/

</script>
</html>
