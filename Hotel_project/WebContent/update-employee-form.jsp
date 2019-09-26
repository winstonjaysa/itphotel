<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">

*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {

	color: #fff;

}


#form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  border-radius: 8px;
  color: black;

}

#head {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,.1);
  border: none;
  border-radius: 4px;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  -webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
          box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
  -webkit-transition: .4s;
          transition: .4s;
}
input[type="text"],
input[type="password"],
input[type="email"],
textarea {
  border-top: 2px solid #d2d9dd;
}

input[type="text"]:focus,
input[type="password"]:focus,
input[type="email"]:focus,
input[type="search"]:focus {
  background: #d2d9dd;
  border-radius: 30px;
  border-top: none;
}

textarea:focus {
  background: #d2d9dd;
}


input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

button {
  position: relative;
  display: block;
  padding: 19px 39px 18px 39px;
  color: #FFF;
  margin: 0 auto;
  background: #f28080;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  width: 100%;
  border: 1px solid #f28080;
  border-width: 1px 1px 3px;
  margin-bottom: 10px;
  transition: .4s;
}

button:hover {
  color: #9b59b6;
  width: 70%;
  border-radius: 30px;
  background: transparent;
  border-width: 2px 2px 3px;
  border-color: #9b59b6;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background: #f28080;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 8px 5px 8px 20px;
}


@media screen and (min-width: 480px) {#form {max-width: 480px}}
@media screen and (min-width: 1024px) {
  #form {max-width: 960px}
  fieldset {
    position: relative;
    float: left;
    width: 45%;
  }

  fieldset.profile {
    width: 54%;
    float: right;
  }
}




</style>


</head>
<body>
<div id="form">
 <form method="get" action="EmployeeControllerServlet">

<input type="image" src="left-arrow.png" width="28" height="28" alt="Submit">
</form>
      
<form action="EmployeeControllerServlet" method="get">
<input type="hidden" name="command" value="UPDATE" />
    <input type="hidden" name="employeeId" value="${THE_EMPLOYEE.id}" /> 
   <div id="head">
        <h1>Update Employee</h1>
      
    </div>
        
        <fieldset>
          
          <legend><span class="number">1</span> basic info</legend>
          
          <input type="text" id="name" name="name" placeholder="Name*" value="${THE_EMPLOYEE.nic}" required>
          
          <input type="text" id="nic" name="nic" placeholder="Nic*" value="${THE_EMPLOYEE.name}"  required>

          <input type="text" id="address" name="address" placeholder="address*" value="${THE_EMPLOYEE.address}"  required>
          
           <input type="number"  name="age" placeholder="age*" required value="${THE_EMPLOYEE.age}" >
          
         
        
        </fieldset>
       
        
        <fieldset class="profile">
          <legend><span class="number">2</span> Your profile</legend>
          
            <input type="text" id="position" name="position" placeholder="position*" value="${THE_EMPLOYEE.position}" required>
          
              <input type="number" id="hourlyrate" name="hourlyrate" placeholder="hourlyrate*" value="${THE_EMPLOYEE.hourlyrate}" required>
              
                <input type="number" id="fixed" name="fixed" placeholder="fixed salary*" value="${THE_EMPLOYEE.fixed}" required>
          
          </fieldset>
      
       
        <button type="submit">Edit Details</button>
        
      </form>
</div>
</body>
</html>