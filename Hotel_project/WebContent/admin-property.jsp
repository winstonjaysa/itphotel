<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.lx.Beans.propertyBean"%>
<%@ page import="com.lx.Dao.PropertyDao"%>
<%@ page import="com.lx.Handler.PropetyHandler"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>

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

</head>
<body>
<%
	contactUsDao dao_Contact=new contactUsDao();
	 UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");

	String uNAME=(String)session.getAttribute("currentU");
	String uNAME2=null;
	String uname=null;
	String uRole=null;
	
	int uid=0;
	
	if(session.getAttribute("currentSessionUser")==null){
		response.sendRedirect("index.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && !sessionCurrentBean.getRole().equals("admin")){
		response.sendRedirect("index.jsp");
	}
	else if((session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && (!sessionCurrentBean.getAdmin_role_type().equals("prop") || sessionCurrentBean.getAdmin_role_type().equals(" ")))){
		response.sendRedirect("index.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && sessionCurrentBean.getAdmin_role_type().equals("prop") ){
		//UserBean sss=(UserBean) session.getAttribute("currentSessionUser");
		uRole=sessionCurrentBean.getRole();
		uNAME2=sessionCurrentBean.getFname();
		uname=sessionCurrentBean.getUname();
		uid=sessionCurrentBean.getUid();
	} 
	
	
%>

	<%@include file="naviBar-user.jsp"%>
	<div class="leftPanel" id="navigation">
		<p>MAIN NAVIGATION</p>
		<a data-tab="#tab_1" data-tabCss="#panel_1">
			<div class="panel active" id="Panel_1">
				<i class="fas fa-chart-bar"></i><span>Property DB</span>
			</div>
		</a> <a data-tab="#tab_2" data-tabCss="#panel_2">
			<div class="panel" id="Panel_2">
				<i class="fas fa-couch"></i> <span>Insert Property</span>
			</div>
		</a> <a data-tab="#tab_3" data-tabCss="#panel_3">
			<div class="panel" id="Panel_3">
				<i class="fas fa-cogs"></i> <span>Change</span>
			</div>
		</a>
	</div>
	<div class="mainDiv">
		<div id="tab_1" class="panel_main">
			<section>
				<div class="card-1">
				<%
					PropertyDao dao = new PropertyDao();
					List<propertyBean> propertyList = dao.getAllProperty();
				%>
	
				
				<br>
					<h3>Requested Rides</h3>
					<div class="searchbox-table">
						<input class="form-control" id="myInput" type="text" placeholder="Search..">
			 		</div>
	
					<table id="myTable" >
						<thead>
							<tr class="table100-head">
								<th class="column3">DB ID</th>
								<th class="column3">Property ID</th>
								<th class="column6">Property Name</th>
								<th class="column6">Property Value</th>
								<th class="column6">No of Units</th>
								<th class="column6">Company Name</th>
								<th class="column6">Company Email</th>
								<th class="column6"> Number</th>
		
		
								<th class="column3">Edit</th>
								<th class="column6">Delete</th>
								
							</tr>
						</thead>
						<tbody>
		
								<%
									for (propertyBean pb : propertyList) {
								%>
							<tr id="<%=pb.getPropid()%>">						
								<td class="column6"><%=pb.getPropid()%></td>
								<td class="column6"><%=pb.getPid()%></td>
								<td class="column6"><%=pb.getPname()%></td>
								<td class="column6">LKR. <%=pb.getPvalue()%></td>
								<td class="column6"><%=pb.getPnoofItems()%></td>
								<td class="column6"><%=pb.getPbrand()%></td>
								<td class="column6"><%=pb.getPemail()%></td>
								<td class="column6"><%=pb.getPpnumber()%></td>
		
		
								<td class="column3">
									<button type="button" class=" btn dropdown-item" data-toggle="modal" data-target="#dropdown_menu<%=pb.getPropid()%>" data-whatever="<%=pb.getPropid()%>">Edit</button>
								</td>
								<td class="column6">
									<a href="PropetyHandler?action=delete&propertyId=<%=pb.getPropid()%>">
										Delete
									</a>
								</td>
								
								<div class="modal fade" id="dropdown_menu<%=pb.getPropid()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">  
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								   	<div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Change</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
			    				    </div>
								      <form action="PropetyHandler?propid=<%=pb.getPropid()%>"  method="post">
								     		<div class="form_body">
									         	<input type="hidden" value="edit" name="action">
												<div class="form-group">
													<label>Property ID</label><br>
													<input type="text" name="pid" value="<%=pb.getPid()%>" required="required"><br>
												</div>
									     		<div class="form-group">
													 <label>Property Name</label><br>
													 <input type="text" name="pname" value="<%=pb.getPname()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Property Value </label><br>
													<input type="text" name="pvalue" value="<%=pb.getPvalue()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>No of Units </label><br>
													<input type="text" name="pnoofitems" value="<%=pb.getPnoofItems()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Company Name </label><br>
													<input type="text" name="pbrand" value="<%=pb.getPbrand()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Company Email </label><br>
													<input type="text" name="pemail" value="<%=pb.getPemail()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Number </label><br>
													<input type="text" name="ppnumber" value="<%=pb.getPpnumber()%>" required="required"><br>
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
		<div id="tab_2" class="panel_main">
			<section>
				<div class="card-1">
					<div class="form-style">
						<form method="POST" action="PropetyHandler" name = "myForm" onsubmit= "return(validate());">
							<input type="hidden" name="action" value="insert" />
							
							<h3>Add Property Details</h3>
							
							<div class="form_item">
								<label>Property ID</label>
								<input type="text" name="pid" placeholder="pid">
							</div>
							<div class="form_item">
								<label>Property Name</label>
								<input type="text" name="pname" placeholder="pname">
							</div>
							<div class="form_item">
								<label>Property Value</label>
								<input type="text" name="pvalue" placeholder="pvalue">
							</div>
							<div class="form_item">
								<label>No of Units</label>
								<input type="text" name="pnoofItems" placeholder="pnoofItems">
							</div>
							<div class="form_item">
								<label>Company Name</label>
								<input type="text" name="pbrand" placeholder="pbrand">
							</div>
							<div class="form_item">
								<label>Company Email</label>
								<input type="text" name="pemail" placeholder="pemail">
							</div>
							<div class="form_item">
								<label>Company Phone Number</label>
								<input type="text" name="ppnumber" placeholder="ppnumber">
							</div>

							<button type="submit">Save Property</button>

						</form>
					</div>
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
								<input type="hidden" name="link" value="admin-property.jsp">
								
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
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>


  <script type = "text/javascript">

        function validate() {


           if( document.myForm.pname.value == "" ) {
              alert( "Please provide your Property Name!" );
              document.myForm.pname.focus() ;
              return false;
           }
           if( document.myForm.pemail.value == "" ) {
              alert( "Please provide your Email!" );
              document.myForm.pemail.focus() ;
              return false;
           }
           if( document.myForm.pid.value == "" || isNaN( document.myForm.pid.value ) ||
              document.myForm.pid.value.length != 3 ) {

              alert( "Please provide your Invoice Number!" );
              document.myForm.pid.focus() ;
              return false;
           }
           if( document.myForm.pvalue.value == "" ) {
              alert( "Please provide your Property Unit Price !" );
              document.myForm.pvalue.focus() ;
              return false;
           }
           if( document.myForm.pnoofItems.value == "" ) {
              alert( "Please provide your number of Items" );
              document.myForm.pnoofItems.focus() ;
              return false;
           }

           if( document.myForm.pbrand.value == "" ) {
              alert( "Please provide your property Company Name" );
              document.myForm.pbrand.focus() ;
              return false;
           }

           if( document.myForm.ppnumber.value == "" ) {
              alert( "Please provide your property Company Number" );
              document.myForm.ppnumber.focus() ;
              return false;
           }

           if( document.myForm.ppnumber.value == "" || isNaN( document.myForm.ppnumber.value ) ||
              document.myForm.ppnumber.value.length != 10 ) {

              alert( "Please provide 10 Digth phone Number!" );
              document.myForm.pnumber.focus() ;
              return false;
           }



           return( true );
        }

  </script>















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