<%-- 
    Document   : Forgot
    Created on : Mar 23, 2019, 2:27:23 PM
    Author     : Shivam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String name = (String) request.getAttribute("name");
    String data;
    boolean result = (boolean)request.getAttribute("result");
    if(result) {
        data = name.toUpperCase()+"*success";
        out.println(data);
    }
    else {
        data = name.toUpperCase()+"*failure";
        out.println(data);
    }
%>