/**
 * 
 */
function validate(){
	  var dLocation = document.getElementById("dLocation").value;
	  
	  var travelCost = document.getElementById("travelCost").value;

	  
	  var error_message = document.getElementById("error_message");
	  
	  error_message.style.padding = "10px";
	  
	  var text;
	  if(dLocation.length == 0){
	    text = "Please Enter dLocation";
	    error_message.innerHTML = text;
	    return false;
	  }

	  if(isNaN(travelCost) || travelCost.length != 5){
	    text = "Please Enter valid travelCost";
	    error_message.innerHTML = text;
	    return false;
	  }


	  alert("Form Submitted Successfully!");
	  
	  return true;
	}