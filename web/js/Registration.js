/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global errorHandle, retrun, sss */


var username,newpass,conpass,mydata;

$('document').ready(function() {
    
    $("#submitotp").click( function() {
       verify();
       $('#otp').val("");
    });
   
//    $("#registeruser").click( function() {
//        alert("hello");
//       sendData();
//    });
    $("#resend").click( function() {
        
        $('#otpModal').modal('hide');
        $('#spinneremailwait').modal('show');
        $('#spinneremailwait').modal('handleUpdate');
        sendOtp();
    });
    $("#submit").click( function() {
        username = $("#username1").val();
        if(username==="") {
            $("#submit").after("<span id='error1' class='text-bottom'><br><strong>You Have Entered Nothing ! Please Enter a valid Username<strong></span>");
            setTimeout(function(){$("#error1").remove();},2000);
            return;
        }
        $('#spinneremailwait').modal('show');
        $('#spinneremailwait').modal('handleUpdate');
                  sendOtp();
    });
    
});


function sendOtp(){
        
     
     mydata={username:username};
    var request=$.post("RegistrationControllerServlet",mydata,processresponse);
   request.error(handleError);
}

	   function handleError(xhr,textStatus)
{
    if(textStatus ==='error'){
                     $("#result").text('An error occured during your request:' +xhr.status);

 }
 }

