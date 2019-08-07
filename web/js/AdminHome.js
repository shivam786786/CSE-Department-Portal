console.log("AdminHome.js loaded");
var adminName = document.getElementById("name").value;
var email = document.getElementById("email").value;
var address = document.getElementById("add").value;
var contact = document.getElementById("contact").value;

console.log(adminName+' '+email+' '+address+' '+contact );

var ajaxreq;
function saveAdminDetails(){
    var newAdminName = document.getElementById("name").value;
    var newEmail = document.getElementById("email").value;
    var newAddress = document.getElementById("add").value;
    var newContact = document.getElementById("contact").value;
    
    if(newAdminName === '' || newEmail === '' || newAddress === '' || newContact === ''){
        return;
    }
    
    console.log("New Admin Details: "+newAdminName+' '+newEmail+' '+newAddress+' '+newContact);
//    if(newAdminName === adminName && newEmail === email && newContact === contact && newAddress === address){
//        console.log("No changes detected in admin profile");
//        return;
//    }else{
//        adminName = newAdminName;
//        email = newEmail;
//        address = newAddress;
//        contact = newContact;
        
        ajaxreq = new XMLHttpRequest();
        ajaxreq.onreadystatechange = saveAdminDetailsProcessResponse;
        ajaxreq.open("POST","SaveAdminDetailsController",true);
        ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
        ajaxreq.send("adminName="+newAdminName+"&email="+newEmail+"&address="+newAddress+"&contact="+newContact);
        console.log("After request for saving admin details has been sent");
//    }
}

function saveAdminDetailsProcessResponse(){
    if(ajaxreq.readyState === 4){
        console.log("processresponse executed");
        var resp = ajaxreq.responseText;
        if(resp.trim() === "saved"){
            document.getElementById("saveresult").innerHTML = "<h5><font color=\"green\">Changes Saved Successfully.</font></h5>";
        }else{
            document.getElementById("saveresult").innerHTML = "<h5><font color=\"red\">Error in saving changes. Try again later.</font></h5>";
        }
        setTimeout(function(){
            console.log("Inside settimeout");
            document.getElementById("saveresult").innerHTML = "";
        },3000);
    }
}

//---------------------------------------------------Change Admin Password------------------------------------------------------

