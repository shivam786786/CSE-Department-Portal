/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 var mid1marksArray=[];
  var mid2marksArray=[];
 var mid3marksArray=[];

    var rollArray=[];
var result;
var s,sem,subject;

function setmarks(size,se,sub)
{   s=size;
    sem=se;
    subject=sub;
    var ans=setmark();
  
    if(!ans)
     {
         return;
     }
     requestsend();
}
function setmarks1(size,se,sub)
{   s=size;
    sem=se;
    subject=sub;
    var ans=setmark1();
  
    if(!ans)
     {
         return;
     }
     requestsend1();
}
function setmarks2(size,se,sub)
{   s=size;
    sem=se;
    subject=sub;
    var ans=setmark2();
  
    if(!ans)
     {
         return;
     }
     requestsend2();
}
function setmarks3(size,se,sub)
{   s=size;
    sem=se;
    subject=sub;
    var ans=setmark3();
  
    if(!ans)
     {
         return;
     }
     requestsend3();
}








function setmark()
{result=true;
  
    
    
    var getLabel=document.getElementsByClassName("success");
     for(var i=0;i<s;i++){
      var getLabelElements=getLabel[i];
    rollArray[i]=getLabelElements.textContent; 
//alert(rollArray[i]);
if(rollArray[i]=="undefined")
{
    alert("Roll No for this sem is not available....Contact Admin to Resolve the issue");
       result=false;
       return;     
}
var getmid1Mark=$("#"+rollArray[i]+"one").val();
var getmid2Mark=$("#"+rollArray[i]+"two").val();
var getmid3Mark=$("#"+rollArray[i]+"three").val();

    
    if(getmid1Mark==""||getmid2Mark==""||getmid3Mark=="")
    {
        if(getmid1Mark=="")
        {
           $("#"+rollArray[i]+"one").val("0");
     alert("Sending null value is not allowed....Fill the marks as 0");
       result=false; 
        }
        else if(getmid2Mark=="")
        {
           $("#"+rollArray[i]+"two").val("0");
      alert("Sending null value is not allowed....Fill the marks as 0");
       result=false;   
        }
        else
        {
             $("#"+rollArray[i]+"three").val("0");
       alert("Sending null value is not allowed....Fill the marks as 0");
       result=false; 
        }
       return result;    
    }
   if(getmid1Mark>30||getmid2Mark>30||getmid3Mark>30)
   {
       if(getmid1Mark>30)
       {
       $("#"+rollArray[i]+"one").val("");
       alert("Marks shouldn't be more than 30");
       result=false;
   }
   else if(getmid2Mark>30)
   {
        $("#"+rollArray[i]+"two").val("");
       alert("Marks shouldn't be more than 30");
       result=false;
   }
   else
   {
        $("#"+rollArray[i]+"three").val("");
       alert("Marks shouldn't be more than 30");
       result=false;
   }
       return result;    
       
       
   }
    mid1marksArray[i]=getmid1Mark;
    mid2marksArray[i]=getmid2Mark;
    mid3marksArray[i]=getmid3Mark;

    
}
return result;
}

function setmark1()
{result=true;
  
    
    
    var getLabel=document.getElementsByClassName("success");
     for(var i=0;i<s;i++){
      var getLabelElements=getLabel[i];
    rollArray[i]=getLabelElements.textContent; 
//alert(rollArray[i]);
if(rollArray[i]=="undefined")
{
    alert("Roll No for this sem is not available....Contact Admin to Resolve the issue");
       result=false;
       return;     
}
var getmid1Mark=$("#"+rollArray[i]+"one").val();
if(getmid1Mark=="")
    {
                  $("#"+rollArray[i]+"one").val("0");
       alert("Sending null value is not allowed....Fill the marks as 0");
       result=false; 
          
        
       return result;    
    }
   if(getmid1Mark>30)
   {
       
       $("#"+rollArray[i]+"one").val("");
       alert("Marks shouldn't be more than 30");
       result=false;
       return result;
  }
    mid1marksArray[i]=getmid1Mark;    
}
return result;
}

function setmark2()
{result=true;
  
    
    
    var getLabel=document.getElementsByClassName("success");
     for(var i=0;i<s;i++){
      var getLabelElements=getLabel[i];
    rollArray[i]=getLabelElements.textContent; 
//alert(rollArray[i]);
if(rollArray[i]=="undefined")
{
    alert("Roll No for this sem is not available....Contact Admin to Resolve the issue");
       result=false;
       return;     
}
var getmid2Mark=$("#"+rollArray[i]+"two").val();
if(getmid2Mark=="")
    {
                  $("#"+rollArray[i]+"two").val("0");
       alert("Sending null value is not allowed....Fill the marks as 0");
       result=false; 
          
        
       return result;    
    }
   if(getmid2Mark>30)
   {
       
       $("#"+rollArray[i]+"two").val("");
       alert("Marks shouldn't be more than 30");
       result=false;
       return result;
  }
    mid2marksArray[i]=getmid2Mark;    
}
return result;
}

