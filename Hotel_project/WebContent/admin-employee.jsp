<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.lx.Beans.employeeBean"%>
<%@ page import="com.lx.Dao.employeeDao"%>
<%@ page import="com.lx.Beans.attendanceBean"%>
<%@ page import="com.lx.Dao.salaryDao"%>
<%@ page import="com.lx.Handler.EmployeeHandler"%>
<%@ page import="com.lx.Handler.SalaryHandler"%>
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

<style type="text/css">

input[type=radio] {
    border: 0px;
    width: 50px;
    height: 1.5em;
}

.my-custom-scrollbar {
position: relative;
height: 350px;
width:1125px;
overflow: auto;

}
.table-wrapper-scroll-y {
display: block;
}

#form{

margin-top: 100px;


}

#choose{

margin-top: 50px;
margin-left: -420px;

}

#custom-button{

margin-right:300px;



}

#align{

margin-left: -1000px;
margin-bottom: 0px;

}



</style>


</head>
<body>
<%
	
	UserBean sessionCurrentBean=(UserBean) session.getAttribute("currentSessionUser");

	String uNAME=(String)session.getAttribute("currentU");
	//String uRole=(String)session.getAttribute("currentRole");
	String uNAME2=null,uname=null;
	String uRole=null;
	int uid=0;
	
	if(session.getAttribute("currentSessionUser")==null){
		response.sendRedirect("index.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && !sessionCurrentBean.getRole().equals("admin")){
		response.sendRedirect("index.jsp");
	}
	else if((session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && (!sessionCurrentBean.getAdmin_role_type().equals("emp") || sessionCurrentBean.getAdmin_role_type().equals(" ")))){
		response.sendRedirect("index.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && sessionCurrentBean.getAdmin_role_type().equals("emp") ){
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
				<i class="fas fa-chart-bar"></i><span>Employee info</span>
			</div>
		</a> <a data-tab="#tab_2" data-tabCss="#panel_2">
			<div class="panel" id="Panel_2">
				<i class="fas fa-couch"></i> <span>Add Employee</span>
			</div>
		</a> <a data-tab="#tab_3" data-tabCss="#panel_3">
			<div class="panel" id="Panel_3">
				<i class="fas fa-cogs"></i> <span>Upload image</span>
			</div>
		</a>
		<a data-tab="#tab_4" data-tabCss="#panel_4">
			<div class="panel" id="Panel_4">
				<i class="fas fa-cogs"></i> <span>time sheet</span>
			</div>
		</a>
	</div>
	<div class="mainDiv">
		<div id="tab_1" class="panel_main">
			<section>
				<div class="card-1">
				<%
					employeeDao dao = new employeeDao();
					List<employeeBean> employeeList = dao.getAllEmployee();
				%>
	
				
				<br>
					<h3>Employee Details</h3>
					<div class="searchbox-table">
						<input class="form-control" id="myInput" type="text" placeholder="Search..">
			 		</div>
	
	
					<table id="myTable" class="table-wrapper-scroll-y my-custom-scrollbar">
						<thead>
							    <tr class="table100-head">
							    <th class="column3">Image</th>
								<th class="column3">KeyID</th>
								<th class="column6">Employee ID</th>
								<th class="column6">Nic</th>
								<th class="column6">Name</th>
								<th class="column6">Address</th>
								<th class="column6">Gender</th>
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
									for (employeeBean pb : employeeList) {
								%>
							<tr id="<%=pb.getId()%>">	
									
								<td class="column6"><img src="getImage.jsp?id=<%=pb.getId()%> alt="no image" border=3 height=100 width=100></img></td>			
								<td class="column6"><%=pb.getId()%></td>
								<td class="column6"><%=pb.getPid()%></td>
								<td class="column6"><%=pb.getNic()%></td>
								<td class="column6"><%=pb.getName()%></td>
								<td class="column6"><%=pb.getAddress()%></td>
								<td class="column6"><%=pb.getGender()%></td>
								<td class="column6"><%=pb.getAge()%></td>
								<td class="column6"><%=pb.getPosition()%></td>
								<td class="column6"><%=pb.getHourlyrate()%></td>
								<td class="column6"><%=pb.getFixed()%></td>
		
		
								<td class="column3">
									<button type="button" class=" btn dropdown-item" data-toggle="modal" data-target="#dropdown_menu<%=pb.getId()%>" data-whatever="<%=pb.getId()%>">Edit</button>
								</td>
								<td class="column6">
									<a href="EmployeeHandler?action=delete&employeeId=<%=pb.getId()%>" onclick="if(!(confirm('do you wish permanently delete this employee?'))) return false">
										Delete
									</a>
								</td>
								
								<div class="modal fade" id="dropdown_menu<%=pb.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">  
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								   	<div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Change</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
			    				    </div>
								      <form action="EmployeeHandler?propid=<%=pb.getId()%>"  method="post">
								     		<div class="form_body">
									         	<input type="hidden" value="edit" name="action">
												<div class="form-group">
													<label>Employee ID</label><br>
													<input type="number" name="pid" value="<%=pb.getPid()%>" required="required"><br>
												</div>
									     		<div class="form-group">
													 <label>Nic</label><br>
													 <input type="text" name="nic" value="<%=pb.getNic()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Name</label><br>
													<input type="text" name="name" value="<%=pb.getName()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Address</label><br>
													<input type="text" name="address" value="<%=pb.getAddress()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Gender</label><br>
													<input type="text" name="gender" value="<%=pb.getGender()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Age</label><br>
													<input type="number" name="age" value="<%=pb.getAge()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Position</label><br>
													<input type="text" name="position" value="<%=pb.getPosition()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Hourlyrate</label><br>
													<input type="number" name="hourlyrate" value="<%=pb.getHourlyrate()%>" required="required"><br>
												</div>
												<div class="form-group">
													<label>Fixed salary</label><br>
													<input type="number" name="fixedsalary" value="<%=pb.getFixed()%>" required="required"><br>
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
						<form  method="POST" action="EmployeeHandler" name = "myForm" onsubmit= "return(validate());" >
							<input type="hidden" name="action" value="insert" />
							
							<h3>Add Employee Details</h3>
							
							<div class="form_item">
								<label>Employee ID</label>
								<input type="number" name="pid" placeholder="pid" id="pid">
							</div>
							<div class="form_item">
								<label>Nic</label>
								<input type="text" name="nic" placeholder="nic" id="nic">
							</div>
							<div class="form_item">
								<label>Name</label>
								<input type="text" name="ename" placeholder="name" id="ename">
							</div>
							<div class="form_item">
								<label>Address</label>
								<input type="text" name="address" placeholder="address" id="address">
							</div>
							<div class="form_item">
								 <label >Gender:</label>
                                 <input type="radio"  value="Male" name="rad" id="rad1"><label>Male</label><br>
                                 <input type="radio"  value="Female" name="rad" id="rad1"><label>Female</label>
							</div>
							<div class="form_item">
								<label>Age</label>
								<input type="number" name="age" placeholder="age" id="age">
							</div>
							<div class="form_item">
								<label>Position</label>
								<input type="text" name="position" placeholder="position" id="position">
							</div>
							<div class="form_item">
								<label>Hourlyrate</label>
								<input type="number" name="hourlyrate" placeholder="hourlyrate" id="hourlyrate">
							</div>
							<div class="form_item">
								<label>Fixed salary</label>
								<input type="number" name="fixedsalary" placeholder="fixedsalary" id="fixedsalary">
							</div>

							<button type="submit">Add Employee</button>
							
                             <a href="#" onClick="autoFill(); return true;" >Click to Autofill</a>
						</form>
						
					</div>
				</div>
			</section>
		</div>
		
		
		
		<div id="tab_3" class="panel_main">
			<section>
				<div class="card-1">
					
					
					<div id="form">
					<div class="form-style">
        <form action="uploadImage" method="post" enctype="multipart/form-data">
<div id="choose">
<input type="file" id="real-file" name="image" hidden="hidden"/>

<button type="button" id="custom-button">CHOOSE A FILE</button>
<span id="custom-text">No file chosen, yet.</span>

</div>
   <br><br>
            <div id="scale">
            Employee Id:
            <input type="number" name="empid" required="required"/><br/><br/>
            </div>
            <input type="submit" id="button" style=" display:block;
  height: 50px;
  width: 100px;
  background: rgb(202, 60, 60);
  color:white"/>
          
        </form>
        </div>
        </div>	
				</div>
			</section>
		</div>
		
		<div id="tab_4" class="panel_main">
			<section>
				<div class="card-1">
				
				
				<div class="form-style">
						<form  method="POST" action="SalaryHandler" name = "myForm" >
							<input type="hidden" name="action" value="insert" />
							
							<h3>Add Employee Salary info</h3>
							
							<div class="form_item">
								<label>Employee ID</label>
								<input type="number" name="propid" placeholder="pid" id="pid">
							</div>
							<div class="form_item">
								<label>Tax</label>
								<input type="text" name="tax" placeholder="nic" id="nic">
							</div>
							<div class="form_item">
								<label>hours worked</label>
								<input type="text" name="hworked" placeholder="name" id="ename">
							</div>
							
							<div class="form_item">
								<label>Leave taken(in Days)</label>
								<input type="text" name="leavetaken" placeholder="address" id="address">
							</div>
							

							<button type="submit">Add Employee info</button>
							
                             <a href="#" onClick="autoFill(); return true;" >Click to Autofill</a>
						</form>
						
					</div>
				
				
				
				
				
				
				
				
				
							</div>
			</section>
		</div>
					
        
   
		
		
		
</body>


 <script>
        
        
        const realFileBtn = document.getElementById("real-file");
        const customBtn = document.getElementById("custom-button");
        const customTxt = document.getElementById("custom-text");

        customBtn.addEventListener("click", function() {
          realFileBtn.click();
        });

        realFileBtn.addEventListener("change", function() {
          if (realFileBtn.value) {
            customTxt.innerHTML = realFileBtn.value.match(
              /[\/\\]([\w\d\s\.\-\(\)]+)$/
            )[1];
          } else {
            customTxt.innerHTML = "No file chosen, yet.";
          }
        });

        
        </script>




<script type ="text/javascript">

        function validate() {

     
        	pid = document.getElementById("pid");
        	nic = document.getElementById("nic");
        	ename = document.getElementById("ename");
        	address = document.getElementById("address");
        	rad1 = document.getElementById("rad1");
        	age = document.getElementById("age");
        	position = document.getElementById("position");
        	hourlyrate = document.getElementById("hourlyrate");
        	fixedsalary = document.getElementById("fixedsalary");

           if( document.myForm.ename.value == "" ) {
              alert( "Please provide the Employee Name!" );
              document.myForm.ename.focus() ;
              return false;
           }
           if( document.myForm.pid.value == ""|| isNaN( document.myForm.pid.value)) {

              alert( "Please provide Employee Id!" );
              document.myForm.pid.focus() ;
              return false;
          
              
           }
           if( document.myForm.pid.value.length != 3){
        	   alert( "Please provide a valid three digit Employee Id!" );
               document.myForm.pid.focus() ;
               return false;
           }
           
           if( document.myForm.address.value == "" ) {
              alert( "Please provide Employees address!" );
              document.myForm.address.focus() ;
              return false;
           }
           if( document.myForm.position.value == "" ) {
              alert( "Please employees position" );
              document.myForm.position.focus() ;
              return false;
           }

           if( document.myForm.age.value == "" ) {
              alert( "Please employees age!");
              document.myForm.age.focus() ;
              return false;
           }

           if( document.myForm.hourlyrate.value == "" ) {
              alert( "Please provide employees hourlyrate!" );
              document.myForm.hourlyrate.focus() ;
              return false;
           }

           if( document.myForm.fixedsalary.value == "") {
               alert( "Please provide employees fixedsalary!" );
               document.myForm.fixedsalary.focus() ;
               return false;
            }
           
           
           if( document.myForm.nic.value == "" || isNaN( document.myForm.nic.value ) ||
              document.myForm.nic.value.length != 15 ) {

              alert( "Please provide 15 character nic number!" );
              document.myForm.nic.focus() ;
              return false;
           }

           if((document.myForm.hourlyrate.value != "")&&(document.myForm.fixedsalary.value != "")){  
        		 
        	   
        	   if((document.myForm.hourlyrate.value == 0)||(document.myForm.fixedsalary.value == 0)){
        		   return true;
        	   }
        	   
        		alert("staff cant have both");
        		document.myForm.fixedsalary.focus() ;
        		return false;
        		
        		
        		}  

           return( true );
      
        }

  </script>
  
  
  <script type="text/javascript">
  function autoFill() {
    document.getElementById('pid').value = 234;
    document.getElementById('nic').value = "459454954859485";
    document.getElementById('ename').value = "winston";
    document.getElementById('address').value = "balagala road";
    var radioElements = document.getElementsByName("rad");

    for (var i=0; i<radioElements.length; i++) {
      if (radioElements[i].getAttribute('value') == 'Male') {
        radioElements[i].checked = true;
      }
    }
    document.getElementById('age').value = 21;
    document.getElementById('position').value = "receptionist";
    document.getElementById('hourlyrate').value = 0;
    document.getElementById('fixedsalary').value = 25000;
    
    
    
  }
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