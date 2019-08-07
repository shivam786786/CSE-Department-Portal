
<%
    System.out.println("reached in addmodule");
boolean result=(Boolean)request.getAttribute("ans");
System.out.println("result"+result);
String res=null;
if(result)
{
    System.out.println("if ");
res="success";
}
else
{
res="error";
}
System.out.println("res is:"+res);
out.println(res);
%>