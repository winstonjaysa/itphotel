<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<style type="text/css">

@import "compass/css3";

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300,700);

body {
  background:#f1f1f1;
}

.container {
  max-width:500px;
  margin-left:350px;
  margin-right:auto;
  margin-top:10%;
  
}

h1 {
  font-family: "Open Sans", sans;
  font-weight:300;
  text-align:center;
  color:solid black;
  margin-left:100px;
}

h2 {
  color:#2c3e52;
  font-family:  "Open Sans", sans;
  font-size: 14px;
  text-align:center;
  font-weight:700;
  margin-bottom:50px;
  
}

.service-details {
	width: 660px;
	height: 350px;	
	/*height: 230px;*/
	overflow: hidden;
	position: relative;
}

.service-details img {
	position: absolute;
	top: 0;
	left: 0;
	height: inherit;
	width: auto;
	height: 100%;
	float: left;
	transition: all 0.8s;
	-moz-transition: all 0.8s;

}

.service-details:hover img {
	/*opacity: 0.4 !important;*/
}

.service-details .service-hover-text h3 {
	padding: 0px;
	margin: 0px;
	font-size: 25px;
  font-weight:300;
	font-family: "Open Sans";
}

.service-details .service-hover-text h4 {
	padding: 0px;
	padding-bottom: 13px;
	margin: 0px;
	font-size: 14px;
  letter-spacing: 3px;
	width: 90%;
	font-family: "Open Sans";
  text-transform:uppercase;
	border-bottom: 2px solid #000;
}

.service-details .service-hover-text p {
	padding-top: 13px;
	font-size: 14px;
	line-height: 20px;
	font-family: "Open Sans";
}


.service-details .service-hover-text{
	width: 42%;
	height: 89%;
	position: absolute;
	top: 0%;
	left: 50%;
	padding: 3% 4%;
	background: #D90E0E;
	color: rgba(255,255,255,1);
/*	display: none;*/
	transition: all 0.5s ease-in-out;
	-moz-transition: all 0.4s;
}

.service-details:hover .service-hover-text {
	display: block !important;
	color: rgba(255,255,255,1);
	background:rgba(217,14,14,0.85);
	left: 0px;
	top: 0px;
}


.service-details .service-text {
	width: 50%;
	height: inherit;
	background: #000;
	float: left;
	position: absolute;
	left: 50%;
}

.service-details .service-text p {
	padding:100px 0px 0px 20px;
	font-size: 24px;
	font-family: "Open Sans";
  font-weight:700;
	color: #fff;
}

.service-details .service-text p span {
	font-family: "Open Sans" !important;
}

.service-details .service-text a , .service-white .service-text {
	padding: 0px 0px 0px 20px;
	font-size: 14px !important;
	color:#FF5A22 !important;
	font-family: "Open Sans" !important;
	text-decoration: none !important; 
}

.service-details .service-text {
	float: left;
} 

.service-white {
	background: #eee !important;
	width: 50% !important;
	height: inherit !important;
}

.service-white p {
	color: #000 !important;
}













form{

margin-left:0px;
margin-top: 20px;


}




</style>







</head>
<body>

<div class="container">

<form method="get" action="EmployeeControllerServlet">

<input type="image" src="left-arrow.png" width="28" height="28" alt="Submit">
</form>


  <h1>${THE_EMPLOYEE.nic}</h1>

  <div class="service-details">
  	<%
		String id = request.getParameter("employeeId");
		%>
    <img src="getImage.jsp?id=<%=id%>" alt="No image">
    <div class="service-hover-text">
      <h3></h3>
      <h4>${THE_EMPLOYEE.position}</h4>
      <p>
      NIC: ${THE_EMPLOYEE.nic}
      <br>
      Address: ${THE_EMPLOYEE.address}
      <br>
      Hourlyrate: ${THE_EMPLOYEE.hourlyrate}
      </p>
    </div>
    <div class="service-white service-text">
      <p></p>
      <a style="" >Employee ID : ${THE_EMPLOYEE.id}</a>
    </div>
  </div>
</div>

</body>
</html>