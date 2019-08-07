/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function update()
{
   
   
     var form = $('#fileUploadForm')[0];
    var data = new FormData(form);
    alert(data);
    var name=$("#name").val();
    var sem=$("#sem").val();
    var email=$("#email").val();
    var mob=$("#mob").val();
    if(!isNaN(name))
    {
        alert("Enter Valid UserName");
        return;
    }
    if(isNaN(mob))
    {
        alert("Please Enter Valid Mobile Number");
        return;
    }

        var address=$("#address").val();
        
       alert(mob);
       alert(email);     

    data.append("name",name);
    data.append("sem",sem);
    data.append("email",email);
    data.append("mob",mob);
        data.append("address",address);
       
    $.ajax({
         

            type: "POST",
            enctype: 'multipart/form-data',
            url: "ProfileFacultyData",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {

              alert("Changes Saved");
                    $("#profileSuccessModal").modal({
                               backdrop:   'static',
                                keyboard:  false
                    });               
                   

                

            },
            error: function (e) {

                            alert("Some Error Occured!!!Contact Developers to resolve the issue");

                
                

            }
            });
        }        
function checkpswd(pswd,usertype,username)
{
    alert("qwerty");
    var pass=pswd;
    var username=username;
    var usertype=usertype;
    var curr=$("#current").val();
    if(curr===pass)
    { var new1=$("#new").val();
    var confirm1=$("#confirm").val();
    if(confirm1===new1)
    {     alert(confirm1);
var request=$.post("ValidateControllerServlet",{confirm1:confirm1,usertype:usertype,username:username},processRespon);
request.error(handleError);
}
    else
    {
        alert("New Password and Current Password Does not Match");
        return;
    }
}
else
{
    alert("Current password is Wrong");
    return;
}
}
               function handleError(xhr,textStatus)
{
    if(textStatus ==='error'){
                     $("#result").text('An error occured during your request:' +xhr.status);

 }
 }
function processRespon(responseText,textStatus)
{
   
  var url=responseText;
  alert("ll"+url);
  if(url.indexOf("true")!==-1)
  {
      alert("changes saved");
        $('#pswd').html("SUCCESS");
        $('#pswdsuccess').html("Password changed Successfully");
        $('#changePasswordSuccessModal').modal('toggle');
        $('#changePasswordSuccessModal').modal('show');
        $('#changePasswordSuccessModal').modal('handleUpdate');
  }
  else {
       $('#pswd').html("FAILURE");
        $('#pswdsuccess').html("Couldn't update the password!!!!Try Again After Some Time");
        $('#changePasswordSuccessModal').modal('toggle');
        $('#changePasswordSuccessModal').modal('show');
        $('#changePasswordSuccessModal').modal('handleUpdate');
   }
   }
function addfile()
{
   var form = $('#fileupload')[0];
    var data = new FormData(form);
    alert(data);
    var subject=$("#semsubject").val();
    if(subject==="")
    {
        alert("Choose Your Semester to Continue");
        return;
    }
    var description=$("#description").val();
     if(description==="")
    {
        alert("Describe Your Choosen File");
        return;
    }
       alert(subject);
       alert(description);     

    data.append("subject",subject);
    data.append("description",description);
    
       
    $.ajax({
         

            type: "POST",
            enctype: 'multipart/form-data',
            url: "FacultyFileUpload",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {

              alert("Changes Saved");
                  $("#uploadSuccessModal").modal({
                      backdrop:   'static',
          keyboard:  false});       
                

            },
            error: function (e) {

                            alert("Some Error Occured!!!Contact Developers to resolve the issue");

                
                

            }
            });
    
    
    
}
function getsubject(email)
{
    alert("qwertyuiop");
    var email=email;
    alert(email);
    var sem=$("#semselected").val();
    alert(sem);
    var request=$.post("FacultyControllerServlet",{email:email,sem:sem},processResponse1);
    request.error(handleError);

}
function processResponse1(responseText,textStatus)
{alert(responseText);
    
    var url=responseText.trim();
    alert(url);
    document.getElementById("semsubject").value=url;

}
function redirect(email)
{alert("hellooo");
  var sem=$("#semselect").val();
  var emailformarks=email;
  alert(sem);
  alert(emailformarks);
  var request=$.post("MarksUploadServlet",{sem:sem,emailformarks:emailformarks});
}
function redirect1(email)
{alert("hellooo");
  var sem=$("#semselect1").val();
  var emailforresult=email;
  alert(sem);
  alert(emailforresult);
  var request=$.post("ViewResultServlet",{sem:sem,emailforresult:emailforresult});
}
function redirect2(email)
{alert("hellooo");
  var sem=$("#semselect2").val();
  var emailforresult=email;
  alert(sem);
  alert(emailforresult);
  var request=$.post("ViewResultServlet",{sem:sem,emailforresult:emailforresult});
}

