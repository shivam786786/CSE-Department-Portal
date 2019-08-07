<%-- 
    Document   : Query
    Created on : Apr 13, 2019, 11:52:51 PM
    Author     : Shivam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    String username = (String) session.getAttribute("username");
    
    if(username == null) {
        session.invalidate();
        response.sendRedirect("Accessdenied.html");
        return;
    }
    boolean result = (boolean) request.getAttribute("result");
    if(result) 
       out.println("success");
    else
        out.println("faiure");
    

%>
