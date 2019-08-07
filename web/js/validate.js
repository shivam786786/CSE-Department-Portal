$('#loginbtn').click(function validate() {
     username=$("#usernamelog").val();
     pswd=$("#pwdlog").val();
//    alert(username + "  " + pswd);
         if(username==="")
    {
        
        $("#usernamelog").after("<span id='error1'>Username Reqd!</span>");
        $("#error1").css("color","red");
        $("#error1").fadeOut(4000);
        return;
    }
    if(pswd==="")
    {
        
        $("#pwdlog").after("<span id='error2'>Password Reqd!</span>");
        $("#error2").css("color","red");
        $("#error2").fadeOut(4000);
        return ;
    }
    
    
        
    
    
     usertype=$("#usertypelog").val();
    
    var request=$.post("ValidateControllerServlet",{username:username,password:pswd,usertype:usertype},processResponse);
    request.error(handleError);
   });
          
function handleError(xhr,textStatus)
{
    if(textStatus ==='error'){
     $("#loginbtn").after("<span id='error1' class='text-danger'><br><strong>An Error Occured During request"+xhr.status+"</strong></span>");
         setTimeout(function(){$("#error1").remove();},2000);

 }
 }
 function processResponse(responseText)
 {
    
        var resp=responseText;
//        alert(resp);
        var pagename;
        resp=resp.trim();
       
     if(resp.indexOf("jsession") !== -1)
     {
        
            if(usertype==="Admin")
                pagename="ADMIN";
            else if(usertype==='Student')
                pagename="STUDENT";
            else
                pagename = "FACULTY";
             $("#loginbtn").after("<span id='error1' class='text-success'><br><strong>Login Successfully Rediredt to "+pagename+" page</strong></span>");
         window.setTimeout(function(){$("#error1").remove();},2800);
            url=resp;
//            alert(url);
           window.setTimeout(destines,3000);
     }
     if(resp.indexOf("error") !== -1)
     {      
         
         $("#loginbtn").after("<span id='error1' class='text-danger'><br><strong>Invaild username or password</strong></span>");
         setTimeout(function(){$("#error1").remove();},2000);
           document.getElementById("usernamelog").value = "" ;
          document.getElementById("pwdlog").value = "" ;
     }
     function destines()
     {  
//         alert('hello');
         window.location=url;
     }
 }