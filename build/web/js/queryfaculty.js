/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$('document').ready( function() {
   $('#nav-query-tab').click( function() {
        fetchQuery();
   });
});
function fetchQuery()
{
queryReply="queryReply";
alert(queryReply);
var request=$('#responseData').load("FacultyControllerServlet",{queryReply:queryReply},processResponse);
request.error(errorHandle);
    
}

function errorHandle(textstatus,xhr) {
    if(textstatus==='error') {
        
    }
        
    
}

function sendReply() {
   var reply =  $('#replyAnswer').val();
   var que = $('#getQuestion').val();
   alert(que + "inside");
   alert(reply);
   var request = $.post("FacultyControllerServlet",{reply:reply,question:que},processResp);
   request.error(handlingError);
}
function handlingError(textStatus,xhr) {
    
}
function processResp(responseText) {
    var response  = responseText.trim();
    alert(response);
    if(response.indexOf("success")!==-1) {
            $('#success').html("Congratulations");
            $('#replyStatus').html("Answer have been Uploaded Succesfully :)");
            $('#queryReplaySubmitModal').modal('toggle');
            $('#queryReplaySubmitModal').modal('show');
            $('#queryReplaySubmitModal').modal('handleUpdate');
            
    }
    else {
            $('#success').html("Sorry!!");
            $('#replyStatus').html("Some Problem Occur at Server Your Reply is not Submitted :)");
            $('#queryReplaySubmitModal').modal('toggle');
            $('#queryReplaySubmitModal').modal('show');
            $('#queryReplaySubmitModal').modal('handleUpdate');
    }
    
}
function processResponse(responseText,textStatus)
{alert('inside processResponse');
    resp=responseText.trim();
    alert(resp);
//    $('#responseData').append(resp);
}

function showQueryDetail(id) {
    alert(id);
    var request=$('#showQueryModal').load("FacultyControllerServlet",{id:id},process);
}

function process(responseText) {
    resp = responseText.trim();
    alert(resp);
    $('#queryReplayModal').modal('toggle');
    $('#queryReplayModal').modal('show');
    $('#queryReplayModal').modal('handleUpdate');
}
//function fetchQuery() {
//    
//}
//    
