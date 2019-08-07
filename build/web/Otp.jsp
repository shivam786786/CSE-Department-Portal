<%-- 
    Document   : Forgot
    Created on : Mar 22, 2019, 1:28:30 PM
    Author     : Shivam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean findUser = (boolean)request.getAttribute("findUser");
    int OTP = (int) request.getAttribute("OTP");
    System.out.println("inside otp jsp");
    System.out.println(findUser);
    if(findUser) {
        String data = OTP+"*"+"findUser";
        out.println(data);
        System.out.println("findUser");
    }
    else {
        out.println("failure");
    }
    %>