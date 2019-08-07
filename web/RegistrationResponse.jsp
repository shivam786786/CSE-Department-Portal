<%-- 
    Document   : RegistrationResponse
    Created on : Mar 21, 2019, 11:25:01 AM
    Author     : Shivam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
//    String email = (String)request.getAttribute("email");
    String data=null;
    if(request.getAttribute("OTP")!=null) {
         int OTP = (int)request.getAttribute("OTP");
         System.out.println("OTP in response jsp: "+OTP);
         data = OTP + "*";
    }
    String email = (String)request.getAttribute("email");
    boolean registeredUser = (boolean)request.getAttribute("registeredUser");
    boolean userFound = (boolean)request.getAttribute("userFound");
    data+=email+"*";
    
    if(registeredUser) {
        data+="registeredUser";
        //out.println("registeredUser");
        System.out.println("Register User: " + registeredUser);
    }
    else if(userFound) {
        System.out.println("UserFound User: " + userFound);
        data+="userFound";
        //out.println("userFound");
    }
    else {
        data+="nf";
        //out.println("nf");
    }
    out.println(data);
%>