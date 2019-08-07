<%-- 
    Document   : showQueryDetails
    Created on : Apr 24, 2019, 6:43:56 PM
    Author     : Shivam
--%>

<%@page import="modulecatalog.dto.QueryDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 QueryDTO query = (QueryDTO) request.getAttribute("query");
 StringBuffer queryDataModal = null;
 if(query.getAnswer() != null) {
 queryDataModal = new StringBuffer("<div id='studentReplayStatusModal' class='modal fade'  role='dialog' style='overflow-y: auto;'>");
 queryDataModal.append("<div class='modal-dialog modal-md modal-dialog-centered'>");
queryDataModal.append("<div class='modal-content '>");
 queryDataModal.append("<div class='modal-header text-center bg-success'>");
queryDataModal.append("<h4 class='modal-title text-white  text-center'> <i class='fas fa-chalkboard-teacher'></i>&nbsp;&nbsp;&nbsp;Your Query with Solution</h4>");
 queryDataModal.append("<button type='button' class='close' data-dismiss='modal'>&times;</button></div>");
queryDataModal.append("<div class='modal-body'>");
queryDataModal.append("<form id='queryReplay' role='form'>");
 queryDataModal.append("<label class='text-danger'><h4>- Topic :</h4></label>");
queryDataModal.append("<div class='form-group'> ");
queryDataModal.append("<input type='text' class='form-control' placeholder='"+query.getTopic()+"' readonly> </div>");

 queryDataModal.append("<label class='text-danger'><h4>- Your Question Was :</h4></label>");
queryDataModal.append("<div class='form-group'> ");
queryDataModal.append("<input type='text' class='form-control' placeholder='"+query.getQuestion()+"' readonly> </div>");

 queryDataModal.append("<label class='text-danger'><h4>- Answer is :</h4></label>");
queryDataModal.append("<div class='form-group'> ");
queryDataModal.append("<input type='text' class='form-control' value='"+query.getAnswer()+"' readonly> </div>");

 queryDataModal.append("<label class='text-danger'><h4>- Solved By :</h4></label>");
queryDataModal.append("<div class='form-group'> ");
queryDataModal.append("<input type='text' class='form-control' placeholder='"+query.getAnsweredby()+"' readonly> </div>");

queryDataModal.append("<div class='form-group'> ");
queryDataModal.append("<input type='button' class='btn btn-lg btn-success btn-block' data-toggle='modal' data-dismiss='modal' data-target='#askQuerySuccessModal' value='Close'> </div> </form> </div>");

queryDataModal.append("<div class='modal-footer bg-light text-center '>");
queryDataModal.append("<button type='button' class='btn btn-danger btn-md' data-dismiss='modal'> Close</button> </div></div></div></div>");
out.println(queryDataModal);
 }
 else {
     out.println("failure");
 }
 
%>