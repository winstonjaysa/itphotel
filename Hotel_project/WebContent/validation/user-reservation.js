/**
 * 
 */
function validate(){
	  var rooms_count = document.getElementById("rooms_count").value;
	  var days = document.getElementById("days").value;

	  
	  var error_message = document.getElementById("error_message");
	  
	  error_message.style.padding = "10px";
	  
	  var text;

	  if(isNaN(rooms_count) || rooms_count.length != 2){
	    text = "Please Enter valid number of rooms";
	    error_message.innerHTML = text;
	    return false;
	  }
	  if(isNaN(days) || days.length != 2){
		    text = "Please Enter valid number of days";
		    error_message.innerHTML = text;
		    return false;
		  }


	  alert("Form Submitted Successfully!");
	  
	  return true;
	}