<%@ page import="java.util.*" %>
<%@ page import="com.*" %>
<%@ page import="com.lx.Beans.UserBean" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    

<!DOCTYPE html >
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<style>

@import url(https://fonts.googleapis.com/css?family=Karla:400,700);

body {
	margin: 0px;
	padding: 0px;
	background-color: #f1f1f1;
	font-family: 'Karla', sans-serif;
    color: #333;}

/* Header */
header {
	background-color: #333333;
	margin: 0px 0px 40px 0px;
	padding: 10px 0px 0px 0px;
	min-height: 50px;
	text-align: center;}

h2 {
	font-size: 180%;
	margin: 0px;}
h2, h4 {
	font-weight: normal;}
h4 {
	color: #333;
	display: inline-block;
	font-size: 120%;
	margin: 5px 0px 5px 0px;
}

/* Filter and search options */
#price-range {
	width: 370px;
	margin: 10px auto 30px auto;
	text-align: center;
	font-weight: bold;}
#value-min, #value-max {width: 100px;}
#slider {margin: 30px 0px 30px 0px;}
input[type="number"] {margin: 0px 10px 0px 10px;}
/* Filter and search options */
#buttons, #search {
	text-align: center;
	margin-bottom: 30px;}

/* Filter buttons */
button {
	background-color: #d7d7d7;
	border: none;
	padding: 3px 10px 4px 10px;
	border-radius: 4px;
	color: #333;
	font-family: 'Karla', sans-serif;
	font-size: 100%;}

button:hover, button.active {
	background-color: #00cccc;
	color: #fff;
	cursor: pointer;}


/* Search input */
input {
	font-size: 120%;
	border: 1px solid #999;
	padding: 5px;}
