function validate(){
	  var uname = document.getElementById("uname").value;
	  var pwd = document.getElementById("pwd").value;
	  var phone = document.getElementById("phone").value;
	  var email = document.getElementById("email").value;
	  var fname = document.getElementById("fname").value;
	  var lname = document.getElementById("lname").value;
	  
	  var error_message = document.getElementById("error_message");
	  
	  error_message.style.padding = "10px";
	  
	  var text;
	  if(uname.length == 0){
	    text = "Please Enter User Name";
	    error_message.innerHTML = text;
	    return false;
	  }
	  
	  if(pwd.length == 0){
	    text = "Please Enter Password";
	    error_message.innerHTML = text;
	    return false;
	  }
	 
	  if(fname.length == 0){
	    text = "Please Enter First Name";
	    error_message.innerHTML = text;
	    return false;
	  }
	  if(lname.length == 0){
	    text = "Please Enter Last Name";
	    error_message.innerHTML = text;
	    return false;
	  }
	  if(isNaN(phone) || phone.length != 10){
	    text = "Please Enter valid Phone Number";
	    error_message.innerHTML = text;
	    return false;
	  }
	  if(email.indexOf("@") == -1 || email.length < 6){
	    text = "Please Enter valid Email";
	    error_message.innerHTML = text;
	    return false;
	  }

	  alert("Form Submitted Successfully!");
	  
	  return true;
	}