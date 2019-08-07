<%
    
String usertype=(String)request.getAttribute("usertype");
Boolean changed=(boolean)request.getAttribute("changed");
System.out.println("changed:"+changed);
if(changed==true)
{
if(usertype.equalsIgnoreCase("student"))
{
    System.out.println("inside");
out.println(changed);


}
else if(usertype.equalsIgnoreCase("faculty"))
{
    System.out.println("inside");
out.println(changed);
}
}
else
{
out.println("error");
}

%>