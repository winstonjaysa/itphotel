/**
 * 
 */
function validate(){
	  var uname = document.getElementById("uname").value;
	  var pwd = document.getElementById("pwd").value;

	  
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
	 


	  alert("Form Submitted Successfully!");
	  
	  return true;
	}