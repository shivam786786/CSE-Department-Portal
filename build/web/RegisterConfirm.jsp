<%-- 
    Document   : RegisterConfirm
    Created on : Mar 25, 2019, 1:59:01 PM
    Author     : Shivam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean confirm = (boolean)request.getAttribute("check");
    if(confirm) {
         System.out.println("check in jsp: "+ confirm);
         out.println("success");
    }
       
    else  {
        System.out.println("check in jsp: "+ confirm);
        out.println("failure");
    }
%>
