
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.lx.Beans.paymentBean" %>
<%@page import="com.lx.Dao.paymentDao" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/main.css">
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
<title>Insert title here</title>
</head>
<body>
	<% 
	contactUsDao dao_Contact=new contactUsDao();
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
	else if((session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && (!sessionCurrentBean.getAdmin_role_type().equals("pay") || sessionCurrentBean.getAdmin_role_type().equals(" ")))){
		response.sendRedirect("travel.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && sessionCurrentBean.getAdmin_role_type().equals("pay")){
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
				<i class="fas fa-file-invoice-dollar"></i> <span>AddBills</span>
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
			<section>
				<div class="card-1">
					<div class="form-style">
						<form action="payamenthandler" method="post">
							<input type="hidden" name="action" value="insert">
							<h3>Add Payment Details</h3>
							<div class="form_item">
								<label>Payment Id</label>
								<input type="text" name="billid">
							</div>
							<div class="form_item">
								<label>Date</label>
								<input type="date" name="date">
							</div>
							<div class="form_item">
								<label>Payment Method</label>
								<select name="paymentMethod">
									<option>Cash</option>
									<option>Visa</option>
								</select>
							</div>
							<div class="form_item">
								<label>Category</label>
								<select name="category">
									<option>Travel</option>
									<option>Electricity</option>
									<option>Reservation</option>
									<option>Water</option>
									<option>Employee</option>
									<option>Laundry</option>
									<option>Other</option>
								</select>
							</div>
							<div class="form_item">
								<label>Price</label>
								<input type="text" name="price">
							</div>
							<button type="submit">submit</button>
						</form>
					</div>
				</div>
			</section>
		</div>
		<div id="tab_2" class="panel_main">
			<section>
				<div class="card-1">
					<table style="text-align: center;">
						<tr>
							<th>pid</td>
							<th>billid</th>
							<th>date</th>
							<th>paymentMethod</th>
							<th>category</th>
							<th>price</th>
							<th></th>
							<th></th>
						</tr>
						<%
							paymentDao dao = new paymentDao();
							List<paymentBean> paymentList = dao.getAllpayment();
							for (paymentBean payment : paymentList) {
						%>
						<tr>
							<td><%=payment.getPid()%></td>
							<td><%=payment.getBillid()%></td>
							<td><%=payment.getDate()%></td>
							<td><%=payment.getPaymentMethod()%></td>
							<td><%=payment.getCategory()%></td>
							<td><%=payment.getPrice()%></td>
							<td><button type="button" class=" btn dropdown-item" data-toggle="modal" data-target="#dropdown_menu<%=payment.getPid()%>" data-whatever="<%=payment.getPid()%>">Edit</button></td>
							<td><button type="button" class="btn dropdown-item" onclick="confirmDel(<%=payment.getPid()%>)">Delete</button></td>
						</tr>
						
						<div class="modal fade" id="dropdown_menu<%=payment.getPid()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">  
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						   	<div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Change</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
	    				    </div>
						      <form action="payamenthandler?pid=<%=payment.getPid()%>"  method="post">
						     		<div class="form_body">
							     		<div class="form-group">
							         		 <input type="hidden" value="editPayment" name="action">
											 <label>Destination </label><br>
											 <input type="text" name="category" value="<%=payment.getCategory()%>" required="required"><br>
										</div>
										<div class="form-group">
											<label>Need date </label><br>
											<input type="text" name="paymentMethod" value="<%=payment.getPaymentMethod()%>" required="required"><br>
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
					</table>
				</div>
			</section>
		</div>
		<div id="tab_3" class="panel_main">
			<div class="card-1">
				<div class="admin-message">
					<div class="admin-message-display-div">
						<%
					List<ContactUsBeans> adminMessage=dao_Contact.getAdminsContactMeassages(uid);
						for(ContactUsBeans cb:adminMessage){
							
						//	if ((cb.getInbox()==null || cb.getInbox().isEmpty()) && (!cb.getReply().isEmpty() || cb.getReply()!=null)){
							if(cb.getTo_uid()==uid){
						%>
						<div class="form-group">
							<div class="divclass1">
								<p><%=cb.getReply() %></p>
							</div>
						</div>
						<%
						}
							//else if ((cb.getReply()==null || cb.getReply().isEmpty()) && (!cb.getInbox().isEmpty() || cb.getInbox()!=null)){
							else if(cb.getTo_uid()==17 && cb.getUid()==uid){
						%>
						<div class="form-group">
							<div class="divclass2">
								<p><%=cb.getInbox() %></p>
							</div>
						</div>
						<%
						}
						}
						%>
					</div>	
					<div class="fixed-div-message">
						<div class="admin-message-send-div">
							<form action="ContactusHandler" method="post">
								<input type="hidden" name="action" value="insertAdmin">
								<input type="hidden" name="uid" value="<%=uid%>">
								<input type="hidden" name="to_uid" value="17">
								<input type="hidden" name="uname" value="<%=uname%>">
								<input type="hidden" name="link" value="admin-payment.jsp">
								
								<input type="text" name="inbox">
									
								<button type="submit">submit</button>
							</form>
						</div>
					</div>				
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
</script>
</html>