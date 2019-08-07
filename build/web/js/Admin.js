/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