function processresponse(responseText) {
    
   // alert("inside process response open spinner");
    $('#spinneremailwait').modal('hide');  
   //  $('#spinneremailwait').modal('dispose');  
    //alert("inside process response closing spinner");
     resp = responseText.trim().split("*");
    
    //alert(resp);
    if(resp[2].indexOf("userFound")!==-1) {
//        alert("inside user Found in registration js");
//          $().html( "<div class='d-flex align-items-center text-success' id='spinneremailwait'><strong>Please Wait..! Sending OTP </strong><div class='spinner-border ml-auto mr-auto' role='status' aria-hidden='true'></div></div>");
 //       $('#spinneremailwait').modal('hide'); 
        $('#otp').val("");
        $('#otpemail').html(resp[1]);
        $('#otpModal').modal('toggle');
        $('#otpModal').modal('show');
        $('#otpModal').modal('handleUpdate');

        
    }
    else if(resp[2].indexOf("registeredUser")!==-1) {
//        alert("inside register user in registration js");
//         $("#submit").after("<span id='error1' class='text-danger'><br><strong>RegisterUserId Plaese Login</strong></span>");
//         setTimeout(function(){$("#error1").remove();},2000);
 //        $('#spinneremailwait').modal('hide');  
         $('#Registered').modal('toggle');
         $('#Registered').modal('show');
         $('#Registered').modal('handleUpdate');
 //        $('#Registered').modal('hide');
    }
    else {
 //       $('#spinneremailwait').modal('hide');  
//        alert("inside nf in registration js");
        $('#InvalidUserModal').modal('toggle');
        $('#InvalidUserModal').modal('show');
        $('#InvalidUserModal').modal('handleUpdate');
 //       $('#InvalidUserModal').modal('hide');
    }
    //alert('hello');
//    alert("lll");
    
}

    function verify() {
         
        otp = $('#otp').val();
       if(otp==="") {
             $("#submitotp").after("<span id='error1' class='text-monospace text-danger'><br><strong>You Have Entered Nothing ! Please Enter a valid OTP of 6 Digits<strong></span>");
            setTimeout(function(){$("#error1").remove();},2000);
            return;
       }
       if(otp.trim() === resp[0].trim()) {
           $('#otpModal').modal('hide');
           fetchData();
            $('#registerModal').modal('toggle');
            $('#registerModal').modal('show');
            $('#registerModal').modal('handleUpdate');
            
       }
      else {
       $("#submitotp").after("<span id='error1' class='text-danger'><br><strong class='text-danger'>You Have Entered Wrong OTP ! Please Enter a valid OTP of 6 Digits<strong></span>");
        setTimeout(function(){$("#error1").remove();},2000);
        $('#otp').val("");
    }
    }
    function fetchData() {
          mydata={otp:otp,username:username};
          alert(otp);
          alert(username);
         var request=$('#sss').load("RegistrationControllerServlet",mydata,processResponseOutput);
         request.error(errorHandle);
    }
    function processResponseOutput(responseText) {      
            $('#registerModal').modal('toggle');
            $('#registerModal').modal('show');
            $('#registerModal').modal('handleUpdate');
        
    }
    function validate() {
        newpass = $('#pass').val();
        conpass =  $('#conpass').val();
        if(newpass!=="" && conpass!=="") {
            $("#pass").after("<span id='error1' class='text-danger'><br><strong>Please Enter a valid password<strong></span>");
            $("#conpass").after("<span id='error2' class='text-danger'><br><strong>Please Enter a valid password<strong></span>");
            setTimeout(function(){$("#error1").remove();},2000);
            setTimeout(function(){$("#error2").remove();},2000);
            return true;
           
        }
          
            
        return false;
    }
    function sendData() {
        newpass = $('#pass').val();
        conpass =  $('#conpass').val();
       
        alert(validate());
        if(!validate()) {
                 return;
        }
        alert(newpass);
        
        alert(conpass);
        alert("inside send data");
        if(newpass !== conpass) {
                 $("#conpass").after("<span id='error1' class='text-danger'><br><strong>Your PassWord are not Matching !.. Please Try Again<strong></span>");
                 setTimeout(function(){$("#error1").remove();},2000);
                 return;
            }
         status = "Y";
         usertype = $('#desg').val();
         alert(usertype);
        if(usertype.indexOf("Faculty")!==-1) {
            alert("f");
            mydata = {username:username,pass:newpass,usertype:usertype,status:status};
            alert(username+","+newpass);
            var request=$.post("RegistrationControllerServlet",mydata,processResponseConfirm);
            request.error(errorOccur);
        }
        else if(usertype.indexOf("Student")!==-1) {
            alert("s");
            alert("username is"+username);
             mydata = {username:username,pass:newpass,usertype:usertype,status:status};
            alert(username);
            var request=$.post("RegistrationControllerServlet",mydata,processResponseConfirm);
            request.error(errorOccur);
        }
        else if(usertype.indexOf("Admin")!==-1) {
          alert("fav");
             mydata = {username:username,pass:newpass,usertype:usertype,status:status};
              alert(username);
             request=$.post("RegistrationControllerServlet",mydata,processResponseConfirm);
            request.error(errorOccur);
        }
        else {
            //body of else 
            $("#registeruser").after("<span id='error1'class='text-danger'><br><strong>Some error Occur at Server end !... Please Try Later<strong></span>");
             setTimeout(function(){$("#error1").remove();},4000);
        }
        
    }

    function errorHandle(xhr,textStatus)
    {
    alert("inside handle error");
    if(textStatus==='error'){
        $("#result").html("Error is "+xhr.status);
    }
    


    }
    function processResponseConfirm(responseText) {
        responseText = responseText.trim();
         alert('inside Confirm');
        if(responseText.indexOf("success")!==-1) {
            //body success
            $('#registerModal').modal('hide');
            $('#confirm').modal('toggle');
            $('#confirm').modal('show');
            $('#confirm').modal('handleUpdate');
        }
        else {
             $("#registeruser").after("<span id='error1' class='text-danger'><br><strong>Some Problem Occurs !.. You are Not Registerd Please Try Again<strong></span>");
             setTimeout(function(){$("#error1").remove();},4000);
        }
    }
     function errorOccur(xhr,textStatus)
    {
    alert("inside handle error");
    if(textStatus==='error'){
        $("#pass").html("Error is "+xhr.status);
    }
    


    }