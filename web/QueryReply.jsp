<%-- 
    Document   : QueryReply
    Created on : Apr 14, 2019, 7:29:42 PM
    Author    : Shivam
--%>
<html>

 <body>
<%@page import="java.util.Iterator"%>
<%@page import="modulecatalog.dto.QueryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = (String) session.getAttribute("username");
    
    if(username == null) {
        session.invalidate();
        response.sendRedirect("Accessdenied.html");
        return;
    }
    QueryDTO queryObj = null;
    int i=0;
    ArrayList<QueryDTO> queryData = (ArrayList) request.getAttribute("queryData");
    
    if(queryData.size() != 0) {
    System.out.println("query data inside jsp"  + queryData);
    Iterator<QueryDTO> it = queryData.iterator();
    StringBuffer data = new StringBuffer("<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12' style='margin-top:30px; width:100%;'>");
    data.append("<label class='text-danger'><h4>- All the Queries are as Follows :</h4></label>");
    data.append("<table id='queryReplayTable' class='table table-bordered table-hover table-responsive'>");
    data.append("<thead class='thead-dark'>");
    data.append("<tr><th>Sr.No.</th><th>Topic</th><th>Asked By</th><th>Replay</th><th>Status</th></tr></thead>");
    data.append("<tbody>");
    while(it.hasNext()) {
             
        queryObj = it.next();
         System.out.println(queryObj);
         if(queryObj.getAnswer() == null)
                data.append("<tr><div class='form-group'><td><label>"+queryObj.getId()+"</label></td><td><label for='topicc'>"+queryObj.getTopic()+"</label></td><td><label for='name'>"+queryObj.getAskesdby()+"</label></td><td><a role='button' class='btn btn-md btn-success'   href='#' onclick = showQueryDetail('"+queryObj.getId()+"')>Give Answer</a></td><td class='text-danger'><strong>Not Answered</strong></td></div></tr>");
         else 
                data.append("<tr><div class='form-group'><td><label>"+queryObj.getId()+"</label></td><td><label for='topic'>"+queryObj.getTopic()+"</label></td><td><label for='name'>"+queryObj.getAskesdby()+"</label></td><td><a role='button' class='btn btn-md btn-success'   href='#' onclick = showQueryDetail('"+queryObj.getId()+"')>Modify Answer</a></td><td class='text-success'><strong>Answered</strong></td></div></tr>");    
    }
    data.append("</tbody></table></div>");
    out.print(data);
    }
    else {
        out.println("No Queries are present for you...!");
    }
%>
 </body>
</html>