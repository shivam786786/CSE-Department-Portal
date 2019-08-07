
<%
    
Boolean result=(Boolean)request.getAttribute("result");
String username=(String)request.getAttribute("username");
String usertype=(String)request.getAttribute("usertype");
String password=(String)request.getAttribute("password");
String time_stamp = (String) request.getAttribute("time_stamp");

System.out.println("usertype:"+usertype);
System.out.println("result"+result + "time stamppp" + time_stamp);
if(result==true&&usertype.equalsIgnoreCase("Student"))
        {
        String url="StudentControllerServlet;jsessionid="+session.getId();
       
        HttpSession sess=request.getSession();
        
        sess.setAttribute("username",username);
        sess.setAttribute("password",password);
        sess.setAttribute("usertype",usertype);
        sess.setAttribute("time_stamp", time_stamp);
        out.println(url);
        
        }
else if(result==true&&usertype.equalsIgnoreCase("ADMIN"))
{     System.out.println("yes");
     String url="AdminControllerServlet;jsessionid="+session.getId();
        

        HttpSession sess=request.getSession();
        
        sess.setAttribute("username",username);
        sess.setAttribute("password",password);
        sess.setAttribute("usertype",usertype);
         sess.setAttribute("time_stamp", time_stamp);
        out.println(url);
}
else if(result==true&&usertype.equalsIgnoreCase("faculty"))
{     System.out.println("yes");
     String url="FacultyControllerServlet;jsessionid="+session.getId();
           
   HttpSession sess=request.getSession();


sess.setAttribute("username",username);
               sess.setAttribute("password",password);
        sess.setAttribute("usertype",usertype);
       
         sess.setAttribute("time_stamp", time_stamp);

        out.println(url);
}

else
{
out.println("error");
}






%>
