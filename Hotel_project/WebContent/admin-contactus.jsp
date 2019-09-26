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
<title>admin-contactUs</title>
</head>
<body>
<%
	contactUsDao dao = new contactUsDao();
	UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");	

	String uNAME2=null;
	String uRole=null;

	if(session.getAttribute("currentSessionUser")==null){
		response.sendRedirect("home.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && !sessionCurrentBean.getRole().equals("admin")){
		response.sendRedirect("home.jsp");
	}
	else if((session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && (!sessionCurrentBean.getAdmin_role_type().equals("cont") || sessionCurrentBean.getAdmin_role_type().equals(" ")))){
		response.sendRedirect("home.jsp");
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
				<i class="fas fa-comments"></i><span>Messages ( User )</span>
			</div>
		</a> <a data-tab="#tab_2" data-tabCss="#panel_2">
			<div class="panel" id="Panel_2">
				<i class="fas fa-comment-dots"></i><span>Messages ( Admin ) </span>
			</div>
		</a> <a data-tab="#tab_3" data-tabCss="#panel_3">
			<div class="panel" id="Panel_3">
				<i class="fas fa-cogs"></i> <span>Change</span>
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
			
			<table id="myTable2" style="text-align: center;">
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
						<td><%=cb2.getInbox()%></td>
						<td><a href="ContactusHandler?action=delete&cid=<%=cb2.getCid()%>">delete</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
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

</script>
</html>