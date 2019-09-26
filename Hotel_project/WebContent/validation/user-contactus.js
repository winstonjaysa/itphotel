/**
 * 
 */
/**
 * 
 */
function validate(){
	  var uname = document.getElementById("uname").value;
	  var email = document.getElementById("email").value;
	  var subject = document.getElementById("subject").value;
	  var message = document.getElementById("message").value;
	  
	  var error_message = document.getElementById("error_message");
	  
	  error_message.style.padding = "10px";
	  
	  var text;
	  if(uname.length == 0){
	    text = "Please Enter User Name";
	    error_message.innerHTML = text;
	    return false;
	  }
	  if(email.indexOf("@") == -1 || email.length < 6){
		    text = "Please Enter valid Email";
		    error_message.innerHTML = text;
		    return false;
	  }
	  if(subject.length == 0){
		    text = "Please Enter Subject";
		    error_message.innerHTML = text;
		    return false;
	  }
	  if(message.length == 0){
		    text = "Please Enter Message";
		    error_message.innerHTML = text;
		    return false;
	  }



	  alert("Form Submitted Successfully!");
	  
	  return true;
	}