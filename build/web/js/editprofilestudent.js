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
        var address=$("#address").val();
        var rollno=$("#rollno").val();
       alert(mob);
              alert(rollno);

    data.append("name",name);
    data.append("sem",sem);
    data.append("email",email);
    data.append("mob",mob);
   
    if(isNaN(mob))
    {
        alert("Please Enter Valid Mobile Number");
        return;
    }
    
        data.append("address",address);
       data.append("rollno",rollno);
    $.ajax({
         

            type: "POST",
            enctype: 'multipart/form-data',
            url: "ProfileStudentData",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {

                    $("#profileSuccessModal").modal({
                               backdrop:   'static',
                            keyboard:  false
                    });

           

            },
            error: function (e) {

                            alert("Some Error Occured!!!Contact Developers to resolve the issue occurs: " + e.responseText);

                
                

            }
            });
        }        
function checkpswd(pswd,usertype,username)
{
    
    var pass=pswd;
    alert(pass);
    var username=username;
    var usertype=usertype;
    var curr=$("#current").val();
    alert("curent"+curr);
    if(curr===pass)
    { var new1=$("#new").val();
    var confirm1=$("#confirm").val();
    if(confirm1===new1)
    {     alert("made changes visible"+confirm1);
var request=$.post("ValidateControllerServlet",{confirm1:confirm1,usertype:usertype,username:username},processRespo);
request.error(handleError);
}
    else
    {
        alert("New Password and Confirm Password Does Not Match");
        return;
    }
}
else
{
    alert("Current Password Is Wrong");
    return;
}
}
               function handleError(xhr,textStatus)
{
    if(textStatus ==='error'){
                     $("#result").text('An error occured during your request:' +xhr.status);

 }
 }
function processRespo(responseText,textStatus)
{
    
  var url=responseText;
  alert(url);
  if(url.indexOf("true") !== -1)
  {
      
      $("#changePasswordSuccessModal").modal({
          backdrop:   'static',
          keyboard:  false
      });
      location.reload();
      
  }
  else
      alert("Couldn't update the password!!!!Try Again After Some Time");
   }
  
function getsubjectspdf()
{
   
 
    var subject=$("#subject").val();
   alert(subject+"hello");
  var request=$.post("StudentControllerServlet",{subject:subject},processResponse1);
//request.error(handleError);

}
function processResponse1(responseText,textStatus)
{
var url=responseText;
alert(url);
  alert("are u cominggggg");
    var row=$("#fileDownloadTable").children('tr').length;
  
  if(row!==0)
  {
  
      $("#fileDownloadTable").children('tr').remove();
  }
  $("#fileDownloadTable").append(url);
}
 
   
  