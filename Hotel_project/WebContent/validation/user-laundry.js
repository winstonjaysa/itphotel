/**
 * 
 */
function validate(){
  var uname = document.getElementById("uname").value;

  var error_message = document.getElementById("error_message");
  
  error_message.style.padding = "10px";

  
  var text;
  if(uname.length == 0){
    text = "Please Enter User Name";
    error_message.innerHTML = text;
    return false;
  }
//  if(lname.length == 0){
//    text = "Please Enter Last Name";
//    error_message.innerHTML = text;
//    return false;
//  }
//  if(isNaN(phone) || phone.length != 10){
//    text = "Please Enter valid Phone Number";
//    error_message.innerHTML = text;
//    return false;
//  }
//  if(email.indexOf("@") == -1 || email.length < 6){
//    text = "Please Enter valid Email";
//    error_message.innerHTML = text;
//    return false;
//  }
//  if(message.length <= 10){
//    text = "Please Enter More Than 10 Characters";
//    error_message.innerHTML = text;
//    return false;
//  }
  alert("Form Submitted Successfully!");
  
  return true;
}