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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	
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
					<div>
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
						
						
						
						<%
							}
						%>
					</table>
				</div>
		</div>
	</div>
	<div id="tab_2" class="panel_main">
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
</script>
</html>