input:hover {
	border: 1px solid #666;}
input:focus {
	border: 1px solid #00cccc;
	outline: none;}


/* Gallery of images */



/* Table styles */
table {
	margin: 0px auto;
	width:500px; margin-left:15%; margin-right:15%;
	 }
table#rates	{width: 380px;}
th, td {
	border-radius: 3px;
	color: #333;
	padding: 7px 10px 5px 10px;
	min-width: 4em;
	text-align: left;}
th {
	background-color: #d7d7d7;
	font-weight: bold;
	text-transform: uppercase;}
td {
	background-color: #fff;}
table.sortable th:hover  {

}
.id:hover {
background-color: #00cccc;
	color: #fff;
	cursor: pointer;}
	
	

h2{

 font-family: Impact, Charcoal, sans-serif;
 text-align: center;


}


.button {
  background:#f28080;
  box-shadow:8px 8px 0 rgba(0,0,0,.5);
  display:inline-block;
  font-size:1.8em;
  padding:.1.19em 1.0em;
  text-decoration:none;
  margin-left: 200px;
  margin-top: 5px;
  color: white;
}

.button1 {
  background:#f28080;
  box-shadow:8px 8px 0 rgba(0,0,0,.5);
  display:inline-block;
  font-size:1.8em;
  padding:.1.19em 1.0em;
  text-decoration:none;
  margin-left: 0px;
  margin-top: 5px;
  color: white;
}

.button:hover {

  box-shadow: 0 0 0 ;
}
.button1:hover {

  box-shadow: 0 0 0 ;
}


.skew-fix{
  display:inline-block;
  transform: skew(20deg);
}




h1,
h6 {
	font-family: 'Open Sans';
	font-weight: 300;
	text-align: center;
	position: absolute;
	top: 45%;
	right: 0;
	left: 0;
}



@import url(https://fonts.googleapis.com/css?family=Lato:700);

a {
color: #fafafa;
display: block;
text-decoration: none;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
transition: .5s;
}

.btn {
  background: #2d3039;
  margin : 20px auto;
  width : 100px;
  height : 40px;
  overflow: hidden;
  text-align : center;
  transition : .4s;
  cursor : pointer;
  border-radius: 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,.2);
}
.btnText {
  color : white;
  transition : .3s;
  margin-bottom: 50px;
}
.btn:hover .hoverBtn{
  left: 0px;
}
.btn:hover a{
  margin-left : 65px;
}
.hoverBtn {
  position : relative;
  width : 200px;
  height : 100px;
  margin-top: -100px;
  padding-top: 2px;
  background : #ED5565;
  left : -250px;
  transition : .3s;
}
.hoverText {
  margin-top : 63px;
  margin-left : -56px;
  text-align: left;
  color : #fafafa;
  font-size: 12px;
}
.hoverBtn:active {
  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
  background-color:  #DA4453;
}


.hr{

color: red;



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
		response.sendRedirect("home.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && !sessionCurrentBean.getRole().equals("admin")){
		response.sendRedirect("home.jsp");
	}
	else if((session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && (!sessionCurrentBean.getAdmin_role_type().equals("emp") || sessionCurrentBean.getAdmin_role_type().equals(" ")))){
		response.sendRedirect("home.jsp");
	}
	else if(session.getAttribute("currentSessionUser")!=null && sessionCurrentBean.getRole().equals("admin") && sessionCurrentBean.getAdmin_role_type().equals("emp") ){
		//UserBean sss=(UserBean) session.getAttribute("currentSessionUser");
		uRole=sessionCurrentBean.getRole();
		uNAME2=sessionCurrentBean.getFname();
		uid=sessionCurrentBean.getUid();
		uname=sessionCurrentBean.getUname();
		
	}
	
%>
<h2>Employee Management</h2>
<br>

<input type="button" value="Add Employee" onclick="window.location.href='add-employee-form.jsp'; return false"
class="button" class="skew-fix"/>
<input type="button" value="Add Employee photo" onclick="window.location.href='index.jsp'; return false"
class="button1" class="skew-fix"/>


<table class="sortable">
      <thead>
        <tr>
          <th data-sort='EmpId'> EmpId</th>
          <th data-sort= 'Nic'>Nic</th>
          <th data-sort= 'Name'>Name</th>
          <th data-sort= 'Address'>Address</th>
          <th data-sort= 'Gender'>Gender</th>
          <th data-sort= 'Age'>Age</th>
          <th data-sort= 'Position'>Position</th>
          <th data-sort= 'Hourlyrate'>Hourlyrate</th>
          <th data-sort= 'FixedSalary'>Fixed Salary</th>
          <th data-sort= 'Action'>Action</th> 
        </tr>
      </thead>
      <tbody>
      <c:forEach var="tempEmployee" items="${EMPLOYEE_LIST}">
      
       <c:url var="tempLink" value="EmployeeControllerServlet"> 
       <c:param name="command" value="LOAD"/> 
        <c:param name="employeeId" value="${tempEmployee.id}"/> 
        </c:url> 
        
         <c:url var="deleteLink" value="EmployeeControllerServlet"> 
       <c:param name="command" value="DELETE"/> 
        <c:param name="employeeId" value="${tempEmployee.id}"/> 
        </c:url>
        
         <c:url var="profileLink" value="EmployeeControllerServlet"> 
       <c:param name="command" value="PROFILE"/> 
        <c:param name="employeeId" value="${tempEmployee.id}"/> 
        </c:url>
       
	<tr>
	<td class="id" data-sort='EmpId'><a href="${profileLink}" class="hr">${tempEmployee.id}</a></td>
   <td data-sort='Nic'>${tempEmployee.nic}</td>
   <td data-sort='Name'>${tempEmployee.name}</td>
   <td data-sort='Address'>${tempEmployee.address}</td>
   <td data-sort='Gender'>${tempEmployee.gender}</td>
   <td data-sort='Age'>${tempEmployee.age}</td>
   <td data-sort='Position'>${tempEmployee.position}</td>
   <td data-sort='Hourlyrate'>${tempEmployee.hourlyrate}</td>
   <td data-sort='FixedSalary'>${tempEmployee.fixed}</td>
   <td>
   <div class="btn"><a href="">Update</a>
   <div class="hoverBtn">
   <div class="hoverText" class="btn"><a href="${tempLink}">ARE YOU SURE?</a>
   </div>
   </div>
 </div>
 
 <div class="btn"><a href="">Delete</a>
   <div class="hoverBtn">
   <div class="hoverText" class="btn"><a href="${deleteLink}"  onclick="if(!(confirm('do you wish permanently delete this employee?'))) return false">ARE YOU SURE?</a>
   </div>
   </div>
 </div>
 
 </td>
	</tr>
  </c:forEach>
      
      </tbody>
    </table>




</body>


</html> 