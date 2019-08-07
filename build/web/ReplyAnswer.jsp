<%-- 
    Document   : ReplyAnswer
    Created on : Apr 24, 2019, 1:13:47 PM
    Author     : Shivam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  boolean result = (boolean) request.getAttribute("result");
  if(result) {
      out.println("success");
  }
  else {
      out.print("failure");
  }

%>