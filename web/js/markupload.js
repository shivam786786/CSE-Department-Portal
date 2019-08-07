/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 var marksArray=[];
    var rollArray=[];
var result;
var midsem1;
var s;

function setmarks(midsem,size)
{    var ans=setmark();
    s=size;
   midsem1=midsem;
alert(midsem1);
    if(!ans)
     {
         return;
     }
     requestsend();
}
function setmark()
{result=true;
  
    
    
    var getLabel=document.getElementsByClassName("success");
     for(var i=0;i<getLabel.length;i++){
      var getLabelElements=getLabel[i];
    rollArray[i]=getLabelElements.textContent; 
alert(rollArray[i]);
if(rollArray[i]=="undefined")
{
    alert("Roll No for this sem is not available....Contact Admin to Resolve the issue");
       result=false;
       return;     
}
var getMark=$("#"+rollArray[i]).val();
    alert(getMark);
    if(getMark=="")
    {
    $("#"+rollArray[i]).val("0");
       alert("Sending null value is not allowed....Fill the marks as 0");
       result=false;
       return;    
    }
   if(getMark>30)
   {
       $("#"+rollArray[i]).val("");
       alert("Marks shouldn't be more than 30");
       result=false;
       return result;
   }
    marksArray[i]=getMark;
    
}
return result;
}

function requestsend()
{
     
 alert('midsem is'+midsem1);             
    alert("reached");
 var dat=[];
 for(var i=0;i<s;i++)
 {
     dat.push({label: rollArray[i],value: marksArray[i]},);
     alert(dat[i].label);
 }
sem=$("#sem").val();
subject=$("#subject").val();

       $.ajax({
         
            url: "MarksUploadServlet",

            type: "get",
            contentType: 'application/json',
            dataType: 'JSON',
            data:{
                dat:JSON.stringify(dat),
                result:result,
                sem:sem,
                subject:subject,
                midsem1:midsem1
               
            },

            cache: false,
            timeout: 600000,
            success: function(response, status, xhr){
                alert("response is"+response);
              alert("Changes Saved");
                   
                   

                

            },
            error: function(response,status,xhr){
                alert("response is"+response);
                     
                         $("#UploadMarksSuccessModal").modal('toggle');


                
                

            }
            });  
                        }
          

