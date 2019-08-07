<%
    System.out.println("reached in addmodule");
boolean result=(Boolean)request.getAttribute("ans");
System.out.println("result"+result);
if(result)
{
    System.out.println("if ");
out.println("success");
}
else
{
out.println("error");
}

%>

