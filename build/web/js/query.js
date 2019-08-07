/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function showQueryResult(id) {
    
    alert("Answered IS " + id);
    var request =  $('#showQuery').load("StudentControllerServlet",{id:id},processResp);
}
function processResp(responseText) {
    var resp = responseText.trim();
    if(resp.indexOf('failure')!==-1) {
        alert("There is an error occurs at server");
        return;
    }
    alert("resp in queryydatta "+resp);
           $('#studentReplayStatusModal').modal('toggle');
        $('#studentReplayStatusModal').modal('show');
        $('#studentReplayStatusModal').modal('handleUpdate');

}
function fetchQueryTable(uname) {
    
    var querysubject=$("#getsubjectquery").val();
    var replyModal = uname;
    alert(querysubject);
    alert(uname);
    var request = $('#tabledata').load("StudentControllerServlet",{replyModal:replyModal,querysubject:querysubject},process);
//    request.error(error);
    }
function error(textStatus, xhr) {
    
}
function process(responseText) {
    alert(responseText.trim() +"kkkkk");
    
    
}
function validate() {
    var status = true;
    topic = $('#topic').val();
    question = $('#question').val();
    subject1 = $('#selectsub').val();
        if(topic==="")
    {
        status = false;
        $("#topic").after("<span id='error1'>Please ! Fill the Topic Field</span>");
        $("#error1").css("color","red");
        $("#error1").fadeOut(4000);
        
    }
    if(question==="")
    { 
        status = false;
        $("#question").after("<span id='error2'>Please ! Fill the Query Field</span>");
        $("#error2").css("color","red");
        $("#error2").fadeOut(4000);
        
    }
     if(subject1==="")
    { 
        status = false;
        $("#selectsub").after("<span id='error2'>Please ! Choose ANy Subject Filed</span>");
        $("#error2").css("color","red");
        $("#error2").fadeOut(4000);
        
    }
    return status;
}
function askquestion(username)
{
name=username; 
alert(name);

        sendData();    
}
function sendData() {
    if(!validate()) {
        alert("hellooooo");
        return;
    }
    mydata = {topic:topic,name:name,question:question,subject1:subject1};
    alert(mydata);
    var request = $.post("StudentControllerServlet",mydata,processResponse);
    request.error(handleError);
   
}
function processResponse(responseText) {
    resp = responseText.trim();
    if(resp.indexOf("success")!==-1) {
        alert("Query Submitted Successfully");
            $("#querySuccessModal").modal('show');
             
    }
    else {
        alert("Some problem Occurs at Server So Your Query does not Submitted");
    }
    
   
    
}
function handleError(textStatus,xhr) {
    if(textStatus === 'error') {
        $("#askQuery").after("<span id='error1'>Some Problem Occurs at Server with Status:- "+xhr.status+" </span>");
        $("#error1").css("color","red");
        $("#error1").fadeOut(4000); 
    }
}