function changeAdminPassword(){
    var oldPass = document.getElementById("oldPass").value;
    var newPass = document.getElementById("newPass").value;
    var confPass = document.getElementById("confPass").value;
    
    if(oldPass === '' || newPass === '' || confPass === ''){
        return;
    }
    
    if(newPass !== confPass){
        document.getElementById("passcngresult").innerHTML = "<h5><font color=\"red\">Both New Password and Confirm Password fields must be same.</font></h5>";
        setTimeout(function(){
            console.log("Inside settimeout");
            document.getElementById("saveresult").innerHTML = "";
        },2000);
        return;
    }
    
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = changeAdminPasswordProcessResponse;
    ajaxreq.open("POST","ChangeAdminPasswordServlet",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    password = {
        "oldPass":oldPass,
        "newPass":newPass
    };
    json_data = JSON.stringify(password);
    console.log(json_data);
    ajaxreq.send("json_data="+json_data);
    console.log("After request for password change has been sent");
}

function changeAdminPasswordProcessResponse(){
    if(ajaxreq.readyState === 4){
        
        var resp = ajaxreq.responseText;
        if(resp.trim() === "success"){
            document.getElementById("passcngresult").innerHTML = "<h5><font color=\"green\">Password Changed Successfully.</font></h5>";; 
        }else{
            document.getElementById("passcngresult").innerHTML = "<h5><font color=\"red\">Error in changing password. Fill all fields carefully.If problem persists, try after sometime.</font></h5>";
        } 
        setTimeout(function(){
            document.getElementById("saveresult").innerHTML = "";
            document.getElementById("oldPass").value = "";
            document.getElementById("newPass").value = "";
            document.getElementById("confPass").value = ""; 
        },2000);
    }
}

//--------------------------------------------------Send Email--------------------------------------------------------

function sendEmail(){
    console.log("inside sendEmail");
    var to = document.getElementById("to").value;
    var from = document.getElementById("from").value;
    var subject = document.getElementById("subject").value;
    var password = document.getElementById("password").value;
    var message = CKEDITOR.instances.editor1.getData();
    
    if(to === '' || from === '' || subject === '' || password === '' || message === ''){
        return;
    }
    message = stripHtml(message);
    console.log(message);
    
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = sendEmailProcessResponse;
    ajaxreq.open("POST","EmailControllerServlet",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    
    email={
      "to":to,
      "from":from,
      "subject":subject,
      "message":message,
      "password":password
    };
    
    json_data = JSON.stringify(email);
    console.log(json_data);
    ajaxreq.send("json_data="+json_data);
    console.log("After request email has been sent");
}

function sendEmailProcessResponse(){
    if(ajaxreq.readyState === 4){
        console.log("inside sendEmailProcessResponse");
        var resp = ajaxreq.responseText;
        if(resp.trim() === "success"){
            document.getElementById("emailresult").innerHTML = "<h5><font color=\"green\">Email Sent Successfully.</font></h5>";; 
        }else{
            document.getElementById("emailresult").innerHTML = "<h5><font color=\"red\">Error in Sending Email.Try Again Later.</font></h5>";
        } 
        setTimeout(function(){
            document.getElementById("emailresult").innerHTML = "";
        },10000);
    }
}

//-----------------------------------------Strip Html: Will strip text of all html tags-----------------------------------
function stripHtml(html){
    var temporalDivElement = document.createElement("div");
    temporalDivElement.innerHTML = html;
    return temporalDivElement.textContent || temporalDivElement.innerText || "";
}

//-------------------------------------------Save and Delete faculty details---------------------------------------------------------

function deleteFacultyDetails(event){
    console.log("inside deleteFacultyDetails");
    console.log(event.target.parentElement.parentElement);
    var col = event.target.parentElement;
    var row = col.parentElement;
    var facultyDetails = row.children;
    var email = facultyDetails[1].innerText;
    
   
    console.log("Details of record to be deleted: "+email);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = function(){
        console.log("processresponse executed");
        if(ajaxreq.readyState === 4){
            if (ajaxreq.status===200 || window.location.href.indexOf("http")===-1){
                var resp = ajaxreq.responseText;
                if(resp.trim() === "success"){
                    console.log("inside if");
                    var row = event.target.parentElement.parentElement;
                    row.parentNode.removeChild(row);
                }else{
                    console.log("inside else");
                    col.innerHTML = "<h6><font color=\"red\">Error in Deleting.</font></h6>";
                    setTimeout(function(){
                    console.log("Inside settimeout");
                    var node = document.createElement("a");                                    
                    var textnode = document.createTextNode("Delete");         
                    node.appendChild(textnode);  
                    col.replaceChild(node,col.lastChild);
                    col.lastChild.setAttribute("href","# ");
                },5000);
                }
            }else{
                alert("An error has occured making the request");
            }    
        }
    };
    ajaxreq.open("POST","SaveFacultyDetailsController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("data_id=delete"+"&email="+email);
    console.log("After request for deleting faculty details has been sent");
}

function saveFacultyDetails(event){
    var data_id = event.target.getAttribute("data-id");
    var facultyForm = document.getElementById("facultyForm");
    var facultyName = facultyForm.querySelector("#name").value;
    var email = facultyForm.querySelector("#email").value;
    var address = facultyForm.querySelector("#add").value;
    var contact = facultyForm.querySelector("#contact").value;
    //var photoPath = document.getElementById("usrPhoto").value;
    var username;
    if(data_id === "edit"){
        username = facultyForm.querySelector("#username").value;
        if(username === null){
            username = ' ';
        }
    }else{
        username = ' ';
    }
    
    if(facultyName === '' || email === '' || address === '' || 
       contact === ''){
            return;
    }
    
    console.log("New faculty Details: "+username+' '+facultyName+' '+email+' '+address+' '+contact);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = saveFacultyDetailsProcessResponse;
    ajaxreq.open("POST","SaveFacultyDetailsController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("data_id="+data_id+"&username="+username+"&facultyName="+facultyName+"&email="+email+"&address="+address+"&contact="+contact);
    console.log("After request for saving/editing faculty details has been sent");

}

function saveFacultyDetailsProcessResponse(){
    if(ajaxreq.readyState === 4){
        console.log("processresponse executed");
        var resp = ajaxreq.responseText;
        if(resp.trim() === "success"){
            document.getElementById("facultysaveresult").innerHTML = "<h5><font color=\"green\">Details Saved Successfully.</font></h5>";
        }else{
            document.getElementById("facultysaveresult").innerHTML = "<h5><font color=\"red\">Error in saving faculty details. Try again later.</font></h5>";
        }
        setTimeout(function(){
            console.log("Inside settimeout");
            document.getElementById("facultysaveresult").innerHTML = "";
        },5000);
    }
}


//---------------------------------------Save and delete Student Details----------------------------------------------------------------
function deleteStudentDetails(event){
    console.log("inside deleteStudentDetails");
    console.log(event.target.parentElement.parentElement);
    var col = event.target.parentElement;
    var row = col.parentElement;
    var studentDetails = row.children;
    var rollNo = studentDetails[0].innerText;
    
   
    console.log("Details of record to be deleted: "+email);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = function(){
        console.log("processresponse executed");
        if(ajaxreq.readyState === 4){
            if (ajaxreq.status===200 || window.location.href.indexOf("http")===-1){
                var resp = ajaxreq.responseText;
                if(resp.trim() === "success"){
                    console.log("inside if");
                    var row = event.target.parentElement.parentElement;
                    row.parentNode.removeChild(row);
                }else{
                    console.log("inside else");
                    col.innerHTML = "<h6><font color=\"red\">Error in Deleting.</font></h6>";
                    setTimeout(function(){
                    console.log("Inside settimeout");
                    var node = document.createElement("a");                                    
                    var textnode = document.createTextNode("Delete");         
                    node.appendChild(textnode);  
                    col.replaceChild(node,col.lastChild);
                    col.lastChild.setAttribute("href","# ");
                },5000);
                }
            }else{
                alert("An error has occured making the request");
            }    
        }
    };
    ajaxreq.open("POST","SaveStudentDetailsController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("data_id=delete"+"&rollNo="+rollNo);
    console.log("After request for deleting student details has been sent");
}

function saveStudentDetails(event){
    var data_id = event.target.getAttribute("data-id ");
    var marksForm = document.getElementById("marksForm");
    var studentName = marksForm.querySelector("#name").value;
    var rollNo = marksForm.querySelector("#rollno").value;
    var email = marksForm.querySelector("#email").value;
    var address = marksForm.querySelector("#add").value;
    var contact = marksForm.querySelector("#contact").value;
    var semester = marksForm.querySelector("#sem").value;
    //var photoPath = document.getElementById("usrPhoto").value;
    
    if(studentName === '' || rollNo === '' || email === '' ||
       address === '' || contact === '' || semester === ''){
            return;
    }
    
    console.log("New student Details: "+studentName+' '+email+' '+address+' '+contact+' '+rollNo+' '+semester);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = saveStudentDetailsProcessResponse;
    ajaxreq.open("POST","SaveStudentDetailsController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("data_id="+data_id+"&studentName="+studentName+"&email="+email+"&address="+address+"&contact="+contact+"&semester="+semester+"&rollNo="+rollNo);
    console.log("After request for saving student details has been sent");

}

function saveStudentDetailsProcessResponse(){
    if(ajaxreq.readyState === 4){
        console.log("processresponse executed");
        var resp = ajaxreq.responseText;
        if(resp.trim() === "success"){
            document.getElementById("studentsaveresult").innerHTML = "<h5><font color=\"green\">Details Saved Successfully.</font></h5>";
        }else{
            document.getElementById("studentsaveresult").innerHTML = "<h5><font color=\"red\">Error in saving student details. Try again later.</font></h5>";
        }
        setTimeout(function(){
            console.log("Inside settimeout");
            document.getElementById("studentsaveresult").innerHTML = "";
        },5000);
    }
}    

//-------------------------------------------Save and delete Subject Details---------------------------------------------------------

function deleteSubjectDetails(event){
    console.log("inside deleteSubjectDetails");
    console.log(event.target.parentElement.parentElement);
    var col = event.target.parentElement;
    var row = col.parentElement;
    var subjectDetails = row.children;
    var subCode = subjectDetails[0].innerText;
    
   
    console.log("Details of record to be deleted: "+subCode);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = function(){
        console.log("processresponse executed");
        if(ajaxreq.readyState === 4){
            if (ajaxreq.status===200 || window.location.href.indexOf("http")===-1){
                var resp = ajaxreq.responseText;
                if(resp.trim() === "success"){
                    console.log("inside if");
                    var row = event.target.parentElement.parentElement;
                    row.parentNode.removeChild(row);
                }else{
                    console.log("inside else");
                    col.innerHTML = "<h6><font color=\"red\">Error in Deleting.</font></h6>";
                    setTimeout(function(){
                    console.log("Inside settimeout");
                    var node = document.createElement("a");                                    
                    var textnode = document.createTextNode("Delete");         
                    node.appendChild(textnode);  
                    col.replaceChild(node,col.lastChild);
                    col.lastChild.setAttribute("href","# ");
                },5000);
                }
            }else{
                alert("An error has occured making the request");
            }    
        }
    };
    ajaxreq.open("POST","SaveSubjectDetailsController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("data_id=delete"+"&subCode="+subCode);
    console.log("After request for deleting subject details has been sent");
}

function saveSubjectDetails(event){
    var data_id = event.target.getAttribute("data-id");
    var subjectForm = document.getElementById("subjectForm");
    var subName = subjectForm.querySelector("#subName").value;
    var subCode = subjectForm.querySelector("#subCode").value;
    var semester = subjectForm.querySelector("#sem").value;
    var fac_a = subjectForm.querySelector("#fac-a").value;
    var fac_b = subjectForm.querySelector("#fac-b").value;
    
    
    if(subName === '' || subCode === '' || semester === '' || 
       fac_a === '' || fac_b === ''){
            return;
    }
    
    console.log("New subject Details: "+subName+' '+subCode+' '+semester+' '+fac_a+' '+fac_b);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = saveSubjectDetailsProcessResponse;
    ajaxreq.open("POST","SaveSubjectDetailsController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("data_id="+data_id+"&subName="+subName+"&fac_a="+fac_a+"&fac_b="+fac_b+"&semester="+semester+"&subCode="+subCode);
    console.log("After request for saving subject details has been sent");

}

function saveSubjectDetailsProcessResponse(){
    if(ajaxreq.readyState === 4){
        console.log("processresponse executed");
        var resp = ajaxreq.responseText;
        if(resp.trim() === "success"){
            document.getElementById("subjectsaveresult").innerHTML = "<h5><font color=\"green\">Details Saved Successfully.</font></h5>";
        }else{
            document.getElementById("subjectsaveresult").innerHTML = "<h5><font color=\"red\">Error in saving subject details. Try again later.</font></h5>";
        }
        setTimeout(function(){
            console.log("Inside settimeout");
            document.getElementById("subjectsaveresult").innerHTML = "";
        },5000);
    }
}

//--------------------------------------------Save and delete marks-----------------------------------------------------------------

function deleteStudentMarks(event){
    console.log("inside deleteStudentMarks");
    console.log(event.target.parentElement.parentElement);
    var col = event.target.parentElement;
    var row = col.parentElement;
    var marksDetails = row.children;
    var rollNo = marksDetails[0].innerText;
    var semester = marksDetails[1].innerText;
    var subject = marksDetails[2].innerText;
    
   
    console.log("Details of record to be deleted: "+rollNo+' '+subject+' '+semester);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = function(){
        console.log("processresponse executed");
        if(ajaxreq.readyState === 4){
            if (ajaxreq.status===200 || window.location.href.indexOf("http")===-1){
                var resp = ajaxreq.responseText;
                if(resp.trim() === "success"){
                    console.log("inside if");
                    var row = event.target.parentElement.parentElement;
                    row.parentNode.removeChild(row);
                }else{
                    console.log("inside else");
                    col.innerHTML = "<h6><font color=\"red\">Error in Deleting.</font></h6>";
                    setTimeout(function(){
                    console.log("Inside settimeout");
                    var node = document.createElement("a");                                    
                    var textnode = document.createTextNode("Delete");         
                    node.appendChild(textnode);  
                    col.replaceChild(node,col.lastChild);
                    col.lastChild.setAttribute("href","# ");
                },5000);
                }
            }else{
                alert("An error has occured making the request");
            }    
        }
    };
    ajaxreq.open("POST","SaveStudentMarksController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("data_id=delete"+"&rollNo="+rollNo+"&subject="+subject+"&semester="+semester);
    console.log("After request for deleting student marks details has been sent");
}

function saveStudentMarks(event){
    var data_id = event.target.getAttribute("data-id");
    var marksForm = document.getElementById("marksForm");
    var rollNo = marksForm.querySelector("#rollNo").value;
    var subject = marksForm.querySelector("#subjectcode").value;
    var semester = marksForm.querySelector("#sem").value;
    var midsem_1 = marksForm.querySelector("#mid-1").value;
    var midsem_2 = marksForm.querySelector("#mid-2").value;
    var midsem_3 = marksForm.querySelector("#mid-3").value;
    
    if(subject === '' || rollNo === '' || semester === ''){
            return;
    }
    
    console.log("New marks Details: "+subject+' '+rollNo+' '+semester+' '+midsem_1+' '+midsem_2+' '+midsem_3);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = saveStudentMarksProcessResponse;
    ajaxreq.open("POST","SaveStudentMarksController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    ajaxreq.send("data_id="+data_id+"&subject="+subject+"&rollNo="+rollNo+"&midsem_1="+midsem_1+"&semester="+semester+"&midsem_2="+midsem_2+"&midsem_3="+midsem_3);
    console.log("After request for saving student marks has been sent");

}

function saveStudentMarksProcessResponse(){
    if(ajaxreq.readyState === 4){
        console.log("processresponse executed");
        var resp = ajaxreq.responseText;
        if(resp.trim() === "success"){
            document.getElementById("markssaveresult").innerHTML = "<h5><font color=\"green\">Details Saved Successfully.</font></h5>";
        }else{
            document.getElementById("markssaveresult").innerHTML = "<h5><font color=\"red\">Error in saving marks details. Try again later.</font></h5>";
        }
        setTimeout(function(){
            console.log("Inside settimeout");
            document.getElementById("markssaveresult").innerHTML = "";
        },5000);
    }
}

//------------------------------------------------------------------------------------------------------------------------

//function showWarning(){
//    console.log("Inside ShowWarning()");
//    document.getElementById("warning").innerHTML = "<h6>* a user with inactive status cannot login</h6>";
//    return;
//}

//----------------------------------------------------Save and Delete User Credentials--------------------------------------------------------------------

function deleteUserDetails(event){
    console.log("inside deleteUserDetails");
    console.log(event.target.parentElement.parentElement);
    var col = event.target.parentElement;
    var row = col.parentElement;
    var userDetails = row.children;
    var username = userDetails[0].innerText;
    
   
    console.log("Details of record to be deleted: "+username);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = function(){
        console.log("processresponse executed");
        if(ajaxreq.readyState === 4){
            if (ajaxreq.status===200 || window.location.href.indexOf("http")===-1){
                var resp = ajaxreq.responseText;
                if(resp.trim() === "success"){
                    console.log("inside if");
                    var row = event.target.parentElement.parentElement;
                    row.parentNode.removeChild(row);
                }else{
                    console.log("inside else");
                    col.innerHTML = "<h6><font color=\"red\">Error in Deleting.</font></h6>";
                    setTimeout(function(){
                    console.log("Inside settimeout");
                    var node = document.createElement("a");                                    
                    var textnode = document.createTextNode("Delete");         
                    node.appendChild(textnode);  
                    col.replaceChild(node,col.lastChild);
                    col.lastChild.setAttribute("href","# ");
                },5000);
                }
            }else{
                alert("An error has occured making the request");
            }    
        }
    };
    ajaxreq.open("POST","SaveNewUserController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    user_credentials={
        "data_id":"delete",
        "username":username
        
    };
    json_data = JSON.stringify(user_credentials);
    ajaxreq.send("json_data="+json_data);
    console.log("After request for deleting user details has been sent");
}

function saveNewUser(event){
    var data_id = event.target.getAttribute("data-id");
    var usersForm = document.getElementById("usersForm");
    var username = usersForm.querySelector("#username").value;
    var usertype = usersForm.querySelector("#usertype").value;
    var status = usersForm.querySelector("#status").value;
    var password;
    var confPassword;
    if(data_id === "add"){
        password = usersForm.querySelector("#password").value;
        confPassword = usersForm.querySelector("#confPassword").value;
    }
    
    
    if(username === '' || password === '' || confPassword === ''){
        return;
    }
    
    if(data_id === "add" && confPassword !== password){
        document.getElementById("usersaveresult").innerHTML = "<h5><font color=\"red\">Both Password and Confirm Password needs to be same.</font></h5>";
    }
    
    console.log("New user Details: "+username+' '+usertype+' '+password+' '+confPassword+' '+status);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = saveNewUserProcessResponse;
    ajaxreq.open("POST","SaveNewUserController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    user_credentials={
        "data_id":data_id,
        "username":username,
        "password":password,
        "usertype":usertype,
        "status":status
    };
    json_data = JSON.stringify(user_credentials);
    ajaxreq.send("json_data="+json_data);
    console.log("After request for saving new user has been sent");

}

function saveNewUserProcessResponse(){
    if(ajaxreq.readyState === 4){
        console.log("processresponse executed");
        var resp = ajaxreq.responseText;
        if(resp.trim() === "success"){
            document.getElementById("usersaveresult").innerHTML = "<h5><font color=\"green\">User Details Saved Successfully.</font></h5>";
        }else{
            document.getElementById("usersaveresult").innerHTML = "<h5><font color=\"red\">Error in saving user login details. Try again later.</font></h5>";
        }
        setTimeout(function(){
            console.log("Inside settimeout");
            document.getElementById("usersaveresult").innerHTML = "";
        },5000);
    }
}

//-------------------------------------------------------fillFacultyDetailsModal()------------------------------------------------------
function fillFacultyDetailsModal(event){
    console.log("inside facultydetailsmodal function");
    console.log(event.target.id);
    console.log(document.getElementById(event.target.id).parentElement.parentElement.children);
    var par = document.getElementById(event.target.id).parentElement.parentElement.children;
    var editForm = document.getElementById("facultyForm");
    editForm.querySelector("#username").value = par[0].innerText;
    editForm.querySelector("#email").value = par[1].innerText;
    editForm.querySelector("#name").value = par[2].innerText;
    editForm.querySelector("#contact").value = par[3].innerText;
    editForm.querySelector("#add").value = par[4].innerText;
    
    $("#editFacultyModal").modal();
} 

//--------------------------------------fillUserDetailsModal()-------------------------------------------------------

function fillUserDetailsModal(event){
    console.log("inside filluserdetailsmodal function");
    console.log(event.target.id);
    console.log(document.getElementById(event.target.id).parentElement.parentElement.children);
    var par = document.getElementById(event.target.id).parentElement.parentElement.children;
    var userForm = document.getElementById("usersForm");
    userForm.querySelector("#username").value = par[0].innerText;
    userForm.querySelector("#usertype").value = par[1].innerText;
    userForm.querySelector("#status").selectedIndex = par[2].value;
    
    $("#editUserModal").modal();
} 

//--------------------------------------------------fillSubjectDetailsModal---------------------------------------------

function fillSubjectDetailsModal(event){
    console.log("inside fillsubjectdetailmodal function");
    console.log(event.target.id);
    console.log(document.getElementById(event.target.id).parentElement.parentElement.children);
    var par = document.getElementById(event.target.id).parentElement.parentElement.children;
    var subjectForm = document.getElementById("subjectForm");
    subjectForm.querySelector("#subCode").value = par[0].innerText;
    subjectForm.querySelector("#subName").value = par[1].innerText;
    subjectForm.querySelector("#sem").value = par[2].innerText;
    subjectForm.querySelector("#fac-a").value = par[3].innerText;
    subjectForm.querySelector("#fac-b").value = par[4].innerText;
    
    $("#editSubjectModal").modal();
}

//--------------------------------fillStudentDetailsModal--------------------------------------------

function fillStudentDetailsModal(event){
    console.log("inside fillstudentdetailmodal function");
    console.log(event.target.id);
    console.log(document.getElementById(event.target.id).parentElement.parentElement.children);
    var par = document.getElementById(event.target.id).parentElement.parentElement.children;
    var marksForm = document.getElementById("marksForm");
    marksForm.querySelector("#rollno").value = par[0].innerText;
    marksForm.querySelector("#name").value = par[1].innerText;
    marksForm.querySelector("#sem").value = par[2].innerText;
    marksForm.querySelector("#contact").value = par[3].innerText;
    marksForm.querySelector("#email").value = par[4].innerText;
    marksForm.querySelector("#add").value = par[5].innerText;
    
    $("#editStudentModal").modal();
}

//--------------------------------------------fillMarksDetailsModal------------------------------------------------------


function fillMarksDetailsModal(event){
    console.log("inside fillmarksdetailmodal function");
    console.log(event.target.id);
    console.log(document.getElementById(event.target.id).parentElement.parentElement.children);
    var par = document.getElementById(event.target.id).parentElement.parentElement.children;
    var marksForm = document.getElementById("marksForm");
    marksForm.querySelector("#rollNo").value = par[0].innerText;
    marksForm.querySelector("#sem").value = par[1].innerText;
    marksForm.querySelector("#subjectcode").value = par[2].innerText;
    marksForm.querySelector("#mid-1").value = par[3].innerText;
    marksForm.querySelector("#mid-2").value = par[4].innerText;
    marksForm.querySelector("#mid-3").value = par[5].innerText;
    
    $("#editMarksModal").modal();
}

//---------------------------------------------------------uploadFiles()------------------------------------------------------

var fileNames = [];
function uploadFiles(){
    console.log("uploadFiles executed");
    var files = document.querySelector("#filesForm").querySelector("#file").files;
    if(files.length === 0){
        document.getElementById("fileuploadresult").innerHTML = "<font color=\"red\">Choose Atleast 1 File To Upload.</font>";; 
        setTimeout(function(){
                document.getElementById("fileuploadresult").innerHTML = "";
            },3000);      
        return;
    }
    var formdata = new FormData();
    for(var i=0 ; i<files.length ; i++){
        formdata.append('file',files[i]);
        console.log(files[i].name+' '+files.size);
        fileNames.push(files[i].name);
    }
    ajaxreq = new XMLHttpRequest();
    ajaxreq.open("POST","FileUploadServletController",true);
    // ajaxreq.setRequestHeader("content-type","multipart/form-data");
    // A FormData object can be send as the POST data.
    // The FormData object automatically sets the Content-Type of the HTTP request,
    // depending on the type of the request data. In case of a file,
    // Content-Type of the HTTP request is set as multipart/form-data.
    
    // AJAX request finished
    ajaxreq.addEventListener('load', function(e){
        // request.response will hold the response from the server
        console.log(ajaxreq.response);
        if(ajaxreq.readyState === 4){
            var resp = ajaxreq.responseText;
            if(resp.trim() === "success"){
                document.getElementById("fileuploadresult").innerHTML = "<font color=\"green\">Files Uploaded Successfully.</font>"; 
                document.getElementById("fileDetailsDiv").style.display = "block";
                document.getElementById("filesFormFieldset").disabled = true;
                console.log(fileNames);
                fillFileDetailsForm();
            }else{
                document.getElementById("fileuploadresult").innerHTML = "<font color=\"red\">Error in Uploading Files. Try Again Later.</font>";
            } 
            setTimeout(function(){
                document.getElementById("fileuploadresult").innerHTML = "";
                document.getElementById("uploadProgress").style.display = "none";
            },3000);
        }
    });

    // Upload progress on request.upload
    ajaxreq.upload.addEventListener('progress', function(e){
        document.getElementById("abortrequest").disabled = false;
        document.getElementById("uploadProgress").style.display = "block";
        var percent_complete = (e.loaded / e.total)*100;
        var progress_bar = document.getElementById("uploadProgressBar");
        document.getElementById("fileuploadresult").innerHTML = "<font color=\"green\">" + percent_complete.toPrecision(3) + "%</font>";
        progress_bar.style.width = percent_complete + "%";
        console.log(percent_complete);
    });
    
    ajaxreq.send(formdata);
    console.log("After request for uploading has been sent");
}

var fileDetails = [];
var fileCount = 0;

function fillFileDetailsForm(){
    var fileDetailsForm = document.forms["fileDetailsForm"];
    fileDetailsForm.querySelector("#name").value = fileNames[fileCount];
}

function saveFileDetailsForm(event){
    var form = document.getElementById("fileDetailsForm");
    var name = form.querySelector("#name").value;
    var description = form.querySelector("#description").value;
    var filetype = form.querySelector("#filetype").value;
    var semester = form.querySelector("#sem").value;
    console.log(name+' '+description+' '+filetype+' '+semester);
    fileDetails.push({"name":name,"description":description,"filetype":filetype,"semester":semester});
    fileCount++;
    if(fileCount === fileNames.length){
        document.getElementById("saveFileDetails").disabled = true;
        //document.getElementById("fileDetailsReset").disabled = true;
        submitFileDetails();
    }else if(fileCount < fileNames.length){
        form.reset();
        fillFileDetailsForm();
    }
}

function submitFileDetails(){
    console.log(fileDetails);
    ajaxreq = new XMLHttpRequest();
    ajaxreq.onreadystatechange = function(){
        if(ajaxreq.readyState === 4){
            var resp = ajaxreq.responseText;
            if(resp.trim() === "success"){
                document.getElementById("filedetailssaveresult").innerHTML =  "<font color=\"green\">Details Saved Successfully.</font>"; 
            }else{
                document.getElementById("filedetailssaveresult").innerHTML =  "<font color=\"green\">Error in saving details</font>"; 
            }
            setTimeout(function(){
                document.getElementById("filedetailssaveresult").innerHTML =  "";
                location.reload(true);
            },6000);
        }
    };
    ajaxreq.open("POST","FileUploadServletController",true);
    ajaxreq.setRequestHeader("content-type","application/x-www-form-urlencoded");
    data = JSON.stringify(fileDetails);
    ajaxreq.send("data="+data+"&data_id=details");
    console.log("after request for saving file details have been sent");
}

function abortRequest(){
    ajaxreq.abort();
}
document.querySelector("#filesForm").querySelector("#choose-button").addEventListener("click",function(){
    document.querySelector("#filesForm").querySelector("#file").click();
});

document.querySelector('#filesForm').querySelector("#file").addEventListener('change', function() {
    document.getElementById("fileDetailsDiv").style.display = "none";
    var div = document.querySelector("#filesForm").querySelector("#filesDiv").innerHTML = "";
    var file = this.files;

    var len = file.length;
    console.log("Number Of Files Selected: "+len);
    if(len !== 0){
        var filesNo = document.querySelector("#filesForm").querySelector("#filesNo").innerText = len+" File(s) Selected." ;
        var div = document.querySelector("#filesForm").querySelector("#filesDiv");
//            brkNode = document.createElement("br");
//            div.appendChild(brkNode);
        for(var i=0;i<len;i++){
            var name = file[i].name;
            var node = document.createElement("ul");                 
            var textnode = document.createTextNode(name);         
            node.appendChild(textnode);                              
            div.appendChild(node);
        }
        //div.appendChild(brkNode);
    }
});