function setmark3()
{result=true;
  
    
    
    var getLabel=document.getElementsByClassName("success");
     for(var i=0;i<s;i++){
      var getLabelElements=getLabel[i];
    rollArray[i]=getLabelElements.textContent; 
//alert(rollArray[i]);
if(rollArray[i]=="undefined")
{
    alert("Roll No for this sem is not available....Contact Admin to Resolve the issue");
       result=false;
       return;     
}
var getmid3Mark=$("#"+rollArray[i]+"three").val();
if(getmid3Mark=="")
    {
                  $("#"+rollArray[i]+"three").val("0");
       alert("Sending null value is not allowed....Fill the marks as 0");
       result=false; 
          
        
       return result;    
    }
   if(getmid3Mark>30)
   {
       
       $("#"+rollArray[i]+"three").val("");
       alert("Marks shouldn't be more than 30");
       result=false;
       return result;
  }
    mid3marksArray[i]=getmid3Mark;    
}
return result;
}







function requestsend()
{
     
              
    alert("reached");
 var dat=[];
 for(var i=0;i<s;i++)
 {alert("inside");
     dat.push({label:rollArray[i],value1:mid1marksArray[i],value2:mid2marksArray[i],value3:mid3marksArray[i]},);
 alert(dat[i].label);
  alert(dat[i].value1);
 alert(dat[i].value2);
 alert(dat[i].value3);

    }


       $.ajax({
         
            url: "ViewResultServlet",

            type: "get",
            contentType: 'application/json',
            dataType: 'JSON',
            data:{
                dat:JSON.stringify(dat),
                result:result,
                sem:sem,
                subject:subject,
               
               
            },

            cache: false,
            timeout: 600000,
            success: function(){

              alert("Changes Saved");
                   
                   

                

            },
            error: function(e){

                            alert("Some Error Occured!!!Contact Developers to resolve the issue");

                
                

            }
            });  
                        }
          
function requestsend1()
{
     
              var midsem="1";
    alert("reached");
 var dat=[];
 for(var i=0;i<s;i++)
 {alert("inside");
     dat.push({label:rollArray[i],value:mid1marksArray[i]},);
 alert(dat[i].label);
  alert(dat[i].value);
 
    }


       $.ajax({
         
            url: "EditMarksServlet",

            type: "get",
            contentType: 'application/json',
            dataType: 'JSON',
            data:{
                dat:JSON.stringify(dat),
                result:result,
                sem:sem,
                subject:subject,
               midsem:midsem
               
            },

            cache: false,
            timeout: 600000,
            success: function(){

              alert("Changes Saved");
                   
                   

                

            },
            error: function(e){

                            alert("Some Error Occured!!!Contact Developers to resolve the issue");

                
                

            }
            });  
                        }
                        
                        
                        
 function requestsend2()
{
     
              var midsem="2";
    alert("reached");
 var dat=[];
 for(var i=0;i<s;i++)
 {alert("inside");
     dat.push({label:rollArray[i],value:mid2marksArray[i]},);
 alert(dat[i].label);
  alert(dat[i].value);
 
    }


       $.ajax({
         
            url: "EditMarksServlet",

            type: "get",
            contentType: 'application/json',
            dataType: 'JSON',
            data:{
                dat:JSON.stringify(dat),
                result:result,
                sem:sem,
                subject:subject,
               midsem:midsem
               
            },

            cache: false,
            timeout: 600000,
            success: function(){

              alert("Changes Saved");
                   
                   

                

            },
            error: function(e){

                            alert("Some Error Occured!!!Contact Developers to resolve the issue");

                
                

            }
            });  
                        } 



function requestsend3()
{
     
              var midsem="3";
    alert("reached");
 var dat=[];
 for(var i=0;i<s;i++)
 {alert("inside");
     dat.push({label:rollArray[i],value:mid3marksArray[i]},);
 alert(dat[i].label);
  alert(dat[i].value);
    }


       $.ajax({
         
            url: "EditMarksServlet",

            type: "get",
            contentType: 'application/json',
            dataType: 'JSON',
            data:{
                dat:JSON.stringify(dat),
                result:result,
                sem:sem,
                subject:subject,
               midsem:midsem
               
            },

            cache: false,
            timeout: 600000,
            success: function(){

              alert("Changes Saved");
                   
                   

                

            },
            error: function(e){

                            alert("Some Error Occured!!!Contact Developers to resolve the issue");

                
                

            }
            });  
                        }
