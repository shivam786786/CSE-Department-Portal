/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var email;
$(document).ready(function() {
    $("#submitpass").click(function() {
        sendData();
    });
    $("#submitotp").click( function() {
        verify();
    });
    $("#submit").click( function() {
        email = $("#email").val();
       alert(email);
                  if(email==="" || (email.indexOf("@")===-1)){
            $("#submit").after("<span id='error1' class='text-bottom'><br><strong>You Have Entered Wrong Email Address ! Please Enter a valid Username<strong></span>");
            setTimeout(function(){$("#error1").remove();},2000);
            return;
        }
//        alert(username);
        $('#spinneremailwait').modal('toggle');
        $('#spinneremailwait').modal('show');
        $('#spinneremailwait').modal('handleUpdate');
        sendOtp();
    });
});
function sendOtp() {
    
//    var ajaxReq=new XMLHttpRequest();
    var mydata={email:email};
    var request=$.post("ForgotControllerServlet",mydata,processresponse);
    request.error(handleError);
}


function processresponse(responseText) {
    $('#spinneremailwait').modal('hide');
    alert("inside process response");
    resp = responseText;
    resp = resp.trim(); 
    alert(resp);
    if(resp.indexOf('failure')===-1)
             data  = resp.split("*");
         else
             data = resp;
         alert(data[1]);
    if(data[1].indexOf('findUser')!==-1) {
        $('#otp').val("");
        $('#otpemail').html(email);
        $('#forgetotpModal').modal('toggle');
        $('#forgetotpModal').modal('show');
       $('#forgetotpModal').modal('handleUpdate');
//        $('#otpModal').modal('hide');
        
    }
   
    else {
        $('#emailval').html(email);
        $('#wrongusername').modal('toggle');
        $('#wrongusername').modal('show');
        $('#wrongusername').modal('handleUpdate');
//        $('#InvalidUserModal').modal('handleUpdate');
//        $('#InvalidUserModal').modal('hide');
    }
}
function verify() {
    
        otp = $("#otp").val();
//        alert(username);
        if(data[0].trim() === otp.trim()) {
            $('#forgetotpModal').modal('hide');
            $('#changePasswordModal').modal('toggle');
            $('#changePasswordModal').modal('show');
            $('#changePasswordModal').modal('handleUpdate');
//            sendData();
            
        }else {
           $("#submitotp").after("<span id='error1' class='text-danger'><br><strong>You Have Entered Wrong OTP ! Please Enter a valid 6 Digit Number<strong></span>");
            setTimeout(function(){$("#error1").remove();},2000); 
        }
        
            
}
 function sendData() {
        newPass = $("#newPass").val();
        conPass = $("#conPass").val();
        if(newPass !== conPass) {
            $("#submitpass").after("<span id='error1' class='text-danger'><br><strong>Your PassWord are not Matching !.. Please Try Again<strong></span>");
            setTimeout(function(){$("#error1").remove();},2000);
            return;
        }
        var mydata = {newPass:newPass,email:email};
        var request=$.post("ForgotControllerServlet",mydata,processResponseOutput);
        request.error(errorHandle);
       
    }
    function processResponseOutput(responseText) {
        response = responseText.trim();
        var result = response.split("*");
        alert(result);
        $('#name').html(result[0]);
        if(result[1].indexOf("success")!==-1) {
             $('#changePasswordModal').modal('hide');
            $('#successModal').modal('toggle');
            $('#successModal').modal('show');
            $('#successModal').modal('handleUpdate');
        } 
        else {
           $("#submitpass").after("<span id='error1' class='text-danger'><br><strong>Request Failed ! Password Cannot be changed<strong></span>");
            setTimeout(function(){$("#error1").remove();},2000); 
        }
    }
 function handleError(xhr,textStatus)
    {
    
        if(textStatus==='error'){
            $('#xhrval').val(xhr.status);
            $('#spinneremailwait').modal('hide');
             $('#xhr').modal('toggle');
            $('#xhr').modal('show');
            $('#xhr').modal('handleUpdate');
        }
    }
      function errorHandle(xhr, textStatus) {
        if(textStatus==='error'){
            $('#xhrval').val(xhr.status);
            $('#changePasswordModal').modal('hide');
            $('#xhr').modal('toggle');
            $('#xhr').modal('show');
            $('#xhr').modal('handleUpdate');
        }
        
    }