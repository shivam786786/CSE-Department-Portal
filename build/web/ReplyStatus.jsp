<%-- 
    Document   : ReplyStatus
    Created on : Apr 14, 2019, 9:47:21 PM
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
    boolean replyStatus = (boolean) request.getAttribute("replyStatus");
    if(replyStatus)
        out.println("success");
    else 
        out.println("failure");
%>