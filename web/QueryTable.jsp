<%-- 
    Document   : QueryTable
    Created on : Apr 24, 2019, 3:55:27 PM
    Author     : Shivam
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modulecatalog.dto.QueryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    System.out.println("reacghed in query jsp");
    ArrayList<QueryDTO> query = (ArrayList) request.getAttribute("query");
    System.out.println("inside jsppppp: "+ query);
    if(query.size()==0) {
        out.println("There is no Query Present in our Database for this subject");
    }
    else {
        StringBuffer table = new StringBuffer("<table id='replayStatusTable' class='table table-bordered table-striped table-hover table-responsive' style='width:100%'>");
        table.append("<thead class='thead-dark'>");
        table.append("<tr><th>Sr. No.</th><th>Topic </th><th>Time Stamp</th><th>Status</th></tr></thead><tbody><tr>");
        Iterator<QueryDTO> it = query.iterator();
        while(it.hasNext()) {
            
            QueryDTO q = it.next();
            if(q.getAnswer() != null) {
                table.append("<div class='form-group'><td><label>"+q.getId()+"</label></td><td><label for='topic'>"+q.getTopic()+"</label></td><td><label for='timestamp'>"+q.getTimestamp()+"</label></td><td><label for='replayStatus'><a  data-dismiss='modal' href = '#'  onclick=showQueryResult('"+q.getId()+"') class='text-success text-decoration-none'><strong>Answered</strong></a></td></div></tr>");
            }   
            else {
                table.append("<div class='form-group'><td><label>"+q.getId()+"</label></td><td><label for='topic'>"+q.getTopic()+"</label></td><td><label for='timestamp'>"+q.getTimestamp()+"</label></td><td><label for='replayStatus'><a  data-toggle='modal' data-dismiss='modal' data-target='#notAnsweredModal' class='text-danger text-decoration-none'><strong>Not-Answered</strong></a></td></div></tr>");
            }
           
    }       table.append("</tbody></table>");
        out.println(table);
    }
%